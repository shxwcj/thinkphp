<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:95:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\goods\recommend_list.html";i:1489979642;s:86:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\public\head.html";i:1484792114;s:88:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\public\navbar.html";i:1489979851;}*/ ?>
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
    .xian {

        overflow: hidden;
        margin-bottom: 10px;
        margin-top: 10px;
    }

    .xian .pull-left {
        width: 11%;
        color: #28a3ef;
        font-size: 14px;
    }

    .xian .pull-right {
        float: left;
        width: 87%;
        border-top: 1px dashed #CCCCCC;
        margin-top: 10px;
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
    <!--start 右侧-->
    <div class="main-t">
        <div class="sidebar">
            <ul class="sui-nav nav-list nav-large">
                <li><a href="<?php echo url('goods/index'); ?>">商品列表</a></li>
                <li class="active"><a href="<?php echo url('goods/recommend_list'); ?>"><i class="sui-icon icon-tb-right pull-right mt3"></i>商品推介</a></li>
                <li><a href="<?php echo url('goods/cate_list'); ?>">分类管理</a></li>
                <li><a href="<?php echo url('goods/unit_list'); ?>">单位管理</a></li>
            </ul>
        </div>
        <div class="content">
            <!--begin breadcrumb-->
            <div class="breadcrumb">
                <ul class="sui-breadcrumb breadcrumb-dark">
                    <li><a href="<?php echo url('index/index'); ?>">首页</a></li>
                    <li><a href="<?php echo url('goods/index'); ?>">商品</a></li>
                    <li class="active">商品推介</li>
                </ul>
            </div>
            <!--end breadcrumb-->
            <div class="sui-div">
                <p>说明：首页商品推介是指定某商品或某类别商品，并在APP首页中以版头banner、推介banner形式呈现的推介方式；</p>
            </div>
            <div class="sui-div xian">
                <div class="pull-left">版头Banner管理</div>
                <div class="pull-right"></div>
            </div>
            <table class="sui-table table-bordered table-hover">
                <thead>
                    <tr>
                        <th width="10%;">编号</th>
                        <th width="20%;">Banner图片（支持PNG/JPG格式）</th>
                        <th width="20%;">标题</th>
                        <th width="20%;">关联商品ID</th>
                        <th width="20%;">关联内容</th>
                        <th class="center">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if(is_array($group1_list) || $group1_list instanceof \think\Collection): $i = 0; $__LIST__ = $group1_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <tr>
                            <td><?php echo $vo['id']; ?></td>
                            <td><img src="<?php echo get_cover($vo['cover'],'default'); ?>" alt="" style="width:50px;height:50px;"></td>
                            <td><?php echo $vo['title']; ?></td>
                            <td><?php echo $vo['goods_id']; ?></td>
                            <td><?php echo $vo['content']; ?></td>
                            <td class="center">
                                <a href="<?php echo url('recommend_edit'); ?>?id=<?php echo $vo['id']; ?>">修改</a>
                                -
                                <a href="javascript:void(0)" onclick="recommend_delete(<?php echo $vo['id']; ?>)">删除</a>
                            </td>
                        </tr>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    <tr>
                        <td colspan="6">
                            <a href="<?php echo url('recommend_add'); ?>" class="sui-btn btn-xlarge btn-primary">添加</a>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="sui-div xian">
                <div class="pull-left">推介Banner管理</div>
                <div class="pull-right"></div>
            </div>
            <table class="sui-table table-bordered table-hover">
                <thead>
                    <tr>
                        <th width="10%;">编号</th>
                        <th width="20%;">Banner图片（支持PNG/JPG格式）</th>
                        <th width="20%;">标题</th>
                        <th width="20%;">关联商品ID</th>
                        <th width="20%;">关联内容</th>
                        <th class="center">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if(is_array($group2_list) || $group2_list instanceof \think\Collection): $i = 0; $__LIST__ = $group2_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <tr>
                        <td><?php echo $vo['id']; ?></td>
                        <td><img src="<?php echo get_cover($vo['cover'],'default'); ?>" alt="" style="width:50px;height:50px;"></td>
                        <td><?php echo $vo['title']; ?></td>
                        <td><?php echo $vo['goods_id']; ?></td>
                        <td><?php echo $vo['content']; ?></td>
                        <td class="center">
                            <a href="<?php echo url('recommend_edit'); ?>?id=<?php echo $vo['id']; ?>">修改</a>
                            -
                            <a href="javascript:void(0)" onclick="recommend_delete(<?php echo $vo['id']; ?>)">删除</a>
                        </td>
                    </tr>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                    <tr>
                        <td colspan="6">
                            <a href="<?php echo url('recommend_add'); ?>" class="sui-btn btn-xlarge btn-primary">添加</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $(".menuitem").removeClass("active");
        $(".menugoods").addClass("active");
    });
    function recommend_delete(id) {
        var url = "<?php echo url('recommend_delete'); ?>";
        //询问框
        layer.confirm('是否删除？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.post(url, {id:id}, function (a) {
                if(a.code == 0){
                    layer.msg(a.msg, {icon: 2})
                }else{
                    handleAjax(a);
                }
            });
        }, function(){
            layer.close();
        });

    }

</script>