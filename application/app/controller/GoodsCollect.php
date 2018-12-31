<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/28
 * Time: 18:21
 */

namespace app\app\controller;
use think\Db;

class Goodscollect extends Base
{
    /**
     * @desc 添加商品收藏
     * @author wangchunjing
     * return array|false|string
     */

    public function add()
    {
        $mid = $this->is_login();
        $goods_id = input("request.goods_id");
        $info_id = input("request.info_id");

        if(! $goods_id || ! $info_id){
            return ajaxmsg('请选择收藏商品',0);
        }

        if(Db::name('goods_collect')->where('mid',$mid)->where('goods_id',$goods_id)->where('info_id',$info_id)->find()){
            return ajaxmsg('商品已收藏',1);
        }else{
            $res = Db::name('goods_collect')->insert(array(
                'mid'           =>  $mid,
                'goods_id'      =>  $goods_id,
                'info_id'       =>  $info_id,
                'create_time'   => time(),
            ));
            if($res){
                return ajaxmsg('商品收藏成功',1);
            }else{
                return ajaxmsg('商品收藏失败',0);
            }
        }
    }

    /**
     * @desc 商品收藏列表
     * @author wangchunjing
     * return array|false|string
     */

    public function index()
    {
        $mid = $this->is_login();
        $list = Db::name('goods_collect a')
            ->join('goods b','a.goods_id = b.id','LEFT')
            ->join('goods_info c','b.info_id = c.id','LEFT')
            ->join('goods_gallery d','c.id = d.info_id','LEFT')
            ->join('admin_upload e','d.cover = e.id')
            ->field('a.*,b.info_id,b.price,b.standard_value1,b.standard_value2,b.standard_value3,c.goods_name,e.url')
            ->group('a.goods_id')
            ->order('a.create_time','asc')
            ->where('mid',$mid)
            ->select();
        if($list){
            return ajaxmsg('收藏列表',1,$list);
        }else{
            return ajaxmsg('您还没有收藏商品，请去添加商品吧',0);
        }

    }

    /**
     * @desc 取消商品收藏
     * @author wangchunjing
     * return array|false|string
     */

    public function delete()
    {
        $mid = $this->is_login();
        $goods_id = input("request.goods_id");

        if(! $goods_id){
            return ajaxmsg('请选择取消收藏的商品',0);
        }

        if(Db::name('goods_collect')->where('mid',$mid)->where('goods_id',$goods_id)->find()){
            if(Db::name('goods_collect')->where('mid',$mid)->where('goods_id',$goods_id)->delete()){
                return ajaxmsg('已取消收藏',1);
            }else{
                return ajaxmsg('取消失败，请重新操作',0);
            }
        }else{
            return ajaxmsg('未知收藏商品',0);
        }
    }





}