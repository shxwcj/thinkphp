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