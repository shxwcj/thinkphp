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

class Cms extends Common{
    public function index(){
        $map = array();
        $queryText = trim(input("request.queryText",''));
        if($queryText){
            $map['id|title|content']  = ['like',"%$queryText%"];
        }
        $list = Db::name("cms_article")->where($map)->order("id desc")
            ->paginate(10,false,['query' => array('queryText' => $queryText),]);
        $this->assign('list',$list);
        return view();
    }
    public function article_add()
    {
        if (Request::instance()->isPost()) {
            // 接收post数据
            $data['title'] = trim(input('request.title'));
            $data['cate_id'] = input('request.cate_id');
            $data['create_time'] = time();
            $data['sort'] = input('request.sort','');
            $data['content'] = input('request.editor','');;
            $id = Db::name("cms_article")->insertGetId($data);
            if($id > 0){
                return ['status'=>1,'info'=>'添加成功','url'=>'/admin/cms/index'];
            }else{
                return ['status'=>0,'info'=>'添加失败'];
            }
        } else {
            $this->assign('editor','');
            $plist = Db::name("cms_category")->where("pid=0 and status=1")->select();
            $this->assign('plist',$plist);
            return view();
        }
    }
    public function article_edit()
    {
        //更新数据
        if (Request::instance()->isPost()) {
            $id = input("request.id");

            // 接收post数据
            $data['title'] = input('request.title');
            $data['cate_id'] = input('request.cate_id',0);
            $data['sort'] = input('request.sort',0);
            $data['content'] = input('request.editor');
            $data['update_time'] = time();
            $res = Db::name("cms_article")->where("id={$id}")->update($data);
            if($res > 0){
                return ['status'=>1,'info'=>'更新成功','url'=>'/admin/cms/index'];
            }else{
                return ['status'=>0,'info'=>'更新失败'];
            }
        }else{
            $id = input("request.id");
            $info = Db::name("cms_article")->where("id={$id}")->find();
            $plist = Db::name("cms_category")->where("pid=0 and status=1")->select();
            $this->assign('plist',$plist);
            $this->assign('info',$info);
            $this->assign('id',$id);
            $pname = Db::name("cms_category")->where("id={$info['cate_id']}")->value('cate_name');
            $this->assign('pid',$info['cate_id']);
            $this->assign('pname',$pname);
            $this->assign('editor',$info['content']);
            return view();
        }
    }


    public function cate_list()
    {
        $map = array();
        $queryText = trim(input("request.queryText",''));
        if($queryText){
            $map['cate_name']  = ['like',"%$queryText%"];
        }
        $list = Db::name('cms_category')->where($map)->paginate(10);
        $this->assign('list',$list);
        return view();
    }
    public function cate_add()
    {
        if (Request::instance()->isPost()) {
            // 接收post数据
            $data['cate_name'] = trim(input('request.cate_name',''));
            $info = Db::name("cms_category")->where("cate_name='{$data['cate_name']}'")->find();
            if($info){
                return ['status'=>0,'info'=>'分类名称重复'];
            }
            $data['cover'] = input('request.cover',0);
            $data['pid'] = input('request.pid');
            $data['create_time'] = time();
            $data['sort'] = input('request.sort',0);
            $data['status'] = 1;
            $id = Db::name("cms_category")->insertGetId($data);
            if($id > 0){
                return ['status'=>1,'info'=>'添加成功','url'=>'/admin/cms/cate_list'];
            }else{
                return ['status'=>0,'info'=>'添加失败'];
            }
        } else {
            $plist = Db::name("cms_category")->where("pid=0 and status=1")->select();
            $this->assign('plist',$plist);
            return view();
        }
    }
    public function cate_edit()
    {
        //更新数据
        if (Request::instance()->isPost()) {
            $id = input("request.id");
            // 接收post数据
            $data['cate_name'] = trim(input('request.cate_name',''));
            $info = Db::name("cms_category")->where("cate_name='{$data['cate_name']}' and id!={$id} ")->find();
            if($info){
                return ['status'=>0,'info'=>'分类名称重复'];
            }
            $data['cover'] = input('request.cover',0);
            $data['pid'] = input('request.pid',0);
            $data['update_time'] = time();
            $data['sort'] = input('request.sort',0);
            $res = Db::name("cms_category")->where("id={$id}")->update($data);
            if($res > 0){
                return ['status'=>1,'info'=>'更新成功','url'=>'/admin/cms/cate_list'];
            }else{
                return ['status'=>0,'info'=>'更新失败'];
            }
        }else{
            $id = input("request.id");
            $info = Db::name("cms_category")->where("id={$id} and status=1")->find();
            $cover = Db::name("admin_upload")->where("id={$info['cover']}")->find();
            $plist = Db::name("cms_category")->where("pid=0 and status=1")->select();
            $this->assign('plist',$plist);
            $this->assign('info',$info);
            $this->assign('cover',$cover);
            $pname = Db::name("cms_category")->where("id={$info['pid']}")->value('cate_name');
            $this->assign('pid',$info['pid']);
            $this->assign('pname',$pname);
            return view();
        }
    }
    public function cate_delete()
    {
        //查询数据
        if (Request::instance()->isPost()) {
            $id = input("request.id");
            $res = Db::name("cms_category")->where("id={$id}")->delete();
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
            $res = Db::name("cms_category")->where('id','in',$ids)->update($data);
            if($res > 0){
                return ['status'=>1,'info'=>'设置成功','url'=>'refresh'];
            }else{
                return ['status'=>0,'info'=>'设置失败'];
            }
        }
    }
    public function article_delete(){
        if (Request::instance()->isPost()) {
            $ids = implode(',',$_POST['ids']);
            $data['status'] = $_POST['status'];
            $res = Db::name("cms_article")->where('id','in',$ids)->delete();
            if($res > 0){
                return ['status'=>1,'info'=>'设置成功','url'=>'refresh'];
            }else{
                return ['status'=>0,'info'=>'设置失败'];
            }
        }
    }
    public function article_delete_one()
    {
        //查询数据
        if (Request::instance()->isPost()) {
            $id = input("request.id");
            $res = Db::name("cms_article")->where("id={$id}")->delete();
            if($res > 0){
                return ['status'=>1,'info'=>'删除成功','url'=>'refresh'];
            }else{
                return ['status'=>0,'info'=>'删除失败'];
            }
        }
    }
}