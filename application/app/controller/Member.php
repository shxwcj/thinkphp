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
     * 用户注册
     * @author wangchunjing
     *
     */
    public function register()
    {
        $smscode = input("request.smscode");
        if ($smscode != session('smscode'))
        {
            return ajaxmsg("验证码不正确，请重新发送", 0);
        }
        if (!input("request.mobile"))
        {
            return ajaxmsg("手机号不能为空", 0);
        }
        $deviceid = input("request.deviceid",'wap');
        $data['mobile'] = input("request.mobile");
        $data['username'] = '游客' .  $data['mobile'];
        $data['password'] = md5(trim(input("request.password")));
        $data['create_time'] = time();
        $data['pid'] = input("request.pid",0);
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
     * 短信验证码接口
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
                var_dump($smscode);
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
     * 用户登录
     * @author wangchunjing
     */
    public function login()
    {

    }




















}