<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:93:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\system\admin_group.html";i:1489983998;s:86:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\public\head.html";i:1484792114;s:88:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\public\navbar.html";i:1489979851;}*/ ?>
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
    <div class="main-t" id="app" v-cloak>
        <div class="sidebar">
            <ul class="sui-nav nav-list nav-large">
                <li><a href="<?php echo url('system/admin_user'); ?>">管理员管理</a></li>
                <li class="active"><a href="<?php echo url('system/admin_group'); ?>">权限组管理<i class="sui-icon icon-tb-right pull-right mt3"></i></a></li>
                <li><a href="<?php echo url('system/sharefee'); ?>">佣金设置</a></li>
            </ul>
        </div>
        <div class="content">
            <!--begin breadcrumb-->
            <div class="breadcrumb">
                <ul class="sui-breadcrumb breadcrumb-dark">
                    <li><a href="<?php echo url('index/index'); ?>">首页</a></li>
                    <li><a href="<?php echo url('system/index'); ?>">设置</a></li>
                    <li class="active">权限组管理</li>
                </ul>
            </div>
            <!--end breadcrumb-->
            <form class="queryForm sui-form form-horizontal" action="<?php echo url('admin_group'); ?>" method="post">
                <input type="hidden" id="page" name="page" value="<?php echo $currentPage; ?>">
                <input type="text" name="queryText" class="input-medium input-large" placeholder="ID/名称" value="<?php echo $queryText; ?>">
                <a class="queryBtn sui-btn btn-primary ml15" v-on:click="search()">筛选</a>
                <div class=" pull-right"><a href="<?php echo url('admin_group_add'); ?>" class="sui-btn btn-success">添加用户组</a></div>
            </form>

            <table class="sui-table table-bordered table-hover" id="list-content">
                <thead>
                <tr>
                    <th width="2%"><input type="checkbox" name="checkall" class="checkall"></th>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>状态</th>
                    <th width="20%" class="center">操作</th>
                </tr>
                </thead>
                <tbody>
                <?php if(is_array($list) || $list instanceof \think\Collection): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <tr>
                    <td>
                        <input type="checkbox" name="checkbox" value="<?php echo $vo['id']; ?>">
                        <input type="hidden" name="id">
                    </td>
                    <td><?php echo $vo['id']; ?></td>
                    <td><?php echo $vo['title']; ?></td>
                    <td>
                        <?php if($vo['status'] == 1): ?>
                        <a href="javascript:void(0);" class="sui-btn btn-small btn-primary">启用</a>
                        <?php else: ?>
                        <a href="javascript:void(0);" class="sui-btn btn-small">禁用</a>
                        <?php endif; ?>
                    </td>
                    <td class="center">
                        <a href="<?php echo url('admin_group_edit'); ?>?id=<?php echo $vo['id']; ?>">修改</a>
                        -
                        <a href="javascript:void(0)" onclick="admin_group_delete(<?php echo $vo['id']; ?>)">删除</a>
                    </td>
                </tr>
                <?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
            <div class="span4 pull-left">
                <a href="javascript: void(0);" class="btn-link" onclick="admin_group_setstatus(1)">批量启用</a>-
                <a href="javascript: void(0);" class="btn-link" onclick="admin_group_setstatus(0)">批量禁用</a>
            </div>
            <!-- 分页 -->
            <div class="sui-pagination pagination-small pull-right"></div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    var vm = new Vue({
        el: '#app',
        data: {
            queryText: "<?php echo $queryText; ?>",
        },
        methods: {
            search: function() {
                $("#page").val(0);
                $("form").submit();
            }
        }
    });
    $(document).ready(function () {
        $(".menuitem").removeClass("active");
        $(".settings").addClass("active");

        //分页
        $('.sui-pagination').pagination({
            pages: <?php echo $lastpage; ?>,
            styleClass: ['pagination-small'],
            showCtrl: true,
            remote: true,
            currentPage: <?php echo $currentPage; ?>,
            displayPage: 10,
            onSelect: function (num) {
                $("#page").val(num);
                $("form").submit();
            }
        });
        $(".checkall").change(function () {
            if ($(this).prop("checked")) {
                $("tbody input[type=checkbox]").prop("checked", true);
            } else {
                $("tbody input[type=checkbox]").prop("checked", false);
            }
        });
    });
    function admin_group_setstatus(status) {
        var ids = Array();
        $('input[name="checkbox"]:checked').each(function(){
            ids.push($(this).val());
        });
        var url = "<?php echo url('admin_group_setstatus'); ?>";
        //询问框
        layer.confirm('是否操作？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.post(url, {ids:ids,status:status}, function (a) {
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
    function admin_group_delete(id) {
        var url = "<?php echo url('admin_group_delete'); ?>";
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