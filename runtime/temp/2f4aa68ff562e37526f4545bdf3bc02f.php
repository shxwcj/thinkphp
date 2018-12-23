<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:86:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\index\index.html";i:1489977912;s:86:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\public\head.html";i:1484792114;s:88:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\public\navbar.html";i:1489979851;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title></title>
    <link rel="shortcut icon" href="/favicon.ico">
    <link href="STATIC_PATH/sui/css/sui.css" rel="stylesheet">
    <link href="STATIC_PATH/sui/css/sui-append.css" rel="stylesheet">
    <link href="STATIC_PATH/assets/css/layout.css" rel="stylesheet">
    <link href="STATIC_PATH/assets/css/common.css" rel="stylesheet">
    <!--[if lt IE 9]><script src="STATIC_PATH/assets/js/html5shiv.js"></script><![endif]-->
    <script type="text/javascript" src="STATIC_PATH/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="STATIC_PATH/plugins/layer/layer.js"></script>
    <script type="text/javascript" src="STATIC_PATH/sui/js/sui.min.js"></script>
    <script type="text/javascript" src="STATIC_PATH/assets/js/common.js"></script>
    <script type="text/javascript" src="STATIC_PATH/assets/js/vue.js"></script>
    <style>
        .nav-withicon-r {
        }

        .nav-withicon-r li {
            padding-top: 4px;
        }

        .nav-withicon-r li .sui-icon {
            width: 28px;
            height: 28px;
            display: block;
            margin: 0px auto 2px;
            font-size: 23px !important;
            color: #fff !important;
        }

        .nav-withicon-r li.active .sui-icon {
            opacity: 1 !important;
        }
        .set-table {
            width: 100%;
            border-collapse: collapse;
        }

        .set-table tr {
        }

        .set-table tr td {
            padding-top: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #efefef;
        }

        .set-table tr.noline td{
            border-bottom: none;
            padding-top: 5px;
            padding-bottom: 5px;
        }

        .set-table .set-cols1 {
            width: 70px;
            text-align: right;
            vertical-align: top;
        }

        .set-table .text-l{
            text-align: left !important;
        }

        .set-table .set-cols2 {
        }

        .set-table .set-cols2 label {
            display: inline-block;
            margin-bottom: 6px;
        }
        .w82{
            width: 82px!important;
        }
        .mr15{
            margin-right: 15px;
        }
        .coslist {
            border: solid 1px #eee;
        }
        .sidebar .sui-nav{
            border: 1px solid #efefef;
            border-bottom: none;
        }
        .sidebar .sui-nav li a{
            border-bottom: 1px solid #efefef;
        }

        .radio-pretty-new span {
            margin-right: 10px !important;
        }
        .sui-form.form-horizontal .control-group {
            margin-bottom: 10px !important;
        }
        .sui-form {
            margin: 0 0 10px !important;
        }
        .sui-layout .sidebar {
            position: fixed;
            top: 63px;
            padding-top: 15px;
            margin-top: 0px !important;
        }

        .c-pagination {
            margin: 18px 0;
            text-align: right;
        }
        .c-pagination ul {
            display: inline-block;
            margin-left: 0;
            margin-bottom: 0;
            vertical-align: middle;
        }
        .c-pagination ul > li {
            display: inline;
        }
        .c-pagination ul > li > a,
        .c-pagination ul > li > span {
            position: relative;
            float: left;
            padding: 0px 5px;
            line-height: 18px;
            text-decoration: none;
            color: #28a3ef;
            background-color: #ffffff;
            border: 1px solid #e0e9ee;
            margin-left: -1px;
        }
        .c-pagination ul > li > a > i.sui-icon,
        .c-pagination ul > li > span > i.sui-icon {
            line-height: 18px;
        }
        .c-pagination ul > li > a:hover,
        .c-pagination ul > li > a:focus {
            color: #ffffff;
            background-color: #4cb9fc;
            border-color: #4cb9fc;
        }
        .c-pagination ul > .active > a,
        .c-pagination ul > .active > span {
            background-color: #28a3ef;
            color: #ffffff;
            border-color: #28a3ef;
            cursor: default;
        }
        .c-pagination ul > .active > a:hover,
        .c-pagination ul > .active > span:hover,
        .c-pagination ul > .active > a:focus,
        .c-pagination ul > .active > span:focus {
            background-color: #28a3ef;
            color: #ffffff;
            border-color: #28a3ef;
        }
        .c-pagination ul > .dotted > span,
        .c-pagination ul > .dotted > a {
            border-top: none;
            border-bottom: none;
        }
        .c-pagination ul > .disabled > span,
        .c-pagination ul > .disabled > a,
        .c-pagination ul > .disabled > a:hover,
        .c-pagination ul > .disabled > a:focus {
            color: #999999;
            background-color: transparent;
            cursor: default;
        }
        .c-pagination ul > .prev > span,
        .c-pagination ul > .next > span,
        .c-pagination ul > .prev > a,
        .c-pagination ul > .next > a {
            background-color: #fafafa;
        }
        .c-pagination ul > .disabled.prev > span:hover,
        .c-pagination ul .disabled.next > span:hover,
        .c-pagination ul > .disabled.prev > span:focus,
        .c-pagination ul .disabled.next > span:focus,
        .c-pagination ul > .disabled.prev > a:hover,
        .c-pagination ul .disabled.next > a:hover,
        .c-pagination ul > .disabled.prev > a:focus,
        .c-pagination ul .disabled.next > a:focus {
            background-color: #fafafa;
            border-color: #e0e9ee;
        }
        .c-pagination .prev + .prev a,
        .c-pagination .next + .next a {
            margin-left: 5px;
        }
        .c-pagination .ex-page-num {
            display: inline-block;
            height: 18px;
            padding: 2px 4px;
            font-size: 12px;
            line-height: 18px;
            color: #555555;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            vertical-align: middle;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -webkit-transition: border linear .2s, box-shadow linear .2s;
            -moz-transition: border linear .2s, box-shadow linear .2s;
            -o-transition: border linear .2s, box-shadow linear .2s;
            transition: border linear .2s, box-shadow linear .2s;
            padding-top: 2px;
            padding-bottom: 2px;
            width: 18px;
            float: left;
            margin: 0px 5px;
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
        }
        .c-pagination .ex-page-num:focus {
            border-color: #28a3ef;
            outline: 0;
            outline: thin dotted \9;
            /* IE6-9 */
        }
    </style>
</head>
<style>
    .u-header-box {
        position: relative;
        border: 1px solid #e6e6e6;
        padding: 10px;
        margin-bottom: 10px;
    }

    .u-header-box p {
        margin-bottom: 5px;
    }

    .u-header-box .name {
        font-size: 18px;
    }

    .u-header-box .sui-text-warning {
        font-size: 14px;
    }

    .u-header-box .time {
        position: absolute;
        right: 10px;
        top: 10px;
    }

    .u-total-box {
        margin-bottom: 10px;
    }

    .u-total-box .total-ul {
        list-style: none;
        margin: 0px;
        padding: 0px;
    }

    .u-total-box .total-ul li {
        width: 19%;
        position: relative;
        padding-bottom: 20px;
        margin-right: 1%;
        background: #efefef;
        text-align: center;
    }

    .u-total-box .total-ul li .tit {
        padding-top: 20px;
        margin: 0px;
    }

    .u-total-box .total-ul li .price {
        padding-top: 6px;
        font-size: 16px;
        color: #FF6600;
        margin: 0px;
    }

    .u-total-box .total-ul li .new-tip {
        padding-top: 10px;
        border-top: 1px solid #ececec;
        width: 85%;
        margin: 15px auto 0px auto;
    }

    .u-total-box .total-ul li .new-tip .sum {
        color: #FF6600;
    }

    .fl {
        float: left;
    }

    .fr {
        float: right;
    }

    .mr0 {
        margin-right: 0px;
    }

    .sui-layout .content {
        margin-left: 0px !important;
    }

    .ph-tit {
        color: #FF6600;
        font-size: 14px;
        border-bottom: 1px solid #ececec;
        font-weight: normal;
    }
</style>
<body>
<div class="sui-layout">
    <header class="sui-navbar navbar-fixed-top">
    <div class="navbar-inner"><a href="#" class="sui-brand sui-text-center"><img src="STATIC_PATH/assets/img/logo.png">管理后台</a>
        <ul class="sui-nav nav-withicon">
            <li class="menuitem menuworkbench"><a href="<?php echo url('index/index'); ?>"><i class="icon icon-workbench"></i>工作台</a></li>
            <li class="menuitem menuorder"><a href="<?php echo url('order/index'); ?>"><i class="icon icon-order"></i>订单</a></li>
            <li class="menuitem menugoods"><a href="<?php echo url('goods/index'); ?>"><i class="icon icon-goods"></i>商品</a></li>

            <li class="menuitem menudrp"><a href="<?php echo url('drp/index'); ?>"><i class="icon icon-drp"></i>分销商</a></li>

            <li class="menuitem cms"><a href="<?php echo url('cms/index'); ?>"><i class="icon icon-agent"></i>cms管理</a></li>
        </ul>
        <ul class="sui-nav pull-right nav-withicon nav-withicon-r">
            <li class="menuitem settings"><a href="<?php echo url('system/admin_user'); ?>"><i class="sui-icon icon-pc-settings"></i>&nbsp;设置</a></li>
            <li><a href="javascript:void(0)" onclick='removeRuntime("<?php echo url('index/removeRuntime'); ?>")'>
                <i class="sui-icon icon-tb-delete"></i>&nbsp;清除缓存</a>
            </li>
            <li><a href="/admin/#/index"><i class="sui-icon icon-pc-question-circle"></i>&nbsp;帮助</a></li>
            <li><a href="<?php echo url('login/logout'); ?>"><i class="sui-icon icon-touch-right-rect"></i>&nbsp;退出</a></li>
        </ul>
    </div>
</header>
    <div class="main-t" id="app">
        <div class="content">
            <div class="breadcrumb">
                <ul class="sui-breadcrumb breadcrumb-dark">
                    <li><a href="/admin/index/index">首页</a></li>
                    <li class="active">工作台</li>
                </ul>
            </div>
            <div class="u-total-box">
                <ul class="total-ul clearfix">
                    <li class="fl" style="background: rgba(216, 240, 251, 0.47);">
                        <p class="tit">订单总计</p>
                        <p class="price sui-text-warning"><?php echo $order_sum; ?></p>
                        <p class="new-tip">今日新增 <a href="<?php echo url('order/index'); ?>" class="sum"><?php echo $order_sum2; ?>>></a></p>
                    </li>
                    <li class="fl" style=" background: rgba(243, 241, 222, 0.21);">
                        <p class="tit">在售商品</p>
                        <p class="price sui-text-warning"><?php echo $goods_sum; ?></p>
                        <p class="new-tip">今日新增 <a href="<?php echo url('goods/index'); ?>" class="sum"><?php echo $goods_sum2; ?>>></a></p>
                    </li>

                    <li class="fl" style="background:rgba(73, 84, 230, 0.14);">
                        <p class="tit">分销商</p>
                        <p class="price sui-text-warning"><?php echo $member_sum; ?></p>
                        <p class="new-tip">今日新增 <a href="<?php echo url('drp/index'); ?>" class="sum"><?php echo $member_sum2; ?>>></a></p>
                    </li>

                </ul>
            </div>
            <!--
            <table class="sui-table">
                <tr>
                    <td>
                        <h3 class="ph-tit">商品销量Top10</h3>
                        <table class="sui-table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>商品名称</th>
                                <th>规格</th>
                                <th>销量</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>D20161005-452011</td>
                                <td>2016-10-05 14:07</td>
                                <td>心花怒放 18411002140</td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                    <td>
                        <h3 class="ph-tit">代理业绩Top10</h3>
                        <table class="sui-table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>代理商</th>
                                <th>销售额</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>D20161005-452011</td>
                                <td>2016-10-05 14:07</td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                    <td>
                        <h3 class="ph-tit">分销佣金Top10</h3>
                        <table class="sui-table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>分销商</th>
                                <th>佣金</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>D20161005-452011</td>
                                <td>2016-10-05 14:07</td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </table>
            -->
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $(".menuitem").removeClass("active");
        $(".menuworkbench").addClass("active");
    });
</script>