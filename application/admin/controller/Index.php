<?php
/**
 * Created by PhpStorm.
 * User: 835173372@qq.com
 * NickName: 孟老师
 * Date: 2016/12/20 10:29
 */
namespace app\admin\controller;

use think\Db;
use think\Request;

class Index extends Common
{
    public function index()
    {
        $todaytime = strtotime("today");//今日零点linux时间戳
        $nowtime = time();

        $order_sum = Db::name("order")->count("id");
        $order_sum2 = Db::name("order")->where("create_time > {$todaytime} and create_time< {$nowtime}")->count("id");
        $goods_sum = Db::name("goods")->where("status=1")->count("id");
        $goods_sum2 = Db::name("goods")->where("create_time > {$todaytime} and create_time< {$nowtime}")->count("id");

        $member_sum = Db::name("member")->count("id");
        $member_sum2 = Db::name("member")->where("create_time > {$todaytime} and create_time< {$nowtime}")->count("id");


        $this->assign("order_sum",$order_sum);
        $this->assign("order_sum2",$order_sum2);
        $this->assign("goods_sum",$goods_sum);
        $this->assign("goods_sum2",$goods_sum2);

        $this->assign("member_sum",$member_sum);
        $this->assign("member_sum2",$member_sum2);

        //全局布局
        return view();
    }
    /**
     * 删除缓存
     * @author  <835173372@qq.com>
     */
    public function removeRuntime()
    {
        if (Request::instance()->isPost()) {
            $result = $this->del_dir(RUNTIME_PATH);
            if ($result) {
                return ['status' => 1, 'info' => '缓存清理成功'];
            } else {
                return ['status' => 0, 'info' => '缓存清理失败'];
            }
        }
    }

    public function del_dir($dirName)
    {
        if (!file_exists($dirName)) {
            return false;
        }

        $dir = opendir($dirName);
        while ($fileName = readdir($dir)) {
            $file = $dirName . '/' . $fileName;
            if ($fileName != '.' && $fileName != '..') {
                if (is_dir($file)) {
                    $this->del_dir($file);
                } else {
                    unlink($file);
                }
            }
        }
        closedir($dir);
        return rmdir($dirName);
    }
}
