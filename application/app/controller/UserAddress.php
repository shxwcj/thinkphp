<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/24
 * Time: 9:52
 */

namespace app\app\controller;

use think\Db;

class Useraddress extends Base
{
    /**
     * @desc 地址列表
     * @Author wangchunjing
     * @return array|false|string
     */

    public function list_address()
    {
        $mid =$this->is_login();
        if($res = Db::name("member_address")->where('mid',$mid)->where('status',1)->select()){
            return ajaxmsg('地址列表',1,$res);
        }else{
            return ajaxmsg('您还没有地址，请去添加',0);
        }
    }

    /**
     * @desc 添加收货地址
     * @Author wangchunjing
     * @return array|false|string
     */

    public function add_address()
    {
        $mid = $this->is_login();
        $name = input("request.name");                  //联系人姓名
        $mobile = input("request.mobile");              //联系人手机号
        $pos_province = input("request.pos_province");  //省
        $pos_city = input("request.pos_city");          //市区
        $pos_district = input("request.pos_district");  //区
        $pos_name = $pos_province.$pos_city.$pos_district;   //省市区
        $address_info = input("request.address_info");  //具体地址

       if (!$name){
            return ajaxmsg('请填写联系人',0);
        }elseif (!$mobile){
            return ajaxmsg('请填写手机号',0);
        }elseif (!$pos_province || !$pos_city || !$pos_district || !$address_info){
            return ajaxmsg('请填写省市区以及详细地址',0);
        }

        if(Db::name("member_address")->where("mid",$mid)->find()){
            $res = Db :: name("member_address")
                ->insert(array(
                'mid'          => $mid,
                'name'         => $name,
                'mobile'       => $mobile,
                'pos_province' => $pos_province,
                'pos_city'     => $pos_city,
                'pos_district' => $pos_district,
                'pos_name'     => $pos_name,
                'address_info' => $address_info,
                'create_time'  => time()
                ));
        }else{
            $res = Db::name("member_address")
                ->insert(array(
                'mid' => $mid,
                'name' => $name,
                'mobile' => $mobile,
                'pos_province' => $pos_province,
                'pos_city' => $pos_city,
                'pos_district' => $pos_district,
                'address_info' => $address_info,
                'is_default'    =>  1,
                'create_time' => time(),
            ));
        }
        if($res){
            $member_address = Db::name("member_address")->where($res)->find();
            return ajaxmsg('添加地址成功',1,$member_address);
        }else{
            return ajaxmsg('添加失败',0);
        }

    }

    /**
     * @desc 修改收货地址
     * @Author wangchunjing
     * @return array|false|string
     */

    public function update_address()
    {
        /*检测用户是否登录*/
        $mid = $this->is_login();
        $id = input("request.id");
        $name = input("request.name");  //联系人姓名
        $mobile = input("request.mobile"); //联系人手机号
        $pos_province = input("request.pos_province"); //省
        $pos_city = input("request.pos_city");          //市区
        $pos_district = input("request.pos_district");   //区
        $pos_name = $pos_province.$pos_city.$pos_district;   //省市区
        $address_info = input("request.address_info");   //具体地址

        if (!$name){
            return ajaxmsg('请填写联系人',0);
        }elseif (!$mobile){
            return ajaxmsg('请填写手机号',0);
        }elseif (!$pos_province || !$pos_city || !$pos_district || !$address_info){
            return ajaxmsg('请填写省市区以及详细地址',0);
        }

        if(! $id) {
            return ajaxmsg("非法操作",0);
        }
        if(Db::name("member_address")->where("mid",$mid)->where('id',$id)->find()){
            $res = Db::name("member_address")
                ->where('id',$id)
                ->update(array(
                'mid'           => $mid,
                'name'          => $name,
                'mobile'        => $mobile,
                'pos_province'  => $pos_province,
                'pos_city'      => $pos_city,
                'pos_district'  => $pos_district,
                'address_info'  => $address_info,
                'pos_name'      => $pos_name,
                'update_time'   => time(),
            ));
            if($res){
                $result = Db::name("member_address")->where($res)->find();
                return ajaxmsg('地址修改成功',1,$result);
            }else{
                return axajmsg('地址修改失败',0);
            }
        }else{
            return ajaxmsg('操作不合法，请重新操作',0);
        }

    }

    /**
     * @desc 删除收货地址
     * @Author wangchunjing
     * @return array|false|string
     */

    public function del_address()
    {
        $mid = $this->is_login();
        $id = input("request.id");
        if(! $id){
            return ajaxmsg('非法操作',0);
        }
        if(Db::name("member_address")->where('mid',$mid)->where('id',$id)->delete())
            return ajaxmsg('已删除',1);

            return ajaxmsg('删除失败',0);

    }

    /**
     * @desc 设置默认地址
     * @Author wangchunjing
     * @return array|false|string
     */

    public function set_default()
    {
        $mid =$this->is_login();
        $id = input("request.id");
        if(! $id){
           return ajaxmsg('非法操作',0);
        }
        /*将全部地址默认清楚*/
        Db::name("member_address")->where('mid',$mid)->update(array('is_default'=>0));
        if(Db::name("member_address")->where('mid',$mid)->where('id',$id)->update(array('is_default'=>1)))
            return ajaxmsg('设置成功',1);

            return ajaxmsg('设置失败',0);
    }








}