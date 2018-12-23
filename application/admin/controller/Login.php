<?php
// +----------------------------------------------------------------------
// | mydinghuo [easy handle for your businesses]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.weizhibao.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: kevinyang <835173372@qq.com> <http://www.weizhibao.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Config;
use think\Request;

class Login extends Controller
{
    public function index()
    {
        if (Request::instance()->isPost()) {
            $username = input('request.username');
            $password = input('request.password');
            $user_info = $this->login($username, $password);
            session('admin_user_auth', $user_info);//设置session
            $this->redirect('/admin/#/index');
        } else {
            if (session('admin_user_auth')) {
                $this->redirect('/admin/#/index');
            }
            return view();
        }
    }

    public function logout()
    {
        session('admin_user_auth', null);
        $this->redirect('login/index');
    }

    /**
     * 用户登录
     * @author  <835173372@qq.com>
     */
    public function login($username, $password, $map = array())
    {
        //去除前后空格
        $username = trim($username);

        //匹配登录方式
        if (preg_match("/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/", $username)) {
            $map['email'] = array('eq', $username);     // 邮箱登陆
        } elseif (preg_match("/^1\d{10}$/", $username)) {
            $map['mobile'] = array('eq', $username);    // 手机号登陆
        } else {
            $map['username'] = array('eq', $username);  // 用户名登陆
        }
        $map['status'] = array('eq', 1);
        $user_info = Db::name("admin_user")->where($map)->find();

        if (!$user_info) {
            $this->error('用户不存在或被禁用');
        } else {
            if (md5($password) !== $user_info['password']) {
                $this->error('密码错误');
            } else {
                return $user_info;
            }
        }
        return false;
    }
}