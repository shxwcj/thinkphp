<?php
/**
 * Created by PhpStorm.
 * User: 835173372@qq.com
 * NickName: 孟老师
 * Date: 2016/12/20 10:29
 */
namespace app\admin\controller;

use think\Request;
use think\Config;
use think\Db;

class System extends Common
{
    public function index()
    {
        return view();
    }

    public function admin_user(){
        if (Request::instance()->isPost()) {
            // 接收post数据
            $map = array();
            $queryText = trim(input("request.queryText"));
            if($queryText){
                $map['id|username']  = ['like',"%$queryText%"];
            }
            $map['id'] = array('gt',1);
            $list = Db::name("admin_user")->where($map)->order("id desc")->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('queryText',$queryText);
            return view();
        } else {
            $map = array();
            $map['id'] = array('gt',1);
            $list = Db::name("admin_user")->where($map)->order("id desc")->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('queryText','');
            return view();
        }
    }

    public function admin_user_add(){
        if (Request::instance()->isPost()) {
            // 接收post数据
            $mobile = input('request.mobile','');
            $count = Db::name("admin_user")->where("mobile='{$mobile}'")->count();

            if($count > 0){
                return ['status'=>0,'info'=>'手机号被占用'];
            }


            $data['nickname'] = input('request.nickname');
            $data['username'] = input('request.username');
            $data['password'] = md5(trim(input('request.password')));
            $data['mobile'] = input('request.mobile');
            $data['mobile_bind'] = 1;
            $data['create_time'] = time();
            $data['status'] = 1;
            $uid = Db::name("admin_user")->insertGetId($data);
            $group_data['uid'] = $uid;
            $group_data['group'] = input('request.group');
            $group_data['create_time'] = time();
            $group_data['status'] = 1;
            $id = Db::name("admin_access")->insertGetId($group_data);
            if($id > 0){
                return ['status'=>1,'info'=>'添加成功','url'=>'/admin/system/admin_user'];
            }else{
                return ['status'=>0,'info'=>'添加失败'];
            }
        } else {
            $plist = Db::name("admin_group")->where("status=1")->select();
            $this->assign('plist',$plist);
            return view();
        }
    }
    public function admin_user_edit(){
        if (Request::instance()->isPost()) {
            // 接收post数据
            $id = input("request.id",0);
            $mobile = input('request.mobile');
            $count = Db::name("admin_user")->where("mobile={$mobile} and id!={$id}")->count();
            if($count > 0){
                return ['status'=>0,'info'=>'手机号被占用'];
            }
            $data['nickname'] = input('request.nickname');
            $data['username'] = input('request.username');
            if(input('request.password')){
                $data['password'] = md5(trim(input('request.password')));
            }
            $data['mobile'] = input('request.mobile');
            $data['mobile_bind'] = 1;
            $data['update_time'] = time();
            $data['status'] = 1;
            if(!empty($_POST['store_ids'])){
                $data['store_ids'] = implode(',',$_POST['store_ids']);
                $this->assign('store_ids',json_encode($_POST['store_ids'],true));
            }else{
                $this->assign('store_ids',json_encode(array(),true));
            }
            Db::name("admin_user")->where("id={$id}")->update($data);//更新管理员表

            $group_data['group'] = input('request.group');
            $group_data['create_time'] = time();
            $group_data['status'] = 1;
            $res = Db::name("admin_access")->where("uid={$id}")->update($group_data);//更新权限组表
            if($res > 0){
                return ['status'=>1,'info'=>'更新成功','url'=>'/admin/system/admin_user'];
            }else{
                return ['status'=>0,'info'=>'更新失败'];
            }
        } else {
            $id = input("request.id",0);
            $info = Db::name("admin_user")->where("id={$id}")->find();
            $group = Db::name("admin_access")->where("uid={$id}")->value('group');
            $plist = Db::name("admin_group")->where("status=1")->select();
            $pname = Db::name("admin_group")->where("id={$group}")->value('title');
            $this->assign('plist',$plist);
            $this->assign('info',$info);
            $this->assign('group',$group);
            $this->assign('pname',$pname);
            $store_list = Db::name('store')->select();
            $this->assign('store_list',json_encode($store_list,true));
            $this->assign('store_ids',json_encode(explode(',',$info['store_ids']),true));
            return view();
        }
    }
    public function admin_user_delete()
    {
        if (Request::instance()->isPost()) {
            $id = input("request.id");
            $res = Db::name("admin_user")->where("id={$id}")->delete();
            if($res > 0){
                return ['status'=>1,'info'=>'删除成功','url'=>'refresh'];
            }else{
                return ['status'=>0,'info'=>'删除失败'];
            }
        }
    }
    public function admin_user_setstatus(){
        if (Request::instance()->isPost()) {
            $ids = implode(',',$_POST['ids']);
            $data['status'] = $_POST['status'];
            $res = Db::name("admin_user")->where('id','in',$ids)->update($data);
            if($res > 0){
                return ['status'=>1,'info'=>'设置成功','url'=>'refresh'];
            }else{
                return ['status'=>0,'info'=>'设置失败'];
            }
        }
    }


    public function admin_group(){
        if (Request::instance()->isPost()) {
            // 接收post数据
            $map = array();
            $queryText = trim(input("request.queryText"));
            if($queryText){
                $map['id|title']  = ['like',"%$queryText%"];
            }
            $map['id'] = array('gt',1);
            $list = Db::name("admin_group")->where($map)->order("id desc")->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('queryText',$queryText);
            return view();
        } else {
            $map = array();
            $map['id'] = array('gt',1);
            $list = Db::name("admin_group")->where($map)->order("id desc")->paginate(10);
            $page = $list->render();
            $this->assign('list',$list);
            $this->assign('lastpage',$list->lastPage());
            $this->assign('currentPage',$list->currentPage());
            $this->assign('page',$page);
            $this->assign('queryText','');
            return view();
        }
    }

    public function admin_group_add()
    {
        if (Request::instance()->isPost()) {
            // 接收post数据
            $data['title'] = trim(input('request.title', ''));
            $data['menu_auth'] = trim(input("request.list"));
            $data['create_time'] = time();
            $data['status'] = 1;
            $id = Db::name("admin_group")->insertGetId($data);
            if ($id > 0) {
                return ['status' => 1, 'info' => '添加成功', 'url' => '/admin/system/admin_group'];
            } else {
                return ['status' => 0, 'info' => '添加失败'];
            }
        } else {
            $list = Config::get('admin_menu');
            $this->assign('list',json_encode($list,true));
            return view();
        }
    }

    public function admin_group_edit()
    {
        if (Request::instance()->isPost()) {
            // 接收post数据
            $id = trim(input('request.id', 0));
            $data['title'] = trim(input('request.title', ''));
            $data['menu_auth'] = trim(input("request.list"));
            $data['create_time'] = time();
            $data['status'] = 1;
            $id = Db::name("admin_group")->where("id={$id}")->update($data);
            if ($id > 0) {
                return ['status'=>1,'info'=>'更新成功','url'=>'/admin/system/admin_group'];
            } else {
                return ['status' => 0, 'info' => '添加失败'];
            }
        } else {
            $id = input("request.id",0);
            $info = Db::name("admin_group")->where("id={$id}")->find();
            $menu_auth = json_decode($info['menu_auth'],true);
            $list = Config::get('admin_menu');
            foreach ($list as $k=>$v){
                foreach ($v['list'] as $k2=>$v2){
                    if(isset($menu_auth[$k]['list'][$k2]['status'])){
                        if($menu_auth[$k]['list'][$k2]['status']){
                            $list[$k]['list'][$k2]['status'] = 1;
                        }

                    }
                }
            }
            $this->assign('list',json_encode($list,true));
            $this->assign('title',$info['title']);
            $this->assign('id',$id);
            return view();
        }
    }

    public function admin_group_delete()
    {
        if (Request::instance()->isPost()) {
            $id = input("request.id");
            $res = Db::name("admin_group")->where("id={$id}")->delete();
            if($res > 0){
                return ['status'=>1,'info'=>'删除成功','url'=>'refresh'];
            }else{
                return ['status'=>0,'info'=>'删除失败'];
            }
        }
    }

    public function admin_group_setstatus(){
        if (Request::instance()->isPost()) {
            $ids = implode(',',$_POST['ids']);
            $data['status'] = $_POST['status'];
            $res = Db::name("admin_group")->where('id','in',$ids)->update($data);
            if($res > 0){
                return ['status'=>1,'info'=>'设置成功','url'=>'refresh'];
            }else{
                return ['status'=>0,'info'=>'设置失败'];
            }
        }
    }


    public function transfee()
    {
        if (Request::instance()->isPost()) {

            // 接收post数据
            $list = Db::name('store')->alias("a")
                ->join("store_template b", "a.id=b.store_id", "LEFT")
                ->field("a.*,b.basesum,b.baseprice,b.oversum,b.overprice,b.id as template_id")
                ->paginate(10);
            $page = $list->render();
            $this->assign('list', $list);
            $lists = $list->toArray();
            $this->assign('lists', json_encode($lists['data']));
            $this->assign('lastpage', $list->lastPage());
            $this->assign('currentPage', $list->currentPage());
            $this->assign('page', $page);
            return view();
        } else {
            $list = Db::name('store')->alias("a")
                ->join("store_template b", "a.id=b.store_id", "LEFT")
                ->field("a.*,b.basesum,b.baseprice,b.oversum,b.overprice,b.id as template_id")
                ->paginate(10);
            $page = $list->render();
            $this->assign('list', $list);
            $lists = $list->toArray();
            $this->assign('lists', json_encode($lists['data']));
            $this->assign('list', $lists['data']);
            $this->assign('lastpage', $list->lastPage());
            $this->assign('currentPage', $list->currentPage());
            $this->assign('page', $page);
            return view();
        }
    }

    public function transfee_set()
    {
        $store_id = input('request.id');
        $store_info = Db::name("store")->where("id={$store_id}")->find();

        /*
        $count = Db::name('trans_template')->where("store_id={$store_id} and is_common=1")->count();
        if(!$count){
            Db::name('trans_template')->insert(array(
                'store_id'=>$store_id,
                'pos_name'=>'通用',
                'store_id'=>$store_id,
                'basesum'=>50,
                'baseprice'=>20,
                'oversum'=>10,
                'overprice'=>1,
                'is_common'=>1,
                'create_time'=>time(),
            ));
        }
        */

        $lists = Db::name('trans_template')->where("store_id={$store_id}")->order("is_common desc")->select();
        $this->assign('store_info', $store_info);
        $this->assign('lists', json_encode($lists));
        return view();
    }

    public function transfee_add()
    {
        $template_id = intval(trim(input('request.id')));
        $data['pos_province'] = trim(input('request.pos_province'));
        $data['pos_city'] = trim(input('request.pos_city'));
        $data['pos_district'] = trim(input('request.pos_district'));
        $data['pos_name'] = trim(input('request.pos_name'));
        $data['store_id'] = trim(input('request.store_id'));
        $data['basesum'] = trim(input('request.basesum'));
        $data['baseprice'] = trim(input('request.baseprice'));
        $data['oversum'] = trim(input('request.oversum'));
        $data['overprice'] = trim(input('request.overprice'));
        $data['create_time'] = time();

        if ($template_id > 0) {
            $map['pos_province'] = $data['pos_province'];
            $map['pos_city'] = $data['pos_city'];
            $map['pos_district'] = $data['pos_district'];
            $map['store_id'] = $data['store_id'];
            $count = Db::name('trans_template')->where($map)->where("id!={$template_id}")->count();
            if($count >0){
                return ['status' => 0, 'info' => '区域设置重复'];
            }
            $id = Db::name('trans_template')->where("id={$template_id}")->update($data);//更新
            if ($id > 0) {
                return ['status' => 1, 'info' => '保存成功'];
            } else {
                return ['status' => 0, 'info' => '保存失败'];
            }
        } else {
            $map['pos_province'] = $data['pos_province'];
            $map['pos_city'] = $data['pos_city'];
            $map['pos_district'] = $data['pos_district'];
            $map['store_id'] = $data['store_id'];
            $count = Db::name('trans_template')->where($map)->count();
            if($count >0){
                return ['status' => 0, 'info' => '区域设置重复'];
            }
            $id = Db::name('trans_template')->insertGetId($data);//添加
            if ($id > 0) {
                return ['status' => 1, 'info' => '保存成功', 'id' => $id];
            } else {
                return ['status' => 0, 'info' => '保存失败'];
            }
        }
    }

    public function transfee_delete()
    {
        $template_id = intval(trim(input('request.id')));
        $id = Db::name('trans_template')->where("id={$template_id}")->delete();//删除
        return ['status' => 1, 'info' => '取消成功'];
    }

    public function storefee()
    {
        if (Request::instance()->isPost()) {

            // 接收post数据
            $list = Db::name('store')->alias("a")
                ->join("store_template b", "a.id=b.store_id", "LEFT")
                ->field("a.*,b.basesum,b.baseprice,b.oversum,b.overprice,b.id as template_id")
                ->paginate(10);
            $page = $list->render();
            $this->assign('list', $list);
            $lists = $list->toArray();
            $this->assign('lists', json_encode($lists['data']));
            $this->assign('lastpage', $list->lastPage());
            $this->assign('currentPage', $list->currentPage());
            $this->assign('page', $page);
            return view();
        } else {
            $list = Db::name('store')->alias("a")
                ->join("store_template b", "a.id=b.store_id", "LEFT")
                ->field("a.*,b.basesum,b.baseprice,b.oversum,b.overprice,b.id as template_id")
                ->paginate(10);
            $page = $list->render();
            $this->assign('list', $list);
            $lists = $list->toArray();
            $this->assign('lists', json_encode($lists['data']));
            $this->assign('lastpage', $list->lastPage());
            $this->assign('currentPage', $list->currentPage());
            $this->assign('page', $page);
            return view();
        }
    }

    public function storefee_add()
    {

        $template_id = intval(trim(input('request.template_id')));
        $data['store_id'] = trim(input('request.store_id'));
        $data['basesum'] = trim(input('request.basesum'));
        $data['baseprice'] = trim(input('request.baseprice'));
        $data['oversum'] = trim(input('request.oversum'));
        $data['overprice'] = trim(input('request.overprice'));
        $data['create_time'] = time();
        if ($template_id > 0) {

            $id = Db::name('store_template')->where("id={$template_id}")->update($data);//更新
            if ($id > 0) {
                return ['status' => 1, 'info' => '保存成功'];
            } else {
                return ['status' => 0, 'info' => '保存失败'];
            }
        } else {

            $id = Db::name('store_template')->insertGetId($data);//添加
            if ($id > 0) {
                return ['status' => 1, 'info' => '保存成功'];
            } else {
                return ['status' => 0, 'info' => '保存失败'];
            }
        }
    }

    public function storefee_delete()
    {
        $template_id = intval(trim(input('request.template_id')));
        $id = Db::name('store_template')->where("id={$template_id}")->delete();//删除
        if ($id > 0) {
            return ['status' => 1, 'info' => '取消成功'];
        } else {
            return ['status' => 0, 'info' => '取消失败'];
        }
    }

    public function sharefee()
    {
        if (Request::instance()->isPost()) {
            $minwithdraw = input("request.minwithdraw");
            $maxwithdraw = input("request.maxwithdraw");
            $numwithdraw = input("request.numwithdraw");
            $limitwithdraw = input("request.limitwithdraw");
            $withdrawrate = input("request.withdrawrate");
            Db::name('admin_config')->where('name','minwithdraw')->setField('value', $minwithdraw);
            Db::name('admin_config')->where('name','maxwithdraw')->setField('value', $maxwithdraw);
            Db::name('admin_config')->where('name','numwithdraw')->setField('value', $numwithdraw);
            Db::name('admin_config')->where('name','limitwithdraw')->setField('value', $limitwithdraw);
            Db::name('admin_config')->where('name','withdrawrate')->setField('value', $withdrawrate);
            return ['status' => 1, 'info' => '更新成功'];
        } else {
            $minwithdraw = Db::name("admin_config")->where("name='minwithdraw'")->value('value');
            $maxwithdraw = Db::name("admin_config")->where("name='maxwithdraw'")->value('value');
            $numwithdraw = Db::name("admin_config")->where("name='numwithdraw'")->value('value');
            $limitwithdraw = Db::name("admin_config")->where("name='limitwithdraw'")->value('value');
            $withdrawrate = Db::name("admin_config")->where("name='withdrawrate'")->value('value');
            $this->assign('minwithdraw',$minwithdraw);
            $this->assign('maxwithdraw',$maxwithdraw);
            $this->assign('numwithdraw',$numwithdraw);
            $this->assign('limitwithdraw',$limitwithdraw);
            $this->assign('withdrawrate',$withdrawrate);
            if($numwithdraw >0){
                $this->assign('rselect',1);
            }else{
                $this->assign('rselect',2);
            }
            return view();
        }
    }
}