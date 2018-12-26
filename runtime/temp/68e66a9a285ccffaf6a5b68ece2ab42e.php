<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:91:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\cms\article_edit.html";i:1484531209;s:86:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\public\head.html";i:1484792114;s:88:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\public\navbar.html";i:1489979851;s:44:"../application/admin/view/public/editor.html";i:1482229439;}*/ ?>
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
    <div class="main-t">
        <div class="sidebar">
            <ul class="sui-nav nav-list nav-large">
                <li class="active"><a href="<?php echo url('cms/index'); ?>">列表<i class="sui-icon icon-tb-right pull-right mt3"></i></a></li>
                <li><a href="<?php echo url('cms/cate_list'); ?>">分类</a></li>
            </ul>
        </div>
        <div class="content">
            <!--begin breadcrumb-->
            <div class="breadcrumb">
                <ul class="sui-breadcrumb breadcrumb-dark">
                    <li><a href="<?php echo url('index/index'); ?>">首页</a></li>
                    <li><a href="<?php echo url('cms/index'); ?>">CMS管理</a></li>
                    <li class="active">编辑内容</li>
                </ul>
            </div>
            <!--end breadcrumb-->
            <div class="bs-form">
                <div class="r-title">添加内容</div>
                <form class="sui-form form-horizontal queryForm ajax-form" action="<?php echo url('article_edit'); ?>" method="post">
                    <input type="hidden"  name="id" value="<?php echo $id; ?>"/>
                    <div class="control-group">
                        <label for="cate_name" class="control-label">标题：</label>
                        <div class="controls">
                            <input type="text" id="cate_name" name="title" value="<?php echo $info['title']; ?>" data-rules="required|minlength=2|maxlength=50"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">内容分类：</label>
                        <div class="controls">
                            <span class="sui-dropdown dropdown-bordered select">
                                <span class="dropdown-inner">
                                    <?php if($pid > 0): ?>
                                        <a role="button" data-toggle="dropdown" href="#" class="dropdown-toggle">
                                            <input name="cate_id" value="<?php echo $pid; ?>" type="hidden" data-rules="required">
                                            <i class="caret"></i>
                                            <span><?php echo $pname; ?></span>
                                        </a>
                                    <?php else: ?>
                                        <a role="button" data-toggle="dropdown" href="#" class="dropdown-toggle">
                                            <input name="cate_id" type="hidden" data-rules="required">
                                            <i class="caret"></i>
                                            <span>请选择</span>
                                        </a>
                                    <?php endif; ?>

                                    <ul id="menu4" role="menu" aria-labelledby="drop4" class="sui-dropdown-menu">
                                        <?php if(is_array($plist) || $plist instanceof \think\Collection): $i = 0; $__LIST__ = $plist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                                             <li role="presentation">
                                                <a role="menuitem" tabindex="-1" href="javascript:void(0);" value="<?php echo $vo['id']; ?>"><?php echo $vo['cate_name']; ?></a>
                                             </li>
                                        <?php endforeach; endif; else: echo "" ;endif; ?>
                                    </ul>
                                </span>
                            </span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="sort" class="control-label">排序：</label>
                        <div class="controls">
                            <input type="number" id="sort" name="sort" value="<?php echo $info['sort']; ?>"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="sort" class="control-label">正文内容：</label>
                        <div class="control-group">
<!--    <label for="editor" class="control-label">[label]：</label>-->
    <div class="controls">
        <script id="editor" type="text/plain" name="editor" style="width:600px;height:200px;"><?php if(isset($editor)): ?><?php echo $editor; endif; ?></script>
    </div>
</div>
<script type="text/javascript" src="STATIC_PATH/plugins/editor/ueditor.config.js"></script>
<script type="text/javascript" src="STATIC_PATH/plugins/editor/ueditor.all.min.js"></script>
<script type="text/javascript" src="STATIC_PATH/plugins/editor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，
        // 直接调用UE.getEditor('editor')就能拿到相关的实例
        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
        UE.Editor.prototype.getActionUrl = function(action) {
            if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadimage') {
                return '/admin/uploader/upload';
            } else {
                return this._bkGetActionUrl.call(this, action);
            }
        };
        var ue = UE.getEditor('editor', {
            toolbars: [
                [
                    'source', //源代码
                    'bold', //加粗
                    'indent', //首行缩进
                    'pasteplain', //纯文本粘贴模式
                    'horizontal', //分隔线
                    'removeformat', //清除格式
                    'insertcode', //代码语言
                    'fontfamily', //字体
                    'fontsize', //字号
                    'paragraph', //段落格式
                    'map', //Baidu地图
                    'justifyleft', //居左对齐
                    'justifyright', //居右对齐
                    'justifycenter', //居中对齐
                    'justifyjustify', //两端对齐
                    'forecolor', //字体颜色
                    'lineheight', //行间距
                    'simpleupload' //单图上传
                ]
            ],
            autoHeightEnabled: true,
            autoFloatEnabled: true
        });
    });
    function get_editor_content() {
        var arr = [];
        arr.push(UE.getEditor('editor').getContent());
        return arr.join("\n");
    }
</script>
                    </div>
                    <div class="control-group">
                        <label class="control-label"></label>
                        <div class="controls">
                            <button type="submit" class="sui-btn btn-primary">提交</button>
                            <a href="javascript:void(0);" class="sui-btn" onclick="javascript :history.back(-1);">返回</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $(".menuitem").removeClass("active");
        $(".cms").addClass("active");
    });
</script>