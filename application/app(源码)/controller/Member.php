<?php
/**
 * Created by PhpStorm.
 * User: 835173372@qq.com
 * NickName: 半城村落
 * Date: 2016/11/2 10:42
 */
namespace app\app\controller;

use think\Db;

class Member extends Base
{

    public function user_center()
    {
        $mid = $this->is_login();
        $member = Db::name('member')->where("id={$mid} and status=1")->find();
        $member['area_agent_count'] = Db::name('area_agent')->where("mid={$mid} and status=1")->count('id');//代理区域数量
        $member['area_deliveryman_id'] = Db::name('area_deliveryman')->where("mid={$mid} and status=1")->value('id');//业务员ID
        $member['order_count0'] = Db::name('order')->where("mid={$mid} and status=0")->count('id');//待付款
        $member['order_count1'] = Db::name('order')->where("mid={$mid} and status=1")->count('id');//待收货
        ajaxmsg('true', 1, $member);
    }
    public function update_username(){
        $mid = $this->is_login();
        $username = input('username');
        $count = Db::name('member')->where("id!={$mid} and username='{$username}'")->count();
        if($count > 0){
            ajaxmsg('用户名被占用', 0);
        }
        Db::name('member')->where("id={$mid}")->update(array('username'=>$username));
        ajaxmsg('修改成功', 1);
    }

    //注册
    public function register()
    {
        $smscode = input("request.smscode");
        if ($smscode != session('smscode')) {
            ajaxmsg("验证码不正确，请重新发送", 0);
        }
        if (!input("request.mobile")) {
            ajaxmsg("手机号不能为空", 0);
        }
        $deviceid = input("request.deviceid",'wap');
        $data['mobile'] = input("request.mobile");
        $data['username'] = 'lewen-' . time();
        $data['password'] = md5(trim(input("request.password")));
        $data['create_time'] = time();
        $data['pid'] = input("request.pid",0);
        $mid = Db::name('member')->insertGetId($data);
        if ($mid > 0) {
            $token = $this->auto_login($mid, $data['mobile']);
            $tid = Db::name('tokens')->insertGetId(array('mid' => $mid, 'deviceid' => $deviceid, 'token' => $token));//注册token
            if ($tid > 0) {
                $member_info = Db::name('member')->where("id={$mid}")->find();
                $member_info['token'] = $token;
                ajaxmsg('注册成功', 1, $member_info);
            } else {
                Db::name('member')->where("id={$mid}")->delete();
                ajaxmsg('注册失败', 0);
            }

        } else {
            ajaxmsg('注册失败', 0);
        }

    }

    //登录
    public function login()
    {
        $deviceid = trim(input("request.deviceid"));
        $mobile = trim(input("request.mobile"));
        $password = trim(input("request.password"));
        if (!$mobile) {
            ajaxmsg('请输入账号', 0);
        }
        if (!$password) {
            ajaxmsg('请输入密码', 0);
        }
        $map['mobile'] = input("request.mobile");
        $map['password'] = md5(trim(input("request.password")));
        $member_info = Db::name('member')->where($map)->find();
        if ($member_info) {
            $mid = $member_info['id'];
            $token = $this->auto_login($mid, $mobile);
            $tokens = Db::name("tokens")->where("mid={$mid}")->find();
            if ($tokens) {
                Db::name("tokens")->where("mid={$mid}")->update(array('deviceid' => $deviceid, 'token' => $token));
            } else {
                Db::name("tokens")->insert(array('mid' => $mid, 'deviceid' => $deviceid, 'token' => $token));
            }
            $member_info['token'] = $token;
            $member_info['area_agent_count'] = Db::name('area_agent')->where("mid={$mid} and status=1")->count('id');//代理区域数量
            $member_info['area_deliveryman_id'] = Db::name('area_deliveryman')->where("mid={$mid} and status=1")->value('id');//业务员ID
            ajaxmsg('登录成功', 1, $member_info);
        } else {
            ajaxmsg('账号或密码错误', 0);
        }
    }

    //注册短信发送接口
    public function sendsms()
    {
        $mobile = input("request.mobile");
        if (preg_match("/^1\d{10}$/", $mobile)) {
            $count = Db::name("member")->where("mobile={$mobile}")->count();
            if ($count) {
                ajaxmsg("手机号已经被占用", 0);
            } else {
                $smscode = mt_rand(1111,9999);
                $content = "[乐文易购]验证码是{$smscode}，验证码有效期2分钟";
                $res = smsbao($smscode, $content, $mobile);
                //ajaxmsg("发送成功", 1);//模拟测试
                if ($res == 'ok') {
                    ajaxmsg("发送成功", 1);
                } else {
                    ajaxmsg("发送失败", 0);
                }
            }
        } else {
            ajaxmsg("手机号格式不正确", 0);
        }
    }
    //检查注册手机号是否有效
    public function check_mobile(){
        $mobile = input("request.mobile");
        $count = Db::name("member")->where("mobile='{$mobile}'")->count();
        if ($count) {
            ajaxmsg("手机号已经被占用", 0);
        } else {
            ajaxmsg("true", 1);
        };
    }

    //重置密码发送短信
    public function resetPassword_sendsms()
    {
        $mobile = input("request.mobile");
        if (preg_match("/^1\d{10}$/", $mobile)) {
            $count = Db::name("member")->where("mobile={$mobile}")->count();
            if ($count > 0) {
                $smscode = mt_rand(1111,9999);
                $content = "[乐文易购]验证码是{$smscode}，验证码有效期2分钟";
                $res = smsbao($smscode, $content, $mobile);
                //ajaxmsg("发送成功", 1);//模拟测试
                if ($res == 'ok') {
                    ajaxmsg("发送成功", 1);
                } else {
                    ajaxmsg("发送失败", 0);
                }
            } else {
                ajaxmsg("手机号不存在", 0);
            }
        } else {
            ajaxmsg("手机号格式不正确", 0);
        }
    }

    //找回密码
    public function resetPassword()
    {
        $map['mobile'] = trim(input("request.mobile"));
        if (input("request.smscode") != session('smscode')) {
            ajaxmsg("验证码不正确，请重新发送", 0);
        }
        $password = md5(trim(input("request.password")));
        $result = Db::name("member")->where($map)->setField('password', $password);  //重置密码
        if ($result) {
            ajaxmsg('设置成功，重新登录', 1);
        } else {
            ajaxmsg('设置失败，稍后再试', 0);
        }
    }

    //修改密码
    public function updatePassword()
    {
        $map['id'] = $this->is_login();
        $map['password'] = md5(trim(input("request.old_password")));
        $new_password = md5(trim(input("request.new_password")));
        $count = Db::name("member")->where($map)->count();
        if ($count > 0) {
            Db::name("member")->where("id={$map['id']}")->update(array('password' => $new_password));
            ajaxmsg('修改密码成功', 1);
        } else {
            ajaxmsg('当前密码输入错误，请重新输入', 0);
        }
    }

    //地址列表
    public function list_address()
    {
        $mid = $this->is_login();
        $list = Db::name("member_address")->where("mid={$mid}")->select();
        if (count($list) > 0) {
            ajaxmsg('true', 1, $list);
        } else {
            ajaxmsg('true', 1);
        }
    }

    //添加地址
    public function add_address()
    {
        $mid = $this->is_login();
        $name = input('request.name', '');
        $mobile = input('request.mobile', '');
        $pos_province = input('request.pos_province', '0');
        $pos_city = input('request.pos_city', '0');
        $pos_district = input('request.pos_district', '0');
        $pos_name = input('request.pos_name', '');
        $address_info = input('request.address_info', '');
        $count = Db::name("member_address")->where("mid={$mid}")->count('id');
        if($count > 0){
            $id = Db::name("member_address")
                ->insertGetId(array(
                    "mid" => $mid,
                    'name' => $name,
                    'mobile' => $mobile,
                    'pos_province' => $pos_province,
                    'pos_city' => $pos_city,
                    'pos_district' => $pos_district,
                    'pos_name' => $pos_name,
                    'address_info' => $address_info,
                    'create_time' => time(),
                    'update_time' => time()
                ));
        }else{
            $id = Db::name("member_address")
                ->insertGetId(array(
                    "mid" => $mid,
                    'name' => $name,
                    'mobile' => $mobile,
                    'pos_province' => $pos_province,
                    'pos_city' => $pos_city,
                    'pos_district' => $pos_district,
                    'pos_name' => $pos_name,
                    'address_info' => $address_info,
                    'is_default'=> 1,
                    'create_time' => time(),
                    'update_time' => time()
                ));
        }

        if ($id > 0) {
            $member_address = Db::name("member_address")->where("id={$id}")->find();
            ajaxmsg('添加成功', 1, $member_address);
        } else {
            ajaxmsg('添加失败', 0);
        }
    }

    //更新地址
    public function update_address()
    {
        $mid = $this->is_login();
        $id = input('request.id', 0);
        $name = input('request.name', '');
        $mobile = input('request.mobile', '');
        $pos_province = input('request.pos_province', '0');
        $pos_city = input('request.pos_city', '0');
        $pos_district = input('request.pos_district', '0');
        $pos_name = input('request.pos_name', '');
        $address_info = input('request.address_info', '');
        $res = Db::name("member_address")
            ->where("id={$id}")
            ->update(array(
                "mid" => $mid,
                'name' => $name,
                'mobile' => $mobile,
                'pos_province' => $pos_province,
                'pos_city' => $pos_city,
                'pos_district' => $pos_district,
                'pos_name' => $pos_name,
                'address_info' => $address_info,
                'create_time' => time(),
                'update_time' => time()
            ));
        if ($res) {
            $member_address =  Db::name("member_address")->where("id={$id}")->find();
            ajaxmsg('更新成功', 1, $member_address);
        } else {
            ajaxmsg('更新失败', 0);
        }
    }

    public function update_addres_before()
    {
        $this->is_login();
        $id = input('request.id', 0);
        if ($id > 0) {
            $member_address = Db::name("member_address")->where("id={$id}")->find();
            ajaxmsg('true', 1, $member_address);
        } else {
            ajaxmsg('false', 0);
        }

    }

    //删除收货地址
    public function delete_address()
    {
        $mid = $this->is_login();
        $id = input('request.id', 0);
        $res = Db::name("member_address")->where("mid={$mid} and id={$id}")->delete();
        if ($res) {
            ajaxmsg('删除成功', 1);
        } else {
            ajaxmsg('删除失败', 0);
        }
    }

    //地址设为默认
    public function set_default_address()
    {
        $mid = $this->is_login();
        $id = input('request.id', 0);
        Db::name("member_address")->where("mid={$mid}")->update(array('is_default' => 0));//全部清除默认收货地址状态
        $res = Db::name("member_address")->where("id={$id}")->update(array('is_default' => 1));
        if ($res) {
            ajaxmsg('设置成功', 1);
        } else {
            ajaxmsg('更新失败', 0);
        }
    }

    //充值提现管理：认证前
    public function member_card_before()
    {
        $mid = $this->is_login();
        $member_card = Db::name("member_card")->where("mid={$mid}")->find();
        ajaxmsg('true', 1, $member_card);
    }

    //充值提现管理：认证后
    public function member_card_update()
    {
        $mid = $this->is_login();
        $id = input('request.id', 0);
        $data['card_number'] = input('request.card_number', '');
        $data['card_bank'] = input('request.card_bank', '');
        $data['auth_name'] = input('request.auth_name', '');
        $data['auth_number'] = input('request.auth_number', '');
        $data['create_time'] = time();
        $data['is_default'] = 1;
        $data['mid'] = $mid;
        if ($id > 0) {
            Db::name("member_card")->where("id={$id} and mid={$mid}")->update($data);//更新
            ajaxmsg('更新成功', 1);
        } else {
            Db::name("member_card")->insert($data);//添加
            ajaxmsg('认证成功', 1);
        }

    }

    //我要提现
    public function withdraw_before()
    {
        $mid = $this->is_login();
        $member_info = Db::name("member")->where("id={$mid}")->find();
        $member_info['withdrawrate'] = Db::name("admin_config")->where("name='withdrawrate'")->value('value');
        $member_info['minwithdraw'] = Db::name("admin_config")->where("name='minwithdraw'")->value('value');
        $member_info['maxwithdraw'] = Db::name("admin_config")->where("name='maxwithdraw'")->value('value');
        ajaxmsg('true', 1, $member_info);
    }

    //提现操作
    public function withdraw_after()
    {
        $mid = $this->is_login();
        $member_info = Db::name("member")->where("id={$mid}")->find();
        $money = input('request.money', 0);
        if ($money > $member_info['money']) {
            ajaxmsg('非法数据', 0);
        }
        if (intval($money) <= 0) {
            ajaxmsg('非法数据', 0);
        }
        $withdrawrate = Db::name("admin_config")->where("name='withdrawrate'")->value('value');
        //添加提现记录
        $withdraw_id = Db::name("member_withdraw")->insertGetId(array(
            'mid' => $mid,
            'money' => $money,
            'recevie_money' => $money - (ceil(($money * $withdrawrate) / 100)),
            'create_time' => time()
        ));
        if ($withdraw_id > 0) {
            Db::name("member")->where("id={$mid}")->setField('money', $member_info['money'] - $money);
            ajaxmsg('提交成功', 1);
        } else {
            ajaxmsg('提交失败', 0);
        }
    }

    //删除提现记录
    public function member_withdraw_delete()
    {
        $mid = $this->is_login();
        $id = input('request.id', 0);
        Db::name('member_withdraw')->where("mid={$mid} and id={$id}")->delete();
        ajaxmsg('删除成功', 1);

    }

    //我的钱包
    public function my_wallet()
    {
        $mid = $this->is_login();
        $data['member_info'] = Db::name("member")->where("id={$mid}")->find();
        $res = Db::name('member_withdraw')->where("mid={$mid}")->order("id desc")->paginate(10);
        $tempres = $res->toArray();
        $data['total'] = $tempres['total'];
        $data['per_page'] = $tempres['per_page'];
        $data['current_page'] = $tempres['current_page'];
        $data['list'] = $tempres['data'];
        ajaxmsg('true', 1, $data);
    }

    //分佣记录
    public function withdraw_order_list()
    {
        $type = input("request.type", 0);
        $map['a.area_agent_id'] = array('eq', $type);

        $mid = $this->is_login();
        $res = Db::name('order_fenxiao')->alias('a')
            ->join("member b", 'a.from_mid=b.id')
            ->field("a.*,b.mobile")
            ->where("to_mid={$mid}")
            ->where($map)
            ->paginate(10);
        $list = $res->toArray();
        ajaxmsg('true', 1, $list);
    }

    //服务任务
    public function area_agent_order()
    {
        $status = input('request.status', 0);
        switch ($status) {
            case 0:
                $mid = $this->is_login();
                $map['a.status'] = array('eq', $status);
                $map['a.mid'] = array('eq', $mid);
                $res = Db::name('area_agent_order')->alias('a')
                    ->join('order b', 'a.order_id=b.id')
                    ->field("a.*,b.address_info,b.name,b.mobile,b.order_total,b.total_price")
                    ->where($map)
                    ->order('a.id desc')
                    ->paginate(10);
                $list = $res->toArray();
                ajaxmsg('true', 1, $list['data']);
                break;
            case 1:
                $mid = $this->is_login();
                $map['a.status'] = array('eq', $status);
                $map['a.mid'] = array('eq', $mid);
                $res = Db::name('area_agent_order')->alias('a')
                    ->join('order b', 'a.order_id=b.id')
                    ->join("oc_area_deliveryman_order c", 'b.id=c.order_id')
                    ->join("member d", 'c.mid=d.id')
                    ->field("a.service_number,a.order_id,a.order_sn,a.create_time,b.address_info,b.name,b.mobile,b.order_total,b.total_price,d.name,c.id")
                    ->where($map)
                    ->order('a.id desc')
                    ->paginate(10);
                $list = $res->toArray();
                ajaxmsg('true', 1, $list['data']);
                break;
        }

    }

    //代理信息
    public function daili_info()
    {
        $mid = $this->is_login();
        $data = array();
        $data['member'] = Db::name('member')->where("id={$mid}")->find();
        $data['agent_list'] = Db::name('area_agent')->where("mid={$mid}")->select();
        $data['deliveryman_list'] = Db::name('area_deliveryman')->alias('a')
            ->join("member b", 'a.mid=b.id')
            ->where("a.agent_id={$mid}")
            ->field("a.*,b.username,b.mobile,b.name")
            ->select();
        ajaxmsg('true', 1, $data);

    }

    //添加区域负责人
    public function add_area_deliveryman()
    {
        $agent_id = $this->is_login();
        $mobile = input('request.mobile', '');
        $name = input('request.name', '');
        $member = Db::name('member')->where("mobile='{$mobile}' and status=1")->find();
        if (!$member) {
            ajaxmsg('无此账号', 0);
        }
        $count = Db::name('area_deliveryman')->where("mid={$member['id']}")->count('id');
        if ($count > 0) {
            ajaxmsg('此账号已被占用', 0);
        } else {
            Db::name('member')->where("id={$member['id']}")->setField('name', $name);//更新用户姓名
            Db::name('area_deliveryman')->insert(array(
                'agent_id' => $agent_id,
                'mid' => $member['id'],
                'create_time' => time()
            ));
            ajaxmsg('新增成功', 1);
        }
    }

    //负责人详情
    public function area_deliveryman_detail()
    {
        $agent_id = $this->is_login();
        $id = input('request.id', 0);

        $member = Db::name('area_deliveryman')->alias('a')
            ->join('member b', 'a.mid=b.id')
            ->where("a.agent_id={$agent_id} and a.id={$id} and a.mid=b.id")
            ->field("a.id,a.status,b.name,b.mobile")
            ->find();

        ajaxmsg('true', 1, $member);
    }

    //删除负责人
    public function delete_area_deliveryman()
    {
        $agent_id = $this->is_login();
        $id = input('request.id', 0);
        Db::name('area_deliveryman')->where("agent_id={$agent_id} and id={$id}}")->delete();
        ajaxmsg('删除成功', 1);
    }

    //设置状态-启用和停用
    public function set_area_deliveryman()
    {
        $agent_id = $this->is_login();
        $id = input('request.id', 0);
        $status = input("request.status", 1);
        Db::name('area_deliveryman')->where("agent_id={$agent_id} and id={$id}")->setField('status', $status);
        ajaxmsg('设置成功', 1);
    }

    //业务员列表
    public function deliveryman_list()
    {
        $mid = $this->is_login();
        $list = Db::name('area_deliveryman')->alias('a')
            ->join("member b", 'a.mid=b.id')
            ->where("a.agent_id={$mid} and a.status=1")
            ->field("a.*,b.username,b.mobile,b.name")
            ->select();
        ajaxmsg('true', 1, $list);
    }

    //指派订单
    public function add_area_deliveryman_order()
    {
        $agent_id = $this->is_login();
        $mid = input('request.mid', 0);//业务员id
        $order_id = input('request.order_id', 0);
        $order_sn = input('request.order_sn', '');
        $service_number = input('request.service_number', '');
        $content = input('request.content', '');
        $area_deliveryman = Db::name('area_deliveryman')->where("mid={$mid} and agent_id={$agent_id} and status=1")->find();
        if (!$area_deliveryman) {
            ajaxmsg('非法操作', 0);
        } else {
            Db::name('area_deliveryman_order')->insert(array(
                'agent_id' => $agent_id,
                'mid' => $mid,
                'order_id' => $order_id,
                'order_sn' => $order_sn,
                'service_number' => $service_number,
                'content' => $content,
                'create_time' => time()
            ));
            Db::name('area_agent_order')->where("order_id={$order_id} and mid={$agent_id}")->setField('status', 1);//已指派
            ajaxmsg('指派成功', 1);
        }
    }

    //撤销指派订单
    public function delete_area_deliveryman_order()
    {
        $agent_id = $this->is_login();
        $id = input('request.id', 0);//指派订单
        $order_id = input('request.order_id', 0);
        Db::name('area_deliveryman_order')->where("agent_id={$agent_id} and id={$id}")->delete();
        Db::name('area_agent_order')->where("order_id={$order_id} and mid={$agent_id}")->setField('status', 0);//未指派
        ajaxmsg('撤销成功', 1);
    }

    //我的任务
    public function my_deliveryman_order(){
        $mid = $this->is_login();
        $status = input("request.status",1);
        $map['c.status'] = array('eq',$status);
        $map['a.status'] = array('eq', 1);
        $map['c.mid'] = array('eq', $mid);
        $res = Db::name('area_agent_order')->alias('a')
            ->join('order b', 'a.order_id=b.id')
            ->join("oc_area_deliveryman_order c", 'b.id=c.order_id')
            ->join("member d", 'c.mid=d.id')
            ->field("a.service_number,a.order_id,a.order_sn,a.create_time,b.address_info,b.name,b.mobile,b.order_total,b.total_price,d.name,c.id")
            ->where($map)
            ->order('a.id desc')
            ->paginate(10);
        $list = $res->toArray();
        ajaxmsg('true', 1, $list['data']);
    }


}