<?php
/**
 * Created by PhpStorm.
 * User: 835173372@qq.com
 * NickName: 半城村落
 * Date: 2016/11/2 10:42
 */
namespace app\app\controller;
use think\Config;
use think\Db;
use Alipay\Alipaynotify;
use Wxpay\Wxpay;
class Order extends Base
{

    //订单确认
    function order_confirm()
    {

        $mid = $this->is_login();
        //$mid = 22;
        $trans_type = input("request.trans_type", 1);//默认通用配送方式
        $address_info = Db::name("member_address")->where("mid={$mid} and is_default=1")->find();
        $list = Db::name("goods_cart")->alias("a")
            ->join("goods b", "a.goods_id=b.id", "LEFT")
            ->join("goods_info c", "b.info_id=c.id", "LEFT")
            ->join("goods_gallery d", "c.id=d.info_id", "LEFT")
            ->join("admin_upload e", "d.cover=e.id", "LEFT")
            ->field("a.*,c.goods_name,b.price,b.standard_value1,b.standard_value2,b.standard_value3,e.url,(a.goods_sum*b.price) as sum_price")
            ->where("a.mid={$mid} and a.status=1 and a.goods_sum>0")
            ->group("a.goods_id")
            ->order("a.create_time desc")
            ->select();
        $total_price = 0;
        $goods_sum = 0;
        foreach ($list as $v) {
            $total_price += $v['sum_price'];
            $goods_sum += $v['goods_sum'];
        }
        $data['address_info'] = $address_info;
        $data['list'] = $list;
        $data['total_price'] = $total_price;
        $transport_count = $this->transport_count($mid,$goods_sum,$trans_type);
        $data['trans_price'] = $transport_count['trans_price'];
        $data['order_total'] = $total_price + $data['trans_price'];
        ajaxmsg('ok',1,$data);
    }

    /*运费计算 $trans_type:1,通用，2：仓库配送，3：物流配送
      return array();
    */
    function transport_count($mid, $total_sum, $trans_type = 1)
    {
        $trans_price = 0;
        $freecharge_value = Db::name("admin_config")->where("name='freecharge'")->value("value");//免运费设置
        $address_info = Db::name("member_address")->where("mid={$mid} and is_default=1")->find();
        if(!$address_info){
            return array('trans_price'=>'0.00','store_id'=>0);
        }
        $pos_province = $address_info['pos_province'];
        $pos_city = $address_info['pos_city'];
        $pos_district = $address_info['pos_district'];



        //根据收货地址（业务区域）定位服务仓库
        $store_area = Db::name("store_area")
            ->where("pos_province={$pos_province} and pos_city={$pos_city} and pos_district={$pos_district}")
            ->find();


        //print_r($store_area);exit;

        if (!$store_area) {//走总仓库
            switch ($trans_type) {

                case 3://总仓库物流配送
                    $info = Db::name("trans_template")->where("is_common=1")->find();//总仓库通用物流模板
                    $basesum = $info['basesum'];
                    $baseprice = $info['baseprice'];
                    $oversum = $info['oversum'];
                    $overprice = $info['overprice'];
                    if ($total_sum >= $freecharge_value) {
                        return array('trans_price'=>$trans_price,'store_id'=>$info['store_id']);
                    }
                    if ($total_sum <= $basesum) {
                        return array('trans_price'=>$baseprice,'store_id'=>$info['store_id']);
                    } else {
                        return array('trans_price'=>$baseprice + ceil(($total_sum - $basesum) / $oversum) * $overprice,'store_id'=>$info['store_id']);
                    }
                    break;
                default:
                    $info = Db::name("store_template")->where("is_common=1")->find();//总仓库通用自营运费模板
                    $basesum = $info['basesum'];
                    $baseprice = $info['baseprice'];
                    $oversum = $info['oversum'];
                    $overprice = $info['overprice'];
                    if ($total_sum >= $freecharge_value) {
                        return array('trans_price'=>$trans_price,'store_id'=>$info['store_id']);
                    }
                    if ($total_sum <= $basesum) {
                        return array('trans_price'=>$baseprice,'store_id'=>$info['store_id']);
                    } else {
                        return array('trans_price'=>$baseprice + ceil(($total_sum - $basesum) / $oversum) * $overprice,'store_id'=>$info['store_id']);
                    }
                    break;
            }

        } else {

            //每个仓库有一套物流模板，包括通用和自定义，先选择自定义，然后通用，如果都不满足，总仓库发货。
            $store_id = $store_area['store_id'];
            switch ($trans_type) {

                case 3://指定仓库物流配送
                    $trans_template = Db::name("trans_template")
                        ->where("pos_province={$pos_province} and pos_city={$pos_city} and pos_district={$pos_district} and store_id={$store_id}")
                        ->find();
                    if ($trans_template) {
                        $info = $trans_template;//指定仓库物流模板
                    } else {
                        $info = Db::name("trans_template")->where("is_common=1")->find();//总仓库通用物流模板
                    }
                    $basesum = $info['basesum'];
                    $baseprice = $info['baseprice'];
                    $oversum = $info['oversum'];
                    $overprice = $info['overprice'];
                    if ($total_sum >= $freecharge_value) {
                        return array('trans_price'=>$trans_price,'store_id'=>$info['store_id']);
                    }
                    if ($total_sum <= $basesum) {
                        return array('trans_price'=>$baseprice,'store_id'=>$info['store_id']);
                    } else {
                        return array('trans_price'=>$baseprice + ceil(($total_sum - $basesum) / $oversum) * $overprice,'store_id'=>$info['store_id']);
                    }
                    break;
                default:
                    $store_template = Db::name("store_template")
                        ->where("store_id={$store_id}")
                        ->find();
                    if ($store_template) {
                        $info = $store_template;//指定仓库运费模板
                    } else {
                        $info = Db::name("store_template")->where("is_common=1")->find();//总仓库通用运费模板
                    }
                    $basesum = $info['basesum'];
                    $baseprice = $info['baseprice'];
                    $oversum = $info['oversum'];
                    $overprice = $info['overprice'];
                    if ($total_sum >= $freecharge_value) {
                        return array('trans_price'=>$trans_price,'store_id'=>$info['store_id']);
                    }
                    if ($total_sum <= $basesum) {
                        return array('trans_price'=>$baseprice,'store_id'=>$info['store_id']);
                    } else {
                        return array('trans_price'=>$baseprice + ceil(($total_sum - $basesum) / $oversum) * $overprice,'store_id'=>$info['store_id']);
                    }
                    break;
            }
        }

    }

    //创建订单
    function order_create(){
        $mid = $this->is_login();
        $content = input("request.content", '');
        $trans_type = input("request.trans_type", 1);//默认通用配送方式
        $address_info = Db::name("member_address")->where("mid={$mid} and is_default=1")->find();
        $list = Db::name("goods_cart")->alias("a")
            ->join("goods b", "a.goods_id=b.id", "LEFT")
            ->join("goods_info c", "b.info_id=c.id", "LEFT")
            ->join("goods_gallery d", "c.id=d.info_id", "LEFT")
            ->join("admin_upload e", "d.cover=e.id", "LEFT")
            ->field("a.*,c.goods_name,b.price,b.standard_value1,b.standard_value2,b.standard_value3,e.url,(a.goods_sum*b.price) as sum_price")
            ->where("a.mid={$mid} and a.status=1")
            ->group("a.goods_id")
            ->order("a.create_time desc")
            ->select();
        $total_price = 0;
        $goods_sum = 0;
        foreach ($list as $v) {
            $total_price += $v['sum_price'];
            $goods_sum += $v['goods_sum'];
        }
        if($goods_sum == 0){
            ajaxmsg('重复下单',1);
        }
        $transport_count = $this->transport_count($mid,$goods_sum,$trans_type);//运费计算
        $trans_price = $transport_count['trans_price'];
        $order_sn = create_order_sn();
        //订单数据
        $data['mid'] = $mid;
        $data['order_total'] = $total_price + $trans_price;
        $data['total_price'] = $total_price;
        $data['goods_sum'] = $goods_sum;
        $data['trans_price'] = $trans_price;
        $data['trans_type'] = $trans_type;
        $data['order_sn'] = $order_sn;
        $data['name'] = $address_info['name'];
        $data['mobile'] = $address_info['mobile'];
        $data['pos_province'] = $address_info['pos_province'];
        $data['pos_city'] = $address_info['pos_city'];
        $data['pos_district'] = $address_info['pos_district'];
        $data['address_info'] = $address_info['address_info'];
        $data['content'] = $content;
        $data['create_time'] = time();
        $data['store_id'] = $transport_count['store_id'];//发送仓库ID
        $order_id = Db::name('order')->insertGetId($data);//生成订单
        $order_goods = array();
        $order_goods_Array = array();
        foreach ($list as $k=>$v){
            $order_goods['order_id'] = $order_id;
            $order_goods['goods_id'] = $v['goods_id'];
            $order_goods['info_id'] = $v['info_id'];
            $order_goods['goods_name'] = $v['goods_name'];
            $order_goods['goods_total'] = $v['sum_price'];
            $order_goods['goods_sum'] = $v['goods_sum'];
            $order_goods['goods_price'] = $v['price'];
            $order_goods['create_time'] = time();
            $order_goods_Array[] = $order_goods;//订单商品表数据
        }
        Db::name("order_goods")->insertAll($order_goods_Array);//生成订单产品表
        $ids = array();
        foreach ($list as $v){
            //Db::name("goods_cart")->where("id={$v['id']}")->delete();//删除购物车数据表
            $ids[] = $v['id'];
        }
        Db::name("goods_cart")->delete($ids);//批量删除
        $arr['order_total'] = $total_price + $trans_price;
        $arr['order_sn'] = $order_sn;
        $arr['order_id'] = $order_id;
        ajaxmsg('true',1,$arr);
    }

    //支付宝支付
    function  alipay_before(){
        $mid = $this->is_login();
        require_once EXTEND_PATH.'Alipay/alipaycore.php';
        require_once EXTEND_PATH.'Alipay/alipayrsa.php';
        $order_id = input("request.order_id");
        if($order_id == 0){
            ajaxmsg('非法数据',0);
        }
        $order_info = Db::name("order")->where("id={$order_id}")->find();


        //建立请求
        $out_trade_no = $order_info['order_sn'];
        $total_fee = $order_info['total_price'] + $order_info['trans_price'];   //付款金额
        $body = '订单支付';  //商品详情
        $alipay_config = Config::get('alipay_config');
        //构造要请求的参数数组，无需改动
        $parameter = array(
            'partner'=>$alipay_config['partner'],//合作者身份ID
            'seller_id'=>$alipay_config['seller_id'],
            'out_trade_no'=>$out_trade_no,//商户网站唯一订单号
            'subject'=>'订单支付',//商品名称
            'body'=>$body,//商品详情
            'total_fee'=>$total_fee,
            'notify_url'=>$alipay_config['notify_url'],//服务器异步通知页面路径
            'service'=>$alipay_config['service'],//接口名称
            'payment_type'=>$alipay_config['payment_type'],//支付类型
            '_input_charset'=>$alipay_config['input_charset'],//参数编码字符集
        );
        //将post接收到的数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串。
        $data = createLinkstring($parameter);

        //打印待签名字符串。工程目录下的log文件夹中的log.txt。
        logResult($data);

        //将待签名字符串使用私钥签名,且做urlencode. 注意：请求到支付宝只需要做一次urlencode.
        $rsa_sign = urlencode(rsaSign($data, $alipay_config['private_key']));

        //把签名得到的sign和签名类型sign_type拼接在待签名字符串后面。
        $data = $data.'&sign='.'"'.$rsa_sign.'"'.'&sign_type='.'"'.$alipay_config['sign_type'].'"';

        //返回给客户端,建议在客户端使用私钥对应的公钥做一次验签，保证不是他人传输。
        //echo $data;
        $list['form'] = $data;
        ajaxmsg('ok',1,$list);
    }
    
    //支付宝支付通知
    public function alipay_notify_url()
    {
        $alipay_config = Config::get('alipay_config');
        //计算得出通知验证结果
        $alipayNotify = new Alipaynotify($alipay_config);
        if($alipayNotify->getResponse($_POST['notify_id']))//判断成功之后使用getResponse方法判断是否是支付宝发来的异步通知。
        {
            if($alipayNotify->getSignVeryfy($_POST, $_POST['sign'])) {//使用支付宝公钥验签

                //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
                //获取支付宝的通知返回参数，可参考技术文档中服务器异步通知参数列表
                //商户订单号
                $out_trade_no = $_POST['out_trade_no'];

                //支付宝交易号
                $trade_no = $_POST['trade_no'];

                //交易状态
                $trade_status = $_POST['trade_status'];

                if($_POST['trade_status'] == 'TRADE_FINISHED') {
                    //判断该笔订单是否在商户网站中已经做过处理
                    //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                    //如果有做过处理，不执行商户的业务程序
                    //注意：
                    //退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
                    //请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的
                }
                else if ($_POST['trade_status'] == 'TRADE_SUCCESS') {
                    $order_info = Db::name("order")->where("order_sn='{$out_trade_no}'")->find();
                    if($order_info['status'] == 0){

                        //更新支付状态和支付时间
                        Db::name("order")->where("id={$order_info['id']}")->save(
                            array(
                                'pay_ways'=>2,
                                "pay_sn"=>$trade_no,
                                'pay_time'=>time(),
                                'stauts'=>1
                            ));
                        $this->fenxiao_account($out_trade_no);
                    }
                }
                //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
                echo "success";		//请不要修改或删除
            }
            else //验证签名失败
            {
                echo "sign fail";
            }
        }
        else //验证是否来自支付宝的通知失败
        {
            echo "response fail";
        }
    }

    //微信支付-统一下单
    public function wxpay_before(){
        $mid = $this->is_login();
        $order_id = input("request.order_id");
        //$order_id = 56;
        if($order_id == 0){
            ajaxmsg('非法数据',0);
        }
        $order_info = Db::name("order")->where("id={$order_id}")->find();
        //建立请求
        $out_trade_no = $order_info['order_sn'];
        $total_fee = $order_info['total_price'] + $order_info['trans_price'];   //付款金额
        $body = '订单支付';  //商品详情
        $wxpay_config = Config::get('wxpay_config');

        //预支付，构造要请求的参数数组，无需改动
        $parameter = array(
            'appid'=>$wxpay_config['appid'],//微信开放平台审核通过的应用APPID
            'mch_id'=>$wxpay_config['mch_id'],//微信支付分配的商户号
            'nonce_str'=>$this->getNonceStr(),//随机字符串，不长于32位。推荐随机数生成算法
            'body'=>$body,//商品描述交易字段格式根据不同的应用场景按照以下格式：APP——需传入应用市场上的APP名字-实际商品名称，天天爱消除-游戏充值
            'out_trade_no'=>$out_trade_no,//String(32)商户系统内部的订单号,32个字符内
            'total_fee'=>$total_fee,//订单总金额，单位为分
            'spbill_create_ip'=>$this->get_client_ip(),//用户端实际ip
            'notify_url'=>$wxpay_config['notify_url'],//String(256)	接收微信支付异步通知回调地址，通知url必须为直接可访问的url，不能携带参数。
            'trade_type'=>'APP'//支付类型
        );


        $wxpay = new Wxpay($parameter);
        $parameter['sign'] = $wxpay->SetSign();//设置sign;第一次延签
        $xml = $wxpay->arrayToXml($parameter);
        $url='https://api.mch.weixin.qq.com/pay/unifiedorder';
        $response = $wxpay->postXmlCurl($xml,$url);//预支付返回信息，curl抛送请求微信预支付api接口，php的curl模拟提交函数
        $response_array = $wxpay->FromXml($response);//微信服务器返回的xml转化过的数组

        //print_r($response_array);exit;
        //调起支付接口，构造要请求的参数数组，无需改动
        $data = array(
            'appid'=>$wxpay_config['appid'],
            'mch_id'=>$wxpay_config['mch_id'],//微信支付分配的商户号
            'partnerid'=>$wxpay_config['mch_id'],
            'prepayid'=>$response_array['prepay_id'],//String(32) 预支付交易会话ID
            'package'=>'Sign=WXPay',//扩展字段,暂填写固定值Sign=WXPay
            'nonce_str'=>$this->getNonceStr(),
            'timestamp'=>time(),
        );
        $this->wxpay_getOrder($data);
    }

    //调起支付接口
    public function wxpay_getOrder($data){
        $wxpay = new Wxpay($data);
        $data['sign'] = $wxpay->SetSign();//设置sign,第二次设置签名
        ajaxmsg('ok',1,$data);
        //print_r($data);
    }
    public function weixin_notify_url(){

        //接受xml数据流开始
        $data = file_get_contents("php://input");//字符串数据流
        libxml_disable_entity_loader(true);
        $xmlArray = json_decode(json_encode(simplexml_load_string($data, 'SimpleXMLElement', LIBXML_NOCDATA)), true);//xml数据转换成array
        //接受xml数据流结束

        //php写一个日志文件

        //$xml可以理解为微信服务器返回给我们标准的php数组

        //支付成功
        if ($xmlArray['result_code'] == "SUCCESS") {
            $out_trade_no = $xmlArray['out_trade_no'];//订单号：业务逻辑区域
            $order_info = Db::name("order")->where("order_sn='{$out_trade_no}'")->find();

            //没有同步本地服务器数据
            if ($order_info['status'] == 0) {

                //更新支付状态和支付时间
                Db::name("order")->where("id={$order_info['id']}")->save(
                    array(
                        'pay_ways' => 2,
                        "pay_sn" => $xmlArray['transaction_id'],//微信支付订单号
                        'pay_time' => time(),
                        'status' => 1
                    ));
                $this->fenxiao_account($out_trade_no);
            }
            echo "SUCCESS";exit;

        } else {
            echo "FAIL";
            exit;
        }
    }
    /**
     *
     * 产生随机字符串，不长于32位
     * @param int $length
     * @return 产生的随机字符串
     */
    public function getNonceStr($length = 32)
    {
        $chars = "abcdefghijklmnopqrstuvwxyz0123456789";
        $str ="";
        for ( $i = 0; $i < $length; $i++ )  {
            $str .= substr($chars, mt_rand(0, strlen($chars)-1), 1);
        }
        return $str;
    }
    /*
    获取当前服务器的IP
    */
    public function get_client_ip()
    {
        if ($_SERVER['REMOTE_ADDR']) {
            $cip = $_SERVER['REMOTE_ADDR'];
        } elseif (getenv("REMOTE_ADDR")) {
            $cip = getenv("REMOTE_ADDR");
        } elseif (getenv("HTTP_CLIENT_IP")) {
            $cip = getenv("HTTP_CLIENT_IP");
        } else {
            $cip = "unknown";
        }
        return $cip;
    }

    /**
    分销清算：分销商（上线），代理商资金清算，走订单清算
     * $type=1,订单完成分销清算，$type=2,退回订单，分销清算
     */
    public function fenxiao_account($order_sn = '', $type = 1)
    {
        $order_sn = '2016120102646';
        if (intval($order_sn) == 0) {
            return;
        }
        $order_info = Db::name("order")->where("order_sn='{$order_sn}'")->find();

        $pos_province = $order_info['pos_province'];
        $pos_city = $order_info['pos_city'];
        $pos_district = $order_info['pos_district'];

        $order_id = $order_info['id'];
        $mid = $order_info['mid'];
        $pid = Db::name("member")->where("id={$mid}")->value("pid");//上线id
        $daili_id = Db::name("area_agent")->where("pos_province={$pos_province} and pos_city={$pos_city} and pos_district={$pos_district} and status=1")->value("mid");//区域代理id
        $area_agent_id = Db::name("area_agent")->where("pos_province={$pos_province} and pos_city={$pos_city} and pos_district={$pos_district} and status=1")->value("id");//区域代理id

        //购物清单list
        $order_goods = Db::name("order_goods")->alias("a")
            ->join("goods b","a.goods_id=b.id")
            ->field("a.*,b.fenxiao_rate,b.daili_rate,b.price,b.costprice,
            ((b.price-b.costprice)*a.goods_sum*b.fenxiao_rate/100) as fenxiao_total,
            ((b.price-b.costprice)*a.goods_sum*b.daili_rate/100) as daili_total")
            ->where("a.order_id={$order_id}")
            ->group("a.id")
            ->select();
        $fenxiao_total = 0;
        $daili_total = 0;
        foreach ($order_goods as $k=>$v){
            $fenxiao_total += $v['fenxiao_total'];//上线分佣总计
            $daili_total += $v['daili_total'];//代理分佣总计
        }
/*        echo $pid,'<br/>',$daili_id,'<br/>';
        echo $fenxiao_total;
        echo '<br/>';
        echo $daili_total,'<br/>';
        echo date('YmdHis',time());
        exit;*/
        switch ($type){

            //分销清算
            case 1:
                if($pid > 0){
                    Db::name("member")->where("id={$pid}")->setInc('money',$fenxiao_total);//更新上线账户资金
                    Db::name("order_fenxiao")->insert(array(
                        'from_mid'=>$mid,
                        'to_mid'=>$pid,
                        'order_id'=>$order_id,
                        'effect_money'=>$fenxiao_total,
                        'create_time'=>time()
                    ));
                }
                if($daili_id > 0){
                    Db::name("member")->where("id={$daili_id}")->setInc('money',$daili_total);//更新区域代理账户资金
                    Db::name("order_fenxiao")->insert(array(
                        'from_mid'=>$mid,
                        'to_mid'=>$daili_id,
                        'order_id'=>$order_id,
                        'area_agent_id'=>$area_agent_id,
                        'effect_money'=>$daili_total,
                        'create_time'=>time()
                    ));
                    Db::name('area_agent_order')->insert(array(
                        'service_number'=>date('YmdHis',time()),
                        'mid'=>$daili_id,
                        'aere_agent_id'=>$area_agent_id,
                        'order_id'=>$order_id,
                        'order_sn'=>$order_sn,
                        'create_time'=>time()
                    ));
                }
                break;
            case 2:
                if($pid > 0){
                    Db::name("member")->where("id={$pid}")->setDec('money',$fenxiao_total);//更新上线账户资金
                    Db::name("order_fenxiao")->insert(array(
                        'from_mid'=>$mid,
                        'to_mid'=>$pid,
                        'order_id'=>$order_id,
                        'effect_money'=>-$fenxiao_total,
                        'create_time'=>time()
                    ));
                }
                if($daili_id > 0){
                    Db::name("member")->where("id={$daili_id}")->setDec('money',$daili_total);//更新区域代理账户资金
                    Db::name("order_fenxiao")->insert(array(
                        'from_mid'=>$mid,
                        'to_mid'=>$daili_id,
                        'order_id'=>$order_id,
                        'area_agent_id'=>$area_agent_id,
                        'effect_money'=>-$daili_total,
                        'create_time'=>time()
                    ));
                }
                break;
        }




    }


    //订单列表
    public function order_list(){
        $mid = $this->is_login();
        $status = input("request.status",0);
        $res = Db::name("order")->where("mid={$mid} and status={$status}")->paginate(10);
        $tempres = $res->toArray();
        $list = $tempres['data'];
        foreach ($list as $k=>$v){
            $list[$k]['order_goods'] = Db::name('order_goods')->alias('a')
                ->join("goods b",'a.goods_id=b.id',"LEFT")
                ->join('goods_info c','b.info_id=c.id',"LEFT")
                ->join('goods_gallery d','c.id=d.info_id',"LEFT")
                ->join('admin_upload e','d.cover=e.id')
                ->group("d.info_id")
                ->where("a.order_id={$v['id']}")
                ->field('e.url,a.order_id,a.goods_id,a.info_id,a.goods_total,a.goods_sum,a.goods_price,b.standard_value1,b.standard_value2,b.standard_value3,c.goods_name')
                ->select();
        }
        ajaxmsg('true',1,$list);
    }

    //取消订单
    public  function order_cancel(){
        $mid = $this->is_login();
        $id = input("request.id",0);
        Db::name('order')->where("mid={$mid} and id={$id}")->setField('status',3);
        ajaxmsg('取消成功',1);
    }
}