<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/21
 * Time: 18:35
 */

namespace app\app\controller;

use think\Db;
use think\Request;

class Member extends Base
{
    /**
     * @desc 用户注册
     * @author wangchunjing
     */
    public function register()
    {
        $smscode = input("request.smscode");
        if(! $smscode)
        {
            return ajaxmsg("验证码不能为空，请重新发送", 0);
        }
        elseif($smscode != session('smscode'))
        {
            return ajaxmsg("验证码不正确，请重新发送", 0);
        }
        if (!input("request.mobile"))
        {
            return ajaxmsg("手机号不能为空", 0);
        }
        if (!input("request.password"))
        {
            return ajaxmsg("请输入密码", 0);
        }
        $deviceid = input("request.deviceid",'wap');
        $data['mobile'] = input("request.mobile");
        $data['username'] = '游客' .  $data['mobile'];
        $data['password'] = md5(trim(input("request.password")));
        $data['create_time'] = time();
        $data['pid'] = input("request.pid",0);

        $mobile = Db::name('member')->value('mobile');
        if($data['mobile'] == $mobile){
            return ajaxmsg('该手机号已注册过',0);
        }

        $mid = Db::name('member')->insertGetId($data);
        if ($mid > 0)
        {
            $token = $this->auto_login($mid, $data['mobile']);
            $tid = Db::name('tokens')->insertGetId(array('mid' => $mid, 'deviceid' => $deviceid, 'token' => $token));//注册token
            if ($tid > 0)
            {
                $member_info = Db::name('member')->where("id={$mid}")->find();
                $member_info['token'] = $token;
                return ajaxmsg('注册成功', 1, $member_info);
            }
            else
            {
                Db::name('member')->where("id={$mid}")->delete();
                return ajaxmsg('注册失败', 0);
            }

        } else {
            return ajaxmsg('注册失败', 0);
        }

    }

    /**
     * @desc 短信验证码接口
     * @author wangchunjing
     */

    public function sendsms()
    {
        $mobile = input("request.mobile");

        if(preg_match("/^1\d{10}$/",$mobile))
        {
            if(Db::name("member")->where("mobile",$mobile)->count())
            {
                return ajaxmsg('该手机号已注册',0);
            }
            else
            {
                // 生成4位随机数，左侧补0
                $smscode = str_pad(random_int(1, 9999), 4, 0, STR_PAD_LEFT);
                //var_dump($smscode);
                $content = "[当当商城]您的验证码是{$smscode}，有效期是2分钟，请勿泄露他人";
                $res = smsbao($smscode,$content,$mobile);
                if($res == 'ok')
                {
                    return ajaxmsg('发送成功',1);
                }
                else
                {
                    return ajaxmsg('发送失败',0);
                }

            }
        }
        else
        {
            return ajaxmsg('手机号有误',0);
        }
    }

    /**
     * @desc 用户登录
     * @author wangchunjing
     */
    public function login()
    {
        $deviceid = trim(input("request.deviceid"));
        $mobile = trim(input("request.mobile"));
        $password = trim(input("request.password"));
        if(! $mobile)
        {
            return ajaxmsg('请输入手机号',0);
        }
        if (! $password)
        {
            return ajaxmsg('请输入密码',0);
        }

        $map['mobile'] = input("request.mobile");
        $map['password'] = md5(trim(input("request.password")));
        $member_info = Db::name('member')->where($map)->find();
        if ($member_info)
        {
            $mid = $member_info['id'];
            $token = $this->auto_login($mid, $mobile);
            $tokens = Db::name('tokens')->where('mid',$mid)->find();
            if ($tokens)
            {
                Db::name('tokens')->where('mid',$mid)->update(array('deviceid' => $deviceid, 'token' => $token));
            }
            else
            {
                Db::name('tokens')->insert(array('mid' => $mid, 'deviceid' => $deviceid, 'token' => $token));

            }
            $member_info['token'] = $token;
            //$member_info['area_agent_count'] = Db::name('area_agent')->where('mid',$mid)->where('status',1)->count('id');//代理区域数量
            //$member_info['area_deliveryman_id'] = Db::name('area_deliveryman')->where('mid',$mid)->where('status',1)->value('id');//业务员ID
            return ajaxmsg('登录成功',1,$member_info);
        }
        else
        {
            return ajaxmsg('账号或密码错误',0);
        }
    }


    /**
     * @desc 重置密码
     * @author wangchunjing
     */

    public function reset_sendsms()
    {
        $mobile = input("request.mobile");
        if(preg_match("/^1\d{10}$/",$mobile))
        {
            if(Db::name("member")->where('mobile',$mobile)->count()) {
                // 生成4位随机数，左侧补0
                $smscode = str_pad(random_int(1, 9999), 4, 0, STR_PAD_LEFT);
                $content = "[当当商城]您的验证码是{$smscode}，有效期是2分钟，请勿泄露他人";
                $res =smsbao($smscode,$content,$mobile);
                if($res == 'ok') return ajaxmsg('发送成功',1);
                return ajaxmsg('发送失败',0);

            } else {
                return ajaxmsg('手机号不存在',0);
            }
        } else {
            return ajaxmsg('手机号有误',0);
        }

    }

    /**
     * @desc 找回密码
     * @author wangchunjing
     */

    public function resetPassword()
    {
        $map['mobile'] = trim(input("request.mobile"));
        if(input("request.smscode") != session('smscode')){
            return ajaxmsg('验证码不准确',0);
        }
        $password = md5(trim(input("request.password")));
        $result = Db::name("member")->where($map)->setField('password', $password);//重置密码
        if($result) return ajaxmsg('密码设置成功',1);
        return ajaxmsg('密码设置失败',0);
    }

    /**
     * @desc 修改密码
     * @author wangchunjing
     */

    public function updatePassword()
    {
        $map['id'] =$this->is_login();
        $map['password'] = md5(trim(input("request.password")));
        $new_pass = md5(trim(input("request.new_password")));
        if(Db::name("member")->where($map)->find()){
            Db::name("member")->where('id',$map['id'])->update(array('password'=>$new_pass));
            return ajaxmsg('密码修改成功',1);
        }else{
            return ajaxmsg('密码有误，重新填写',0);
        }
    }

    /**
     * @desc 个人中心
     * @author wangchunjing
     */

    public function user_center()
    {
        $mid = $this->is_login();

        $member = Db::name('member')->where('id',$mid)->where('status',1)->find();
        /*代理区域数量*/
        //$member['area_agent_count'] = Db::name('area_agent')->where('mid',$mid)->where('status',1)->count('id');
        /*业务员ID*/
        //$member['area_deliveryman_id'] = Db::name('area_deliveryman')->where('mid',$mid)->where('status',1)->value('id');
        /*待付款*/
        $member['order_count0'] = Db::name('order')->where('mid',$mid)->where('status',0)->count('id')?:'暂无待付款订单';
        /*待收货*/
        $member['order_count1'] = Db::name('order')->where('mid',$mid)->where('status',1)->count('id')?:'暂无待收货订单';

        return ajaxmsg('用户中心',1,$member);
    }

    /**
     * @desc 修改用户名
     * @author wangchunjing
     */

     public function update_username()
    {
        $mid = $this->is_login();
        $username = input("request.username");
        if(! $username){
            return ajaxmsg('请输入用户名',0);
        }
        if(Db::name('member')->where('id',$mid)->where('username',$username)->find()){
            return ajaxmsg('用户名被占用',0);
        }else{
            if(Db::name('member')->where('id',$mid)->update(array('username'=>$username))){
                return ajaxmsg('用户名已修改',1);
            }else{
                return ajaxmsg('用户名修改失败',0);
            }

        }
    }





}