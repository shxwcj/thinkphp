<?php
// +----------------------------------------------------------------------
// | mydinghuo [easy handle for your businesses]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.weizhibao.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: kevinyang <835173372@qq.com> <http://www.weizhibao.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use think\Request;
use think\Db;
class Drp extends Common
{
    public function index()
    {
        if (Request::instance()->isPost()) {
            // 接收post数据
            $map = array();
            $queryText = trim(input("request.queryText"));
            if($queryText){
                $map['username|mobile']  = ['like',"%$queryText%"];
            }
            $list = Db::name('member')->where($map)->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('queryText',$queryText);
            return view();

        } else {
            $list = Db::name('member')->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('queryText','');
            return view();
        }
    }

    public function withdrawapply()
    {
        if (Request::instance()->isPost()) {
            // 接收post数据
            $map = array();
            $queryText = trim(input("request.queryText"));
            if($queryText){
                $map['b.mobile|b.username']  = ['like',"%$queryText%"];
            }
            $list = Db::name('member_withdraw')->alias("a")
                ->join("member b","a.mid=b.id")
                ->field("a.id,a.mid,a.money as tixian_money,a.recevie_money,a.create_time,a.status,b.mobile,b.money")
                ->where("a.status=0")
                ->where($map)
                ->order("a.id desc")
                ->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('queryText',$queryText);
            return view();
        } else {
            $list = Db::name('member_withdraw')->alias("a")
                ->join("member b","a.mid=b.id")
                ->field("a.id,a.mid,a.money as tixian_money,a.recevie_money,a.create_time,a.status,b.mobile,b.money")
                ->order("a.id desc")
                ->where("a.status=0")
                ->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('queryText','');
            return view();
        }
    }

    public function withdrawrecord()
    {
        if (Request::instance()->isPost()) {
            // 接收post数据
            $map = array();
            $queryText = trim(input("request.queryText"));
            if($queryText){
                $map['b.mobile|b.username']  = ['like',"%$queryText%"];
            }
            $list = Db::name('member_withdraw')->alias("a")
                ->join("member b","a.mid=b.id")
                ->field("a.id,a.mid,a.money as tixian_money,a.recevie_money,a.create_time,a.status,b.mobile,b.money")
                ->where("a.status>0")
                ->where($map)
                ->order("a.id desc")
                ->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('queryText',$queryText);
            return view();
        } else {
            $list = Db::name('member_withdraw')->alias("a")
                ->join("member b","a.mid=b.id")
                ->field("a.id,a.mid,a.money as tixian_money,a.recevie_money,a.create_time,a.status,b.mobile,b.money")
                ->where("a.status>0")
                ->order("a.id desc")
                ->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('queryText','');
            return view();
        }
    }

    public function withdrawdo(){
        if (Request::instance()->isPost()) {
            $id = input("request.id",0);
            $status = input("request.status",0);
            $member_withdraw = Db::name("member_withdraw")->where("id={$id}")->find();
            $mid = $member_withdraw['mid'];
            if($status == 1){
                Db::name("member_withdraw")->where("id={$id}")->setField("status",$status);
            }else{
                Db::name('member')->where("id={$mid}")->setInc("money",$member_withdraw['money']);//退回账户
                Db::name("member_withdraw")->where("id={$id}")->setField("status",$status);
            }
            return ['status' => 1, 'info' => '操作成功','url'=>'/admin/drp/withdrawrecord'];
        } else {
            $id = input("request.id",0);
            $member_withdraw = Db::name("member_withdraw")->where("id={$id}")->find();
            $member = Db::name("member")->where("id={$member_withdraw['mid']}")->find();
            $member_card = Db::name("member_card")->where("mid={$member_withdraw['mid']}")->find();
            $this->assign('member_withdraw',$member_withdraw);
            $this->assign('member',$member);
            $this->assign('member_card',$member_card);
            return view();
        }
    }

    public function withdraw_order_list(){
        if (Request::instance()->isPost()) {
            // 接收post数据
            $id = input("request.id",0);
            $member_info = Db::name('member')->where("id={$id}")->find();
            $list = Db::name('order')->where("mid={$id}")->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('member_info',$member_info);
            $order_sum = Db::name('order')->where("mid={$id}")->count('id');
            $order_total = Db::name('order')->where("mid={$id} and status>0 and status<3")->sum('order_total');
            $this->assign('order_sum',$order_sum);
            $this->assign('order_total',$order_total);
            $this->assign('id',$id);
            $temp = $list->toArray();
            $this->assign('vmlist',json_encode($temp['data']));
            return view();
        } else {
            $id = input("request.id",0);
            $member_info = Db::name('member')->where("id={$id}")->find();
            $list = Db::name('order')->where("mid={$id}")->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('member_info',$member_info);
            $order_sum = Db::name('order')->where("mid={$id}")->count('id');
            $order_total = Db::name('order')->where("mid={$id} and status>0 and status<3")->sum('order_total');
            $this->assign('order_sum',$order_sum);
            $this->assign('order_total',$order_total);
            $this->assign('id',$id);
            $temp = $list->toArray();
            $this->assign('vmlist',json_encode($temp['data']));
            return view();
        }
    }

    public function withdraw_fenxiao_list(){
        if (Request::instance()->isPost()) {
            $id = input("request.id",0);
            $children = Db::name('member')->where("pid={$id}")->field('id')->select();
            $ids = array();
            foreach ($children as $v){
                if($v['id'] > 0){
                    $ids[] = $v['id'];
                }
            }
            if(count($ids) > 0){
                $map['mid'] = array('in',$ids);
                $list = Db::name('order')->where("mid!={$id}")->where($map)->paginate(10);
                $order_sum = Db::name('order')->where("mid!={$id}")->where($map)->count('id');
                $order_total = Db::name('order')->where("mid!={$id}")->where($map)->where("status>0 and status<3")->sum('order_total');
            }else{
                $order_sum = 0;
                $order_total = 0.00;
                $list = Db::name('order')->where("mid!={$id} and id<0")->paginate(10);
            }
            $member_info = Db::name('member')->where("id={$id}")->find();
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('member_info',$member_info);
            $this->assign('order_sum',$order_sum);
            $this->assign('order_total',$order_total);
            $this->assign('id',$id);

            $temp = $list->toArray();
            $this->assign('vmlist',json_encode($temp['data']));
            return view();
        } else {
            $id = input("request.id",0);
            $children = Db::name('member')->where("pid={$id}")->field('id')->select();
            $ids = array();
            foreach ($children as $v){
                if($v['id'] > 0){
                 $ids[] = $v['id'];
                }
            }
            if(count($ids) > 0){
                $map['mid'] = array('in',$ids);
                $list = Db::name('order')->where("mid!={$id}")->where($map)->paginate(10);
                $order_sum = Db::name('order')->where("mid!={$id}")->where($map)->count('id');
                $order_total = Db::name('order')->where("mid!={$id}")->where($map)->where("status>0 and status<3")->sum('order_total');
            }else{
                $order_sum = 0;
                $order_total = 0.00;
                $list = Db::name('order')->where("mid!={$id} and id<0")->paginate(10);
            }
            $member_info = Db::name('member')->where("id={$id}")->find();
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('member_info',$member_info);
            $this->assign('order_sum',$order_sum);
            $this->assign('order_total',$order_total);
            $this->assign('id',$id);

            $temp = $list->toArray();
            $this->assign('vmlist',json_encode($temp['data']));
            return view();
        }
    }
}