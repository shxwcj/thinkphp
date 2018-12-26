<?php
/**
 * Created by PhpStorm.
 * User: wangchunjing
 * Date: 2018/12/21
 * Time: 17:28
 */
namespace app\app\controller;
use think\Request;
use think\Db;
use think\Controller;
use think\Log;

class Base extends Controller
{
    /**
     * 解决跨域
     * @author wangchunjing
     * @return array|string
     */

    protected function _initialize()
    {
        header('content-type:json;charset=utf-8');
        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Headers:Origin,X-Requested-With,Content-Type,Accept');
        header('Access-Control-Allow-Methods:GET,POST,PUT');
        ksort($_POST);
        ksort($_GET);
    }

    /**
     * 设置登录令牌（token）
     * @author wangchunjing
     */
    public function auto_login($id,$mobile)
    {
        $auth = array('id' => $id, 'mobile' => $mobile, 'time' => time());
        $user_auth_sign = $this->data_auth_sign($auth);
        return $user_auth_sign;
    }

    /**
     * 数据签名认证
     * @author wangchunjing
     */

    public function data_auth_sign($data)
    {
        // 数据类型检测
        if (!is_array($data))
        {
            $data = (array)$data;
        }
        ksort($data); //排序
        $code = http_build_query($data); // url编码并生成query字符串
        $sign = sha1($code);  // 生成签名
        return $sign;
    }

    /**
     * service端检测逻辑，保留接口
     * @author wangchunjing
     */

    public function is_login()
    {
        $token = trim(input("request.token"));
        $info = Db::name("tokens")->where("token",$token)->find();

        if ($info['mid'] > 0) {
            return $info['mid'];
        } else {
            return ajaxmsg('未登录', 0);
        }

    }

    /**
     * app端检测用户是否登录，保留接口
     * @author wangchunjing
     */

    public function check_login()
    {
        $token = trim(input("request.token"));
        if(Db::name("tokens")->where('token',$token)->count()){
            return ajaxmsg('已登录',1);
        }else{
            return ajaxmsg('未登录',0);
        }
    }

    /**
     * 退出
     * @author wangchunjing
     */

    public function logout()
    {
        $mid = $this->is_login();
        if(Db::name("tokens")->where('mid',$mid)->delete()){
            return ajaxmsg('退出成功',1);
        }else{
            return ajaxmsg('退出失败',0);
        }
    }













}