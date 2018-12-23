<?php
//配置文件
return [
    //支付宝配置参数
    'alipay_config'=>array(
        //商户的私钥,此处填写原始私钥去头去尾，RSA公私钥生成：https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.nBDxfy&treeId=58&articleId=103242&docType=1
        'private_key' =>'MIICXQIBAAKBgQC7cqOmekyzg7dYlJZkiqCzKSS8giHxqkbOdtDpWlNHUbNR4JzdqN98bVhxrND68L2MSlLHxuegvLGmklsAaIYF6bk/HNTpNOaGu/bk00ZAx4K4V3rkUwcfmV8srFVp+u+Mui4FVfci/404tLqejNVruY9nIlMQFAP27W88GE58/wIDAQABAoGBAKMumLMMEwvQJePybr6WRHHT5oxJCX3Vy5BftV0AajFTObWUwVricbRjiLRlSwS6YXjpFwmd6fVvb4RgMuK3G7w5oppbrqa7Me2kozx1PJ3cb2TV8L/HCi+XR6gIqzLFYL3/SGmwJkWMw4EzPTOh+dHRL3v9irfZYuzDRxWkJ38ZAkEA65XLL1vbmJU8BPk8FTH51whSzkenwWNJ+DhflKk6ZiiFl3YdYlMnLoYQMKY04l0ImU+xHkjsR+zfzhIISjUh7QJBAMuw+FpTBgTqtaJjB8D38gWHvWr8dbr/UXhbz0/mG3e0GYu/4llvIKMbcJ6dSDERAsemjbQ2MkyGMrizb1oKbRsCQQDN+cYQviudmL1FS/RwQ6XBkJF1scjGmN0PnZpUDDH3J+7FoovGcBWN48E8B9WtJNJj2P1vESslJ8H2FmYRG6txAkB9XzXd0pA34oddpfqVyYcL5FqwSSflq1Tn8gqOMSHi8dVvcPHO/llmS3NsDX7rxH6jiF5b96fJ9ieuC7OUBirVAkB45s45NnZbmtmtNDjIpLmDbfiSE2ugXw1JWUGeou4sRPuMX6e/SwkXjfMdTngCPMOlX5MwDIdme7fhuPLcSFL6',
        //支付宝的公钥，查看地址：https://openhome.alipay.com/platform/keyManage.htm?keyType=partner
        'alipay_public_key' =>'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB',
        'service' =>'mobile.securitypay.pay',//接口名称，固定值
        'partner' =>'2088411441452114',
        'input_charset' =>strtolower('utf-8'),
        'notify_url' =>'http://test.mydinghuo.com/index.php/app/order/alipay_notify_url',
        'payment_type' =>1,
        'seller_id' =>'835173372@qq.com',
        'cacert' =>getcwd().'/cacert.pem',
        'transport' =>'http',
        'sign_type' =>strtoupper('RSA'),
    ),


    //=======【微信支付基本信息设置】=====================================
    //
    /**
     * TODO: 修改这里配置为您自己申请的商户信息
     * 微信公众号信息配置
     *
     * APPID：绑定支付的APPID（必须配置，开户邮件中可查看）
     *
     * MCHID：商户号（必须配置，开户邮件中可查看）
     *
     * KEY：商户支付密钥，参考开户邮件设置（必须配置，登录商户平台自行设置）
     * 设置地址：https://pay.weixin.qq.com/index.php/account/api_cert
     *
     * APPSECRET：公众帐号secert（仅JSAPI支付的时候需要配置， 登录公众平台，进入开发者中心可设置），
     * 获取地址：https://mp.weixin.qq.com/advanced/advanced?action=dev&t=advanced/dev&token=2005451881&lang=zh_CN
     * @var string
     */

    'wxpay_config'=>array(
        'appid'=>'wxba88116cd0f494f1',
        'mch_id'=>'1435696402',
        'key'=>'431ccc08b621a02167105268e673da57',
        'appsecret'=>'b304911d6a19f7728d264dfd698eba6f',
        'notify_url'=>'http://test.mydinghuo.com/index.php/app/order/wxpay_before'
    ),
];