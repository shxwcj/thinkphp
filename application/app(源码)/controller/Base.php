<?php
/**
 * Created by PhpStorm.
 * User: 835173372@qq.com
 * NickName: 半城村落
 * Date: 2016/11/2 10:42
 */
namespace app\app\controller;

use think\Controller;
use think\Db;
use think\Log;

class Base extends Controller
{
    protected function _initialize()
    {
        header('content-type:text/html;charset=utf-8');
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        ksort($_POST);
        ksort($_GET);
    }

    //设置登录令牌（token）
    public function auto_login($id, $mobile)
    {
        $auth = array('id' => $id, 'mobile' => $mobile, 'time' => time());
        $user_auth_sign = $this->data_auth_sign($auth);
        return $user_auth_sign;
    }

    //数据签名认证
    public function data_auth_sign($data)
    {
        // 数据类型检测
        if (!is_array($data)) {
            $data = (array)$data;
        }
        ksort($data); //排序
        $code = http_build_query($data); // url编码并生成query字符串
        $sign = sha1($code);  // 生成签名
        return $sign;
    }

    //APP端检测用户是否登录，保留接口
    public function check_login()
    {
        $token = trim(input("request.token"));
        $count = Db::name("tokens")->where("token='{$token}'")->count();
        if ($count > 0) {
            ajaxmsg('已登录', 1);
        } else {
            ajaxmsg('未登录', 0);
        }
    }

    //service端检测逻辑，保留接口
    public function is_login()
    {
        $token = trim(input("request.token"));
        $info = Db::name("tokens")->where("token='{$token}'")->find();
        if ($info['mid'] > 0) {
            return $info['mid'];
        } else {
            ajaxmsg('未登录', 0);
        }
    }

    //退出
    public function login_out()
    {
        $mid = $this->is_login();
        $res = Db::name("tokens")->where("mid={$mid}")->delete();
        if ($res) {
            ajaxmsg('退出成功', 1);
        } else {
            ajaxmsg('操作失败', 0);
        }
    }
}