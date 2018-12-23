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
use think\exception\HttpResponseException;
use think\Request;
use think\Response;
use think\response\Redirect;
use think\Url;
use think\View as ViewTemplate;

class Common extends Controller
{
    protected function _initialize()
    {
        $request = Request::instance();
        if (session('admin_user_auth')) {
            if (!defined('UID')) {
                define('UID', session('admin_user_auth.id'));
            }
        } else {
            define('UID', null);
        }
        if (!UID) {
            $this->redirect('login/index');
        }
        $act = lcfirst($request->controller());//强制小写

        if($act == 'index'){
            return true;
        }
        $auth = $this->checkMenuAuth();//验证权限是否存在
        if(!$auth){
            $this->error('没有权限');
            exit;
        }
    }

    public function checkMenuAuth(){
        $uid = session('admin_user_auth.id');
        $request = Request::instance();
        $act = lcfirst($request->controller());//强制小写
        $url = $request->path(); // 当前菜单

        $group = Db::name("admin_access")->where("uid={$uid}")->value('group');  // 获得当前登录用户所在用户组

        $menu_auth = Db::name('admin_group')->where("id={$group}")->value('menu_auth');//获取权限列表

        $menu_auth = json_decode($menu_auth,true);

        $auth = array();//模块act列表
        $now_act = '';
        if ($group != 1) {
            foreach ($menu_auth as $k=>$v){
                if($v['act'] == $act){
                    $auth = $v['list'];
                }
            }
            foreach ($auth as $v){
                if($v['url'] == $url){
                    $now_act = $v;
                }
            }
            if(isset($now_act['status'])){
                if($now_act['status']){
                    return true;//有权限
                }else{
                    return false;//没有权限
                }
            }else{
                return false;
            }
        } else {
            return true;  // 超级管理员无需验证
        }
        return false;
    }


    protected function cou_error($msg = '', $url = null, $data = '', $wait = 2, array $header = [])
    {
        $code = 0;
        if (is_numeric($msg)) {
            $code = $msg;
            $msg  = '';
        }
        if (is_null($url)) {
            $url = 'javascript:history.back(-1);';
        } elseif ('' !== $url) {
            $url = (strpos($url, '://') || 0 === strpos($url, '/')) ? $url : Url::build($url);
        }
        $result = [
            'code' => $code,
            'msg'  => $msg,
            'data' => $data,
            'url'  => $url,
            'wait' => $wait,
        ];
        $isAjax = Request::instance()->isAjax();
        if($isAjax){
            $result = ViewTemplate::instance(Config::get('template'), Config::get('view_replace_str'))->fetch(Config::get('dispatch_error_tmpl'), $result);
        }else{
            $result = ViewTemplate::instance(Config::get('template'), Config::get('view_replace_str'))->fetch(Config::get('dispatch_error_tmpl2'), $result);
        }

        $type = 'html';
        $response = Response::create($result, $type)->header($header);

        throw new HttpResponseException($response);
    }
}