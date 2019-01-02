<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018-12-31
 * Time: 15:51
 */

namespace app\app\controller;

use think\Db;

class Card extends Base
{
    /**
     * @desc 充值提现管理：认证前
     * @author wangchunjing
     */

    public function member_card_before()
    {
        $mid = $this->is_login();
        if($member_card = Db::name('member_card')->where('mid',$mid)->find()){
            return ajaxmsg('金额',1,$member_card);
        }else{
            return ajaxmsg('不存在此用户',0);
        }

    }

    /**
     * @desc 充值提现管理：认证后
     * @author wangchunjing
     */

    public function member_card_update()
    {
        $mid = $this->is_login();
        $id = input("request.id");
        $data['card_number'] = input("request.card_number"); //卡号
        $mobile = input("request.mobile");     //预留手机号
        $data['auth_name'] = input("request.auth_name");     //开户人姓名
        $data['auth_number'] = input("request.auth_number"); //开户人身份证号
        $data['create_time'] = time();
        $data['is_default'] = 1;
        $data['mid'] = $mid;
        if(! $id){
           return ajaxmsg('请输入id',0);
        }

        if(! $data['card_number']){
            return ajaxmsg('卡号不能为空',0);
        }

        $reg = '/^([1-9]{1})(\d{14}|\d{18})$/';
        if(!preg_match($reg,$data['card_number'])){
            return ajaxmsg('请正确输入银行卡号',0);
        }

        if(!$mobile){
            return ajaxmsg('手机号不能为空',0);
        }

        $regs = '/^1[34578]\d{9}$/';
        if(!preg_match($regs,$mobile)){
            return ajaxmsg('手机号不匹配',0);
        }

        if(! $data['auth_name']){
            return ajaxmsg('开户人姓名不能为空',0);
        }

        if(! $data['auth_number']){
            return ajaxmsg('开户人身份证号不能为空',0);
        }


        $auth = '/^([\d]{17}[xX\d]|[\d]{15})$/';
        if(!preg_match($auth,$data['auth_number'])){
            return ajaxmsg('开户人身份证号不匹配',0);
        }

        /*验证银行卡四要素*/
        $res = $this->check( $data['card_number'], $mobile,$data['auth_name'], $data['auth_number']);
        $res = json_decode($res,true);
        $data['card_bank'] = $res['bankName'];

        if($res['respCode'] != '0000'){
            return ajaxmsg($res['respMessage'],0);
        }


        if (Db::name('member_card')->where('id',$id)->find()){
            /*若存在则更新数据*/
            if($res = Db::name("member_card")->where("id={$id} and mid={$mid}")->update($data)){
                return ajaxmsg('更新成功',1,$res);
            }else{
                return ajaxmsg('更新失败',0);
            }
        }else{
            /*若不存在 则插入*/
            if($res = Db::name("member_card")->insert($data)){
                return ajaxmsg('认证成功',1,$res);
            }else{
                return ajaxmsg('认证失败',0);
            }
        }
    }

    /**
     * @desc 银行卡4要素认证
     *  $cardNo 银行卡号
     * $phoneNo 手机号
     * $name 开户名
     * $idNo 身份证号码
     * @author wangchunjing
     */

    public function check($cardNo,$phoneNo,$name,$idNo)
    {
        $host = "https://yunyidata.market.alicloudapi.com";
        $path = "/bankAuthenticate4";
        $method = "POST";
        $appcode = "e21e6c0c2285479099652d2a12d4b620";
        $headers = array();
        array_push($headers, "Authorization:APPCODE " . $appcode);
        //根据API的要求，定义相对应的Content-Type
        array_push($headers, "Content-Type".":"."application/x-www-form-urlencoded; charset=UTF-8");
        $querys = "";
        $bodys = "ReturnBankInfo=YES&cardNo=$cardNo&idNo=$idNo&name=$name&phoneNo=$phoneNo";
        $url = $host . $path;

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($curl, CURLOPT_FAILONERROR, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HEADER, true);
        if (1 == strpos("$".$host, "https://"))
        {
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        }
        curl_setopt($curl, CURLOPT_POSTFIELDS, $bodys);
        return curl_exec($curl);

    }

    /**
     * @desc 提现
     *
     * @author wangchunjing
     */

    public function withdraw_before()
    {
        $mid = $this->is_login();
        $member_info = Db::name('member')->where('id',$mid)->find();
        $member_info['withdrawrate'] = Db::name('admin_config')->where('name','withdrawrate')->value('value');
        $member_info['minwithdraw'] = Db::name('admin_config')->where('name','minwithdraw')->value('value');
        $member_info['maxwithdraw'] = Db::name('admin_config')->where('name','maxwithdraw')->value('value');
        return ajaxmsg('提现金额',1,$member_info);
    }

    /**
     * @desc 提现操作
     * @author wangchunjing
     */

    public function withdraw_after()
    {
        $mid = $this->is_login();
        $member_info = Db::name('member')->where('id',$mid)->find();
        $money = input("request.money",0);
        if($money > $member_info['money']){
            return ajaxmsg('提现金额不能多余账户金额',0);
        }
        if(intval($money) <= 0){
            return ajaxmsg('金额不能为负数',0);
        }
        $withdrawrate = Db::name('admin_config')->where('name','withdrawrate')->value('value');
        /*添加提现记录*/
        $withdraw_id = Db::name('member_withdraw')->insert(array(
            'mid'   =>  $mid,
            'money' =>  $money,
            'recevie_money' =>  $money - (ceil(($money*$withdrawrate)/100)), //实际到账金额
            'create_time'   =>  time(),
        ));
        if($withdraw_id){
           Db::name('member')->where('id',$mid)->setField('money',$member_info['money']-$money);
           $res = Db::name('member_withdraw')->where('mid',$mid)->find();
           return ajaxmsg('提交成功',1,$res);
        }else{
            return ajaxmsg('提交失败',0);
        }
    }

    /**
     * @desc 删除提现记录
     * @author wangchunjing
     */

    public function member_withdraw_delete()
    {
        $mid = $this->is_login();
        $id = input("request.id");
        if(! $id){
            return ajaxmsg('请选择要删除的记录',0);
        }
        if(Db::name('member_withdraw')->where('mid',$mid)->where('id',$id)->find()){
            if(Db::name('member_withdraw')->where('mid',$mid)->where('id',$id)->delete()){
                return ajaxmsg('删除成功',1);
            }else{
                return ajaxmsg('删除失败',0);
            }
        }else{
            return ajaxmsg('不存在此条记录',0);
        }

    }

    /**
     * @desc 我的钱包
     * @author wangchunjing
     */

    public function my_wallet()
    {
        $mid = $this->is_login();
        $data['member_info'] = Db::name('member')->where('id',$mid)->find();
        $res = Db::name('member_withdraw')->where('mid',$mid)->order('id','desc')->paginate(10)->toArray();
        $data['total'] = $res['total'];
        $data['per_page'] = $res['per_page'];
        $data['current_page'] = $res['current_page'];
        $data['list'] = $res['data'];
        return ajaxmsg('我的钱包',1,$data);
    }

    /**
     * @desc 分佣记录
     * @author wangchunjing
     */

    public function withdraw_order_list()
    {
        $type = input("request.type");
        if(! $type || intval($type) <= 0){
            return ajaxmsg('分佣类型不能为空或为负数',0);
        }
        /*区域代理id*/
        $map['a.area_agent_id'] = array('eq',$type);

        $mid = $this->is_login();
        if(Db::name('order_fenxiao')->where('from_mid',$mid)->where('area_agent_id',$type)->find()){
            $res = Db::name('order_fenxiao a')
                ->join('member b','a.from_mid = b.id')
                ->field('a.*,b.mobile')
                ->where($map)
                ->paginate(10)
                ->toArray();
            return ajaxmsg('分佣记录',1,$res);
        }else{
            return ajaxmsg('该用户不存在此类型的分佣记录',0);
        }


    }
}