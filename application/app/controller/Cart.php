<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/26
 * Time: 14:19
 */

namespace app\app\controller;
use think\Db;

class Cart extends Base
{
    /**
     *购物车商品列表
     * @author wangchunjing
     * return array|false|string
     */

    public function index()
    {
        $mid =$this->is_login();

        $list = Db::name('goods_cart a')
            ->join('goods b','a.goods_id = b.id','LEFT')
            ->join('goods_info c','b.info_id = c.id','LEFT')
            ->join('goods_gallery d','c.id = d.info_id','LEFT')
            ->join('admin_upload e','d.cover = e.id','LEFT')
            ->field('a.*,c.goods_name,b.price,e.url,(a.goods_sum*b.price) as sum_price')
            ->where('a.mid',$mid)
            ->group('a.goods_id')
            ->order('a.create_time','asc')
            ->select();

        $total_price = 0;
        foreach ($list as $value)
        {
            if($value['status'] > 0){
                $total_price += $value['sum_price'];
            }
        }

        $data['list'] = $list;
        $data['total_price'] = $total_price;

        return ajaxmsg('ok',1,$data);

    }

    /**
     *添加购物车
     * @author wangchunjing
     * return array|false|string
     */

    public function add_cart()
    {
        $mid = $this->is_login();
        $deviceid = input("request.deviceid",0);
        $goods_id = input("request.goods_id");
        $info_id = input("request.info_id");
        $goods_sum = input("request.goods_sum",1);

        if(!$goods_id || !$info_id){
            return ajaxmsg('请添加商品',0);
        }

       if(Db::name('goods_cart')->where('mid',$mid)->where('goods_id',$goods_id)->find()){
           $res = Db::name('goods_cart')->where('mid',$mid)->where('goods_id',$goods_id)->setInc('goods_sum',$goods_sum);
       }else{
            $res =Db::name('goods_cart')->insert(array(
                'mid'       =>  $mid,
                'deviceid'  =>  $deviceid,
                'goods_id'  => $goods_id,
                'info_id'   =>  $info_id,
                'goods_sum' =>  $goods_sum,
                'create_time'=>  time(),
                'status'    =>  1,
            ));
       }
        if($res){
            return ajaxmsg('添加成功',1);
        }else{
            return ajaxmsg('添加失败',0);
        }

    }

    /**
     *购物车数量删减
     * @author wangchunjing
     * return array|false|string
     */

    public function down_cart()
    {
        $mid =$this->is_login();
        $goods_id = input("request.goods_id");
        $goods_sum = input("request.goods_sum",1);

        if(! $goods_id) return ajaxmsg('请选择删减商品',0);

        $counts = Db::name('goods_cart')->where('mid',$mid)->where('goods_id',$goods_id)->value('goods_sum');
       if($counts == 1){
           return ajaxmsg('false',0);
       }else{
           if($counts - $goods_sum >= 1) {
               Db::name('goods_cart')->where('mid', $mid)->where('goods_id', $goods_id)->setDec('goods_sum', $goods_sum);
               return ajaxmsg('删除成功', 1);
           }else{
               return ajaxmsg('请重新选择数量',0);
           }

       }

    }

    /**
     *删除购物车
     * @author wangchunjing
     * return array|false|string
     */

    public function delete()
    {
        $mid = $this->is_login();
        $goods_id = input("request.goods_id");
        if(! $goods_id) return ajaxmsg('请选择要删除的商品',0);

        if(Db::name('goods_cart')->where('mid',$mid)->where('goods_id',$goods_id)->find()){
           Db::name('goods_cart')->where('mid',$mid)->delete($goods_id);
            return ajaxmsg('已删除',1);
        }else{
            return  ajaxmsg('不存在该商品',0);
        }
    }

    /**
     *更改购物车清单状态，1：选中结算，0：暂不结算
     * @author wangchunjing
     * return array|false|string
     */

    public function update_cart_status()
    {
        $mid = $this->is_login();
        $goods_id = input("request.goods_id");
        $status = intval(input("request.status")) ? 1 :0;
        if(! $goods_id) return ajaxmsg('请选择商品',0);

        if(Db::name('goods_cart')->where('mid',$mid)->where('goods_id',$goods_id)->find()){
           if(Db::name('goods_cart')->where('mid',$mid)->where('goods_id',$goods_id)->setField('status',$status) ==1){
               return ajaxmsg('选中结算',1);
           }else{
               return ajaxmsg('暂不结算',0);
           }
        }else{
            return ajaxmsg('不存在该商品',0);
        }
    }







}