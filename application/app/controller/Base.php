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
        header('content-type:text/html;charset=utf-8');
        header('Access-Control-Allow-Origin:*');
        header('Access-Control-Allow-Headers:Origin,X-Requested-With,Content-Type,Accept');
        header('Access-Control-Allow-Methods:GET,POST,PUT');
        ksort($_POST);
        ksort($_GET);
    }

   /**
    * 生成token值
    * @author wangchunjing
   */

   public function create_token()
   {
       $token = md5(mt_rand(111111,999999).time());
       return $token;
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
     * 判断用户是否登录
     * @author wangchunjing
     */

    public function is_login()
    {
        $token = trim($_POST['token']);
        $mid = Db::name('token')->where('token',$token)->value('mid');
        if($mid >0)
        {
            return $mid;
        }
        else
        {
            return ajaxmsg('未授权登录',0);
        }
    }













}