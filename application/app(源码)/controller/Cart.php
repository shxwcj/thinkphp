<?php
/**
 * Created by PhpStorm.
 * User: 835173372@qq.com
 * NickName: 半城村落
 * Date: 2016/11/2 10:42
 */
namespace app\app\controller;
use think\Db;

class Cart extends Base
{
    //购物车加1/n
    public function add_to_cart(){
        $mid = $this->is_login();
        $deviceid = input('request.deviceid','');
        $id = input('request.goods_id',0);
        $info_id = input('request.info_id',0);
        $goods_sum = input('request.goods_sum',1);
        if($id == 0 || $goods_sum == 0){
            ajaxmsg('非法数据', 0);
        }
        $count = Db::name("goods_cart")->where("mid={$mid} and goods_id={$id}")->count('id');
        if($count > 0){
            $res = Db::name("goods_cart")->where("mid={$mid} and goods_id={$id}")->setInc('goods_sum',$goods_sum);
        }else{
            $res = Db::name("goods_cart")->insertGetId(array('mid'=>$mid,'deviceid'=>$deviceid,'goods_id'=>$id,'info_id'=>$info_id,'goods_sum'=>$goods_sum,'create_time'=>time()));
        }
        if($res){
            ajaxmsg('添加成功',1);
        }else{
            ajaxmsg('添加失败',0);
        }
    }

    //购物车减1/n
    public function cutdown_to_cart(){
        $mid = $this->is_login();
        $deviceid = input('request.deviceid','');
        $id = input('request.goods_id',0);
        $goods_sum = input('request.goods_sum',1);
        if($id == 0 || $goods_sum == 0){
            ajaxmsg('非法数据', 0);
        }
        $count = Db::name("goods_cart")->where("mid={$mid} and goods_id={$id}")->count('id');
        if($count > 0){
            $res = Db::name("goods_cart")->where("mid={$mid} and goods_id={$id}")->setDec('goods_sum',$goods_sum);
            $goods_sum = Db::name("goods_cart")->where("mid={$mid} and goods_id={$id}")->value("goods_sum");
            if($goods_sum == 0){
                Db::name("goods_cart")->where("mid={$mid} and goods_id={$id}")->delete();
            }
        }else{
            ajaxmsg('非法数据', 0);
        }
        if($res){
            ajaxmsg('删除成功',1);
        }else{
            ajaxmsg('删除失败',0);
        }
    }

    //购物车删除一条记录
    public function delete_to_cart(){
        $mid = $this->is_login();
        $id = input('request.id',0);
        if($id == 0){
            ajaxmsg('非法数据', 0);
        }
        $res = Db::name("goods_cart")->where("id={$id} and mid={$mid}")->delete();
        if($res){
            ajaxmsg('删除成功',1);
        }else{
            ajaxmsg('删除失败',0);
        }
    }

    //购物车商品列表（暂不分页）
    public function cart_list(){
        $mid = $this->is_login();
        $list = Db::name("goods_cart")->alias("a")
            ->join("goods b","a.goods_id=b.id","LEFT")
            ->join("goods_info c","b.info_id=c.id","LEFT")
            ->join("goods_gallery d","c.id=d.info_id","LEFT")
            ->join("admin_upload e","d.cover=e.id","LEFT")
            ->field("a.*,c.goods_name,b.price,e.url,(a.goods_sum*b.price) as sum_price")
            ->where("a.mid={$mid}")
            ->group("a.goods_id")
            ->order("a.create_time desc")
            ->select();
        $totol_price = 0;
        foreach ($list as $v){
            if($v['status'] > 0){
                $totol_price += $v['sum_price'];
            }
        }
        $data['list'] = $list;
        $data['total_price'] = $totol_price;
        ajaxmsg('ok',1,$data);
    }

    //购物车总数量，全局显示
    public function total_goods_sum(){
        $mid = $this->is_login();
        $total_goods_sum = Db::name("goods_cart")->where("mid={$mid}")->sum("goods_sum");
        if($total_goods_sum > 0){
            $data['total_goods_sum'] = $total_goods_sum;
        }else{
            $data['total_goods_sum'] = 0;
        }
        ajaxmsg('ok',1,$data);
    }

    //更改购物车清单状态，1：选中结算，2：暂不结算
    public function update_cart_status(){
        $mid = $this->is_login();
        $goods_id = input('request.goods_id',0);
        $status = intval(input('request.status'));
        Db::name("goods_cart")->where("mid={$mid} and goods_id={$goods_id}")->setField('status',$status);
        ajaxmsg('ok',1);
    }
    //购物车全选，全不选，设置购物车清单选中状态
    public function update_allcart_status(){
        $mid = $this->is_login();
        $status = intval(input('request.status'));
        Db::name("goods_cart")->where("mid={$mid}")->setField('status',$status);
        ajaxmsg('ok',1);
    }
}