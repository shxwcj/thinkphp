<?php
/**
 * Created by PhpStorm.
 * User: 835173372@qq.com
 * NickName: 孟老师
 * Date: 2016/12/20 10:29
 */
namespace app\admin\controller;

use think\Request;
use think\Db;
class Order extends Common
{
    public function index()
    {
        $map = array();
        $queryText = isset($_REQUEST['queryText'])?$_REQUEST['queryText']:'';
        $status = isset($_REQUEST['status'])?$_REQUEST['status']:'';
        if($queryText){
            $map['a.order_sn']  = ['like',"%$queryText%"];
            $this->assign('queryText',$queryText);
        }else{
            $this->assign('queryText','');
        }
        if($status){
            $map['a.status']  = array('in',$status);
            $this->assign('status',json_encode($status,true));
        }else{
            $this->assign('status',json_encode(array(),true));
        }
        $list = Db::name('order')->alias("a")
            ->field("a.*")
            ->where($map)
            ->order('a.create_time desc')
            ->paginate(15,false,['query' => array(
                'queryText' => $queryText,
                'status' => $status
            ),]);
        $page = $list->render();
        $this->assign('list',$list);
        $this->assign('lastpage',$list->lastPage());
        $this->assign('currentPage',$list->currentPage());
        $this->assign('page',$page);;
        return view();
    }
}