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
class Goods extends Common
{
    /**
     * 商品列表
     * @author 835173372@qq.com
     */
    public function index()
    {
        if (Request::instance()->isPost()) {
            // 接收post数据
            $map = array();
            $queryText = trim(input("request.queryText"));
            if($queryText){
                $map['b.goods_name|a.sku']  = ['like',"%$queryText%"];
                $this->assign('queryText',$queryText);
            }else{
                $this->assign('queryText','');
            }

            if(!empty($_POST['cate_ids'])){
                $map['b.cate_id']  = array('in',$_POST['cate_ids']);
                $this->assign('cate_ids',json_encode($_POST['cate_ids'],true));
            }else{
                $this->assign('cate_ids',json_encode(array(),true));
            }

            $list = Db::name('goods')->alias('a')
                ->join("goods_info b","a.info_id=b.id")
                ->where($map)
                ->field("a.*,b.goods_name,b.unit_id,b.is_new,b.is_hot,b.is_rec")
                ->order("a.id desc")
                ->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $cate_list = Db::name('goods_category')->where("pid>0")->select();
            $this->assign('cate_list',json_encode($cate_list,true));
            return view();
        } else {

            $list = Db::name('goods')
                ->alias('a')
                ->join("goods_info b","a.info_id=b.id")
                ->field("a.*,b.goods_name,b.unit_id,b.is_new,b.is_hot,b.is_rec")
                ->order("a.id desc")
                ->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('queryText','请输入商品名/编号');
            $this->assign('page',$page);
            $cate_list = Db::name('goods_category')->where("pid>0")->select();
            $this->assign('cate_list',json_encode($cate_list,true));
            $this->assign('cate_ids',json_encode(array(),true));
            $this->assign('queryText','');
            return view();
        }
    }

    /**
     * 添加商品
     * @author 835173372@qq.com
     */
    public function goods_add()
    {
        if (Request::instance()->isPost()) {

            $covers = json_decode(input("request.covers"),true);
            $lists = json_decode(input("request.lists"),true);
            $goods_lists = json_decode(input("request.goods_lists"),true);
            $data['goods_name'] = trim(input("request.goods_name"));
            $data['sku'] = trim(input("request.sku"));
            $data['cate_id'] = trim(input("request.cate_id"));
            $data['unit_id'] = trim(input("request.unit_id"));
            $data['is_new'] = trim(input("request.is_new"));
            $data['is_rec'] = trim(input("request.is_rec"));
            $data['is_hot'] = trim(input("request.is_hot"));
            $data['price'] = trim(input("request.price"));
            $data['costprice'] = trim(input("request.costprice"));
            $data['fenxiao_rate'] = trim(input("request.fenxiao_rate"));

            $data['create_time'] = time();
            $data['content'] = trim(input("request.content"));

            //添加规格商品数据
            if(count($goods_lists) > 0){
                $info_id = Db::name("goods_info")->insertGetId($data);//goods_info插入
                if($info_id > 0){
                    foreach ($covers as $k=>$v){
                        Db::name('goods_gallery')->insert(array('info_id'=>$info_id,'cover'=>$v));//goods_gallery批量插入
                    }
                    foreach ($lists as $k2=>$v2){
                        $standard_id = Db::name("standard")->insertGetId(array('name'=>$v2['name'],'info_id'=>$info_id,'create_time'=>time()));//standard插入
                        foreach ($v2['vals'] as $k3=>$v3){
                            Db::name("standard_value")->insert(array(
                                'info_id'=>$info_id,
                                'standard_id'=>$standard_id,
                                'standard_value'=>$v3,
                                'create_time'=>time())
                            );//standard_value插入
                        }
                    }
                    foreach ($goods_lists as $k4=>$v4){
                        $godosdata['sku'] = trim($v4['sku']);
                        $godosdata['info_id'] = $info_id;
                        if($v4['standard_value1']){
                            $godosdata['standard_value1'] = trim($v4['standard_value1']);
                        }
                        if(empty($v4['standard_value2'])){
                            $godosdata['standard_value2'] = '';
                        }else{
                            $godosdata['standard_value2'] = trim($v4['standard_value2']);
                        }
                        if(empty($v4['standard_value3'])){
                            $godosdata['standard_value3'] = '';
                        }else{
                            $godosdata['standard_value3'] = trim($v4['standard_value3']);
                        }
                        $godosdata['price'] = trim($v4['price']);
                        $godosdata['costprice'] = trim($v4['costprice']);
                        $godosdata['fenxiao_rate'] = trim($v4['fenxiao_rate']);

                        $godosdata['create_time'] = time();
                        Db::name("goods")->insert($godosdata);//goods插入
                    }
                    return ['status'=>1,'info'=>'添加成功','url'=>'/admin/goods/index'];
                }else{
                    Db::name("goods_info")->where("id={$info_id}")->delete();
                    return ['status'=>0,'info'=>'添加失败'];
                }
            }else{

                $info_id = Db::name("goods_info")->insertGetId($data);//goods_info插入
                if($info_id > 0){
                    foreach ($covers as $k=>$v){
                        Db::name('goods_gallery')->insert(array('info_id'=>$info_id,'cover'=>$v));//goods_gallery批量插入
                    }
                    $godosdata['sku'] = trim($data['sku']);
                    $godosdata['info_id'] = $info_id;
                    $godosdata['price'] = trim($data['price']);
                    $godosdata['costprice'] = trim($data['costprice']);
                    $godosdata['fenxiao_rate'] = trim($data['fenxiao_rate']);

                    $godosdata['create_time'] = time();
                    Db::name("goods")->insert($godosdata);//goods插入
                    return ['status'=>1,'info'=>'添加成功','url'=>'/admin/goods/index'];
                }else{
                    Db::name("goods_info")->where("id={$info_id}")->delete();
                    return ['status'=>0,'info'=>'添加失败'];
                }
            }
        } else {
            $plist = Db::name("goods_category")->where("pid=0 and status=1")->select();
            foreach ($plist as $k=>$v){
                $plist[$k]['children'] = Db::name("goods_category")->where("pid={$v['id']}")->select();
            }
            $this->assign('plist',$plist);
            $ulist = Db::name("goods_unit")->where("status=1")->select();
            $this->assign('ulist',$ulist);
            return view();
        }
    }


    /**
     * 编辑商品
     * @author 835173372@qq.com
     */
    public function goods_edit()
    {
        //更新数据
        if (Request::instance()->isPost()) {
            $id = input("request.id");//规格商品主键id
            $info_id = input("request.info_id");//goods_info 主键id

            // 接收post数据
            $covers = json_decode(input("request.covers"),true);//相册集合
            $goods_info = json_decode(input("request.goods_info"),true);//基本信息

            $data['goods_name'] = $goods_info["goods_name"];
            $data['cate_id'] = trim(input("request.cate_id"));
            $data['unit_id'] = trim(input("request.unit_id"));
            $data['is_new'] = $goods_info["is_new"];
            $data['is_rec'] = $goods_info["is_rec"];
            $data['is_hot'] = $goods_info["is_hot"];
            $data['price'] = $goods_info["price"];
            $data['costprice'] = $goods_info["costprice"];
            $data['fenxiao_rate'] = $goods_info["fenxiao_rate"];
            $data['daili_rate'] = $goods_info["daili_rate"];
            $data['update_time'] = time();
            $data['content'] = $goods_info["content"];
            $data['putway'] = $goods_info["putway"];

            $res = Db::name('goods_info')->where("goods_name='{$data['goods_name']}' and id!={$info_id}")->find();
            if(!$res){
                Db::name('goods_info')->where("id={$info_id}")->update($data);
                Db::name('goods_gallery')->where("info_id={$info_id}")->delete();//全部删除再全部插入新数据
                foreach ($covers as $k=>$v){
                    Db::name('goods_gallery')->insert(array('info_id'=>$info_id,'cover'=>$v));//goods_gallery批量插入
                }
                Db::name('goods')
                    ->where("id={$id}")
                    ->update(
                        array(
                            'price'=>$data['price'],
                            'costprice'=>$data['costprice'],
                            'fenxiao_rate'=>$data['fenxiao_rate'],
                            'daili_rate'=>$data['daili_rate'],
                            'update_time'=>$data['update_time'],)
                    );
                return ['status'=>1,'info'=>'更新成功','url'=>'/admin/goods/index'];
            }else{
                return ['status'=>0,'info'=>'商品名称重复'];
            }
        }else{
            $id = input("request.id",0);
            $goods = Db::name('goods')->where("id={$id}")->find();
            $goods_info = Db::name("goods_info")->where("id={$goods['info_id']}")->find();
            $goods_info['price'] = $goods["price"];
            $goods_info['costprice'] = $goods["costprice"];
            $goods_info['fenxiao_rate'] = $goods["fenxiao_rate"];
            $goods_info['daili_rate'] = $goods["daili_rate"];

            $standardlist = Db::name("standard")->where("info_id={$goods_info['id']}")->select();
            $covers = Db::name("goods_gallery")->alias("a")->join("admin_upload b","a.cover=b.id")->field("a.*,b.url,b.name")->where("a.info_id={$goods_info['id']}")->select();
            $plist = Db::name("goods_category")->where("pid=0 and status=1")->select();
            foreach ($plist as $k=>$v){
                $plist[$k]['children'] = Db::name("goods_category")->where("pid={$v['id']}")->select();
            }
            $this->assign('plist',$plist);
            $ulist = Db::name("goods_unit")->where("status=1")->select();
            $this->assign('ulist',$ulist);
            $this->assign('goods_info',json_encode($goods_info));
            $this->assign('goods',json_encode($goods));
            $this->assign('standardlist',json_encode($standardlist));
            if( count($standardlist) > 0){
                $this->assign('duoguige',1);
            }else{
                $this->assign('duoguige',0);
            }
            $this->assign('covers',$covers);
            $this->assign('id',$id);
            $this->assign('info_id',$goods['info_id']);
            $cate_id = $goods_info['cate_id'];
            $cate_name = Db::name("goods_category")->where("id={$cate_id}")->value('cate_name');
            $unit_id = $goods_info['unit_id'];
            $unit_name = Db::name("goods_unit")->where("id={$unit_id}")->value('name');
            $this->assign('cate_id',$cate_id);
            $this->assign('cate_name',$cate_name);
            $this->assign('unit_id',$unit_id);
            $this->assign('unit_name',$unit_name);
            $this->assign('editor',$goods_info['content']);
            return view();
        }
    }

    /**
     * 删除商品
     * @author 835173372@qq.com
     */
    public function delete()
    {
        return view();
    }

    /**
     * 商品分类
     * @author 835173372@qq.com
     */
    public function cate_list()
    {
        if (Request::instance()->isPost()) {
            $queryText = trim(input("request.queryText"));
            $list = Db::name('goods_category')->where('cate_name','like',"%{$queryText}%")->paginate(15);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',($list->lastPage()));
            $this->assign('currentPage',($list->currentPage()));
            $this->assign('queryText',$queryText);
            $this->assign('page',$page);
            return view();
        } else {
            $list = Db::name('goods_category')->paginate(15);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',($list->lastPage()));
            $this->assign('currentPage',($list->currentPage()));
            $this->assign('queryText','');
            $this->assign('page',$page);
            return view();
        }
    }

    /**
     * 添加商品分类
     * @author 835173372@qq.com
     */
    public function cate_add()
    {
        if (Request::instance()->isPost()) {
            // 接收post数据
            $data['cate_name'] = trim(input('request.cate_name',''));
            $info = Db::name("goods_category")->where("cate_name='{$data['cate_name']}'")->find();
            if($info){
                return ['status'=>0,'info'=>'分类名称重复'];
            }
            $data['cover'] = input('request.cover',0);
            $data['pid'] = input('request.pid');
            $data['create_time'] = time();
            $data['sort'] = input('request.sort',0);
            $data['status'] = 1;
            $id = Db::name("goods_category")->insertGetId($data);
            if($id > 0){
                return ['status'=>1,'info'=>'添加成功','url'=>'/admin/goods/cate_list'];
            }else{
                return ['status'=>0,'info'=>'添加失败'];
            }
        } else {
            $plist = Db::name("goods_category")->where("pid=0 and status=1")->select();
            $this->assign('plist',$plist);
            return view();
        }
    }

    /**
     * 编辑商品分类
     * @author 835173372@qq.com
     */
    public function cate_edit()
    {
        //更新数据
        if (Request::instance()->isPost()) {
            $id = input("request.id");
            // 接收post数据
            $data['cate_name'] = trim(input('request.cate_name',''));
            $info = Db::name("goods_category")->where("cate_name='{$data['cate_name']}' and id!={$id} ")->find();
            if($info){
                return ['status'=>0,'info'=>'分类名称重复'];
            }
            $data['cover'] = input('request.cover',0);
            $data['pid'] = input('request.pid',0);
            $data['update_time'] = time();
            $data['sort'] = input('request.sort',0);
            $res = Db::name("goods_category")->where("id={$id}")->update($data);
            if($res > 0){
                return ['status'=>1,'info'=>'更新成功','url'=>'/admin/goods/cate_list'];
            }else{
                return ['status'=>0,'info'=>'更新失败'];
            }
        }else{
            $id = input("request.id");
            $info = Db::name("goods_category")->where("id={$id} and status=1")->find();
            $cover = Db::name("admin_upload")->where("id={$info['cover']}")->find();
            $plist = Db::name("goods_category")->where("pid=0 and status=1")->select();
            $this->assign('plist',$plist);
            $this->assign('info',$info);
            $this->assign('cover',$cover);
            $pname = Db::name("goods_category")->where("id={$info['pid']}")->value('cate_name');
            $this->assign('pid',$info['pid']);
            $this->assign('pname',$pname);
            return view();
        }
    }

    /**
     * 删除商品分类
     * @author 835173372@qq.com
     */
    public function cate_delete()
    {
        //查询数据
        if (Request::instance()->isPost()) {
            $id = input("request.id");
            $res = Db::name("goods_category")->where("id={$id}")->delete();
            if($res > 0){
                return ['status'=>1,'info'=>'删除成功','url'=>'refresh'];
            }else{
                return ['status'=>0,'info'=>'删除失败'];
            }
        }
    }
    public function cate_setstatus(){
        if (Request::instance()->isPost()) {
            $ids = implode(',',$_POST['ids']);
            $data['status'] = $_POST['status'];
            $res = Db::name("goods_category")->where('id','in',$ids)->update($data);
            if($res > 0){
                return ['status'=>1,'info'=>'设置成功','url'=>'refresh'];
            }else{
                return ['status'=>0,'info'=>'设置失败'];
            }
        }
    }
    /**
     * 商品推介
     * @author 835173372@qq.com
     */
    public function recommend_list()
    {
        $group1_list = Db::name("app_ads")->where("group_id=1")->select();
        $group2_list = Db::name("app_ads")->where("group_id=2")->select();
        $this->assign('group1_list',$group1_list);
        $this->assign('group2_list',$group2_list);
        return view();
    }
    public function recommend_add()
    {
        if (Request::instance()->isPost()) {
            // 接收post数据
            $data['title'] = trim(input("request.title"));
            $data['content'] = trim(input("request.content"));
            $data['goods_id'] = trim(input("request.goods_id"));
            $data['cover'] = trim(input("request.cover"));
            $data['group_id'] = trim(input("request.group_id"));
            $data['create_time'] = time();
            $id = Db::name('app_ads')->insertGetId($data);
            if($id > 0){
                return ['status'=>1,'info'=>'添加成功','url'=>'/admin/goods/recommend_list'];
            }else{
                return ['status'=>0,'info'=>'添加失败'];
            }
        } else {
            return view();
        }
    }
    public function recommend_edit()
    {
        if (Request::instance()->isPost()) {
            // 接收post数据
            $id = trim(input("request.id"));
            $data['title'] = trim(input("request.title"));
            $data['content'] = trim(input("request.content"));
            $data['goods_id'] = trim(input("request.goods_id"));
            $data['cover'] = trim(input("request.cover"));
            $data['group_id'] = trim(input("request.group_id"));
            $data['update_time'] = time();
            $res = Db::name('app_ads')->where("id={$id}")->update($data);
            if($res > 0){
                return ['status'=>1,'info'=>'更新成功','url'=>'/admin/goods/recommend_list'];
            }else{
                return ['status'=>0,'info'=>'更新失败'];
            }
        } else {
            $id = input("request.id");
            $info = Db::name("app_ads")->where("id={$id}")->find();
            $cover = Db::name("admin_upload")->where("id={$info['cover']}")->find();
            $this->assign('info',$info);
            $this->assign('cover',$cover);
            return view();
        }
    }
    public function recommend_delete()
    {
        $id = input("request.id");
        $res = Db::name("app_ads")->where("id={$id}")->delete();
        if($res > 0){
            return ['status'=>1,'info'=>'删除成功','url'=>'refresh'];
        }else{
            return ['status'=>0,'info'=>'删除失败'];
        }
    }

    /**
     * 商品单位
     * @author 835173372@qq.com
     */
    public function unit_list()
    {
        if (Request::instance()->isPost()) {
            $queryText = trim(input("request.queryText"));
            $list = Db::name('goods_unit')->where('name','like',"%{$queryText}%")->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',($list->lastPage()));
            $this->assign('currentPage',($list->currentPage()));
            $this->assign('queryText',$queryText);
            $this->assign('page',$page);
            return view();
        } else {
            $list = Db::name('goods_unit')->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',($list->lastPage()));
            $this->assign('currentPage',($list->currentPage()));
            $this->assign('queryText','');
            $this->assign('page',$page);
            return view();
        }
    }
    public function unit_add(){
        if (Request::instance()->isPost()) {
            // 接收post数据
            $data['name'] = trim(input('request.name',''));
            $info = Db::name("goods_unit")->where("name='{$data['name']}'")->find();
            if($info){
                return ['status'=>0,'info'=>'单位名称重复'];
            }
            $data['create_time'] = time();
            $id = Db::name("goods_unit")->insertGetId($data);
            if($id > 0){
                return ['status'=>1,'info'=>'添加成功','url'=>'/admin/goods/unit_list'];
            }else{
                return ['status'=>0,'info'=>'添加失败'];
            }
        } else {
            return view();
        }
    }
    public function unit_edit(){
        //更新数据
        if (Request::instance()->isPost()) {
            $id = input("request.id");
            // 接收post数据
            $data['name'] = trim(input('request.name',''));
            $info = Db::name("goods_unit")->where("name='{$data['name']}' and id!={$id} ")->find();
            if($info){
                return ['status'=>0,'info'=>'单位名称重复'];
            }
            $res = Db::name("goods_unit")->where("id={$id}")->update($data);
            if($res > 0){
                return ['status'=>1,'info'=>'更新成功','url'=>'/admin/goods/unit_list'];
            }else{
                return ['status'=>0,'info'=>'更新失败'];
            }
        }else{
            $id = input("request.id",0);
            $info = Db::name("goods_unit")->where("id={$id} and status=1")->find();
            $this->assign('info',$info);
            return view();
        }
    }
    public function unit_delete(){
        if (Request::instance()->isPost()) {
            $id = input("request.id");
            $res = Db::name("goods_unit")->where("id={$id}")->delete();
            if($res > 0){
                return ['status'=>1,'info'=>'删除成功','url'=>'refresh'];
            }else{
                return ['status'=>0,'info'=>'删除失败'];
            }
        }
    }
    public function unit_setstatus(){
        if (Request::instance()->isPost()) {
            $ids = implode(',',$_POST['ids']);
            $data['status'] = $_POST['status'];
            $res = Db::name("goods_unit")->where('id','in',$ids)->update($data);
            if($res > 0){
                return ['status'=>1,'info'=>'设置成功','url'=>'refresh'];
            }else{
                return ['status'=>0,'info'=>'设置失败'];
            }
        }
    }
}