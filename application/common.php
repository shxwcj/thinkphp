<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

use think\Db;

//获取图片
function get_cover($id, $type)
{
    if ((int)$id) {
        $upload_info = Db::name("admin_upload")->where("id={$id}")->find();
        $url = $upload_info['url'];
    }else{
        $url = '';
    }
    if (!$url) {
        switch ($type) {
            case 'default' : //默认图片
                $url = '/static/assets/img/default.png';
                break;
        }
    }
    return $url;
}
//获取单位
function get_unit($id){
    if ((int)$id) {
        $cate_info = Db::name("goods_unit")->where("id={$id}")->find();
        $name = $cate_info['name'];
    }else{
        $name = '';
    }
    return $name;
}

//API数据返回接口，统一规定，-1：未登录，0：普通错误，1：返回成功
function ajaxmsg($msg = "", $status = 1, $data = '', $errcode = '')
{
    $json['msg'] = $msg;
    $json['status'] = $status;
    $json['data'] = $data;
    if ($errcode) {
        $json['errcode'] = $errcode;
    }
    echo json_encode($json, true);
    exit;
}
//输出纯文本
function text($text, $parseBr = false, $nr = false)
{
    $text = htmlspecialchars_decode($text);
    $text = safe($text, 'text');
    if (!$parseBr && $nr) {
        $text = str_ireplace(array("\r", "\n", "\t", "&nbsp;"), '', $text);
        $text = htmlspecialchars($text, ENT_QUOTES);
    } elseif (!$nr) {
        $text = htmlspecialchars($text, ENT_QUOTES);
    } else {
        $text = htmlspecialchars($text, ENT_QUOTES);
        $text = nl2br($text);
    }
    $text = trim($text);
    return $text;
}
//截取字符串函数
function cnsubstr($str, $length, $start = 0, $charset = "utf-8", $suffix = true)
{
    $str = strip_tags($str);
    if (function_exists("mb_substr")) {
        if (mb_strlen($str, $charset) <= $length) return $str;
        $slice = mb_substr($str, $start, $length, $charset);
    } else {
        $re['utf-8'] = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
        $re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
        $re['gbk'] = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
        $re['big5'] = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
        preg_match_all($re[$charset], $str, $match);
        if (count($match[0]) <= $length) return $str;
        $slice = join("", array_slice($match[0], $start, $length));
    }
    if ($suffix) return $slice . "…";
    return $slice;
}


//短信宝服务(发送短信)
function smsbao($smscode, $content, $phone)
{
    $smsbao = array('user' => 'wulengbing', 'pass' => '3721382');//短信宝服务;
    $user = $smsbao['user'];//短信平台帐号
    $pass = md5($smsbao['pass']); //短信平台密码
    $smsapi = "http://www.smsbao.com/"; //短信网关
    $statusStr = array(
        "0" => "短信发送成功",
        "-1" => "参数不全",
        "-2" => "服务器空间不支持,请确认支持curl或者fsocket，联系您的空间商解决或者更换空间！",
        "30" => "密码错误",
        "40" => "账号不存在",
        "41" => "余额不足",
        "42" => "帐户已过期",
        "43" => "IP地址限制",
        "50" => "内容含有敏感词",
        "51" => "发送频繁，请两分钟后重试",
    );
    if (session('smstime')) {
        if (time() < session('smstime') + 2 * 60) {//短信防御默认2分钟
            $error_info = $statusStr['51'];
            return $error_info;
        } else {
            session('smscode', $smscode);
            session('smstime', time());
            session('mobile', $phone);
        }
    } else {
        session('smscode', $smscode);
        session('smstime', time());
        session('mobile', $phone);
    }
    return 'ok';exit;

    $sendurl = $smsapi . "sms?u=" . $user . "&p=" . $pass . "&m=" . $phone . "&c=" . urlencode($content);
    $result = file_get_contents($sendurl);
    if ($result == 0) {
        return 'ok';
    } else {
        $error_info = $statusStr[$result];
        return $error_info;
    }
}


//生成唯一订单号
function create_order_sn(){
    return date('Ymd') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
}

//根据id获取省市区名称
function get_posname($id){
    $name = Db::name('area')->where("id={$id}")->value('name');
    return $name;
}




