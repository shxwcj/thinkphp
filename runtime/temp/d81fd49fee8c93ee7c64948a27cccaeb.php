<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:90:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\goods\goods_add.html";i:1489980455;s:86:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\public\head.html";i:1484792114;s:88:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\public\navbar.html";i:1489979851;s:46:"../application/admin/view/public/pictures.html";i:1483665779;s:44:"../application/admin/view/public/editor.html";i:1482229439;}*/ ?>
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
    ul li {
        list-style: none;
    }

    .bs-form {
        top: 0;
        padding-top: 10px;
    }

    .sui-layout .content {
        overflow: hidden;
    }

    .xian {

        overflow: hidden;
        margin-bottom: 10px;
        margin-top: 10px;
    }
    .guige {
        background: #F2F2F2;
        padding-bottom: 10px;
    }

    h2.normal {
        font-size: 14px;
        font-weight: normal;
    }

    .guige ul {
        margin-bottom: 10px;
    }

    .guige ul li {
        float: left;
        margin-left: 20px;
        background: #fff;
    }

    .guige ul li.item {
        width: 80px;
        line-height: 40px;
        height: 40px;
        border: 1px solid #ccc;
        text-align: center;
    }

    .guige ul li.itemMiddle {
        width: 70%;
        min-height: 30px;
        border: 1px solid #ccc;
        text-align: left;
        padding-left: 10px;
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .guige ul li.itemMiddle a {
        margin: 2px 10px;
    }

    .guige ul li.itemMiddle a span {
        float: right;
        margin-left: 10px;
    }

    .guige ul li.delte {
        line-height: 40px;
        height: 40px;
        background: none;
        color: #28a3ef;
    }

    .guige .addItem {
        padding-left: 30px;
    }

    .table-bordered img {
        width: 70px;
        height: 60px;
    }

    .table-bordered tr th, .table-bordered tr td {
        text-align: center;
    }

    .table-bordered .inputWord {
        width: 49%;
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
    }

    .tab-content.tab-wraped {
        border: none;
        padding: 0;
    }

    .inputStyle {
        width: 200px;
        height: 30px;
    }

    .sui-form.form-horizontal .guigeInput {
        width: 70px;
        height: 32px;
        border: none;
        -moz-box-shadow: none;
        -webkit-box-shadow: none;
        -o-box-shadow: none;
        box-shadow: none;
    }

    .sui-form.form-horizontal .shuxing {
        width: 70px;
        margin-top: 2px;
    }

    .sui-div.addCategory {

    }

    .sui-table th, .sui-table td {
        padding: 6px 0px;
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
                <li class="active"><a href="<?php echo url('goods/index'); ?>">商品列表<i class="sui-icon icon-tb-right pull-right mt3"></i></a></li>
                <li><a href="<?php echo url('goods/recommend_list'); ?>">商品推介</a></li>
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
                    <li class="active">添加商品</li>
                </ul>
            </div>
            <!--end breadcrumb-->
            <div class="bs-form" v-cloak>
                <div class="tab-content tab-wraped">
                    <!--基本信息 start-->
                    <form class="sui-form form-horizontal queryForm ajax-form" action="<?php echo url('goods_add'); ?>" method="post">
                        <div class="r-title">基本信息</div>
                        <div class="control-group">
                            <label for="cate_name" class="control-label">商品名称：</label>
                            <div class="controls">
                                <input type="text" id="cate_name" class="inputStyle" v-model="goods_name"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label  class="control-label">商品编号：</label>
                            <div class="controls">
                                {{ sku }}
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="cate_id" class="control-label">商品分类：</label>
                            <div class="controls">
                            <span class="sui-dropdown dropdown-bordered select">
                                <span class="dropdown-inner">
                                    <a role="button" data-toggle="dropdown" href="#" class="dropdown-toggle">
                                        <input id="cate_id" name="cate_id" type="hidden" data-rules="required">
                                        <i class="caret"></i>
                                        <span>请选择</span>
                                    </a>
                                    <ul id="menu4" role="menu" aria-labelledby="drop4" class="sui-dropdown-menu">
                                        <?php if(is_array($plist) || $plist instanceof \think\Collection): $i = 0; $__LIST__ = $plist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                                             <li role="presentation">
                                                <a role="menuitem" tabindex="-1" href="javascript:void(0);"
                                                   value="<?php echo $vo['id']; ?>" v-on:click="settingcate(<?php echo $vo['id']; ?>)"><?php echo $vo['cate_name']; ?></a>
                                             </li>
                                            <?php if(count($vo['children']) > 0): if(is_array($vo['children']) || $vo['children'] instanceof \think\Collection): $i = 0; $__LIST__ = $vo['children'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo2): $mod = ($i % 2 );++$i;?>
                                             <li role="presentation">
                                                <a role="menuitem" tabindex="-1" href="javascript:void(0);"
                                                   value="<?php echo $vo2['id']; ?>" v-on:click="settingcate(<?php echo $vo2['id']; ?>)">&nbsp;&nbsp;&nbsp;&nbsp;|--<?php echo $vo2['cate_name']; ?></a>
                                             </li>
                                             <?php endforeach; endif; else: echo "" ;endif; endif; endforeach; endif; else: echo "" ;endif; ?>
                                    </ul>
                                </span>
                            </span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="unit_id" class="control-label">计量单位：</label>
                            <div class="controls">
                            <span class="sui-dropdown dropdown-bordered select">
                                <span class="dropdown-inner">
                                    <a role="button" data-toggle="dropdown" href="#" class="dropdown-toggle">
                                        <input id="unit_id" name="unit_id" type="hidden" data-rules="required">
                                        <i class="caret"></i>
                                        <span>请选择</span>
                                    </a>
                                    <ul id="menu5" role="menu" aria-labelledby="drop5" class="sui-dropdown-menu">
                                        <?php if(is_array($ulist) || $ulist instanceof \think\Collection): $i = 0; $__LIST__ = $ulist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                                             <li role="presentation">
                                                <a role="menuitem" tabindex="-1" href="javascript:void(0);" value="<?php echo $vo['id']; ?>" v-on:click="settingunit(<?php echo $vo['id']; ?>)"><?php echo $vo['name']; ?></a>
                                             </li>
                                        <?php endforeach; endif; else: echo "" ;endif; ?>
                                    </ul>
                                </span>
                            </span>
                            </div>
                        </div>
                        <div class="r-title">商品标签</div>
                        <div class="control-group">
                            <label for="goods_code" class="control-label">商品标签：</label>
                            <label data-toggle="checkbox" class="checkbox-pretty-new">
                                <input type="checkbox" v-model="is_new" class="ml15"><span class="ml10">新品</span>
                            </label>
                            <label data-toggle="checkbox" class="checkbox-pretty-new">
                                <input type="checkbox" v-model="is_hot" class="ml15"><span class="ml10">热销</span>
                            </label>
                            <label data-toggle="checkbox" class="checkbox-pretty-new">
                                <input type="checkbox" v-model="is_rec" class="ml15"><span class="ml10">推荐</span>
                            </label>
                        </div>
                        <div class="r-title">商品价格</div>
                        价格设置（分销商及代理商将基于“（零售价-成本价）*佣金比例”获取分润佣金）
                        <hr>
                        <div class="sui-div xian" style="width: 60%;">
                            <table class="sui-table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>零售价</th>
                                    <th>成本价</th>
                                    <th>上级分销佣金</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>￥<input type="number" v-model="price"></td>
                                    <td>￥<input type="number" v-model="costprice"></td>
                                    <td><input type="number" v-model="fenxiao_rate">%</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="r-title">商品详情</div>
                        <h2 class="normal">商品图片：</h2>
                        <!-- 引入图片上传文件开始-->
<link href="STATIC_PATH/plugins/webuploader/webuploader.css" rel="stylesheet">
<script type="text/javascript" src="STATIC_PATH/plugins/webuploader/webuploader.js"></script>
<style>
    .webuploader-pick {
        padding: 5px 15px;
    }

    .cancel {
        width: 24px;
        height: 24px;
        display: inline;
        float: right;
        text-indent: -9999px;
        overflow: hidden;
        background: url("STATIC_PATH/assets/images/icons.png") no-repeat -47px 0px;
        margin: 5px 1px 1px;
        cursor: pointer;
    }
</style>
<div class="control-group">
    <label  class="control-label">上传图片：</label>
    <div id="uploader-demo" class="controls">
        <div id="fileList" class="uploader-list">
            <?php if(isset($covers)): if(is_array($covers) || $covers instanceof \think\Collection): $i = 0; $__LIST__ = $covers;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                 <div id="WU_FILE_<?php echo $key; ?>0" class="file-item thumbnail upload-state-done">
                    <img src="<?php echo $vo['url']; ?>" style="width:110px;height: 110px;"/>
                    <div class="info"><span class="cancel" onclick='removefile("WU_FILE_<?php echo $key; ?>0")'>删除</span></div>
                    <input type="hidden" value="<?php echo $vo['cover']; ?>" name="cover[]">
                </div>
            <?php endforeach; endif; else: echo "" ;endif; endif; ?>
        </div>
        <div id="filePicker">点击上传</div>
    </div>
    <script>
        jQuery(function () {
            var $ = jQuery,
                    $list = $('#fileList'),
                    // 优化retina, 在retina下这个值是2
                    ratio = window.devicePixelRatio || 1,

                    // 缩略图大小
                    thumbnailWidth = 100 * ratio,
                    thumbnailHeight = 100 * ratio,

                    // Web Uploader实例
                    uploader;

            // 初始化Web Uploader
            uploader = WebUploader.create({

                // 自动上传。
                auto: true,

                // swf文件路径
                swf: './public/static/plugins/webuploader/Uploader.swf',

                // 文件接收服务端。
                server: '/admin/uploader/upload',

                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: '#filePicker',
                duplicate :true,
                accept: {
                    title: 'Images',
                    extensions: 'jpg,jpeg,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/png'   //修改这行
                }
            });

            // 当有文件添加进来的时候
            uploader.on('fileQueued', function (file) {
                var $li = $(
                                '<div id="' + file.id + '" class="file-item thumbnail">' +
                                '<img>' +
                                '<div class="info" ><span class="cancel" onclick="removefile(\'' +file.id+ '\')">删除</span></div>' +
                                '</div>'
                        ),
                        $img = $li.find('img');
                console.log($li);
                $list.append($li);

                // 创建缩略图
                uploader.makeThumb(file, function (error, src) {
                    if (error) {
                        $img.replaceWith('<span>不能预览</span>');
                        return;
                    }
                    $img.attr('src', src);
                }, thumbnailWidth, thumbnailHeight);
            });

            // 文件上传过程中创建进度条实时显示。
            uploader.on('uploadProgress', function (file, percentage) {
                var $li = $('#' + file.id), $percent = $li.find('.progress span');

                // 避免重复创建
                if (!$percent.length) {
                    $percent = $('<p class="progress"><span></span></p>').appendTo($li).find('span');
                }
                $percent.css('width', percentage * 100 + '%');
            });

            // 文件上传成功，给item添加成功class, 用样式标记上传成功。
            uploader.on('uploadSuccess', function (file,response) {
                $('#' + file.id).addClass('upload-state-done');
                var n = '<input type="hidden" value="'+ response.id +'" name="cover[]">';
                $('#' + file.id).append(n);

            });

            // 文件上传失败，现实上传出错。
            uploader.on('uploadError', function (file) {
                var $li = $('#' + file.id),
                        $error = $li.find('div.error');

                // 避免重复创建
                if (!$error.length) {
                    $error = $('<div class="error"></div>').appendTo($li);
                }

                $error.text('上传失败');
            });

            // 完成上传完了，成功或者失败，先删除进度条。
            uploader.on('uploadComplete', function (file) {
                $('#' + file.id).find('.progress').remove();
            });
        });
        function removefile(id) {
            var cover = $('#'+id+'').find('input').val();
            var url = "/admin/uploader/removefile.html";
            //询问框
            layer.confirm('是否删除？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                $.post(url, {cover:cover}, function (a) {
                    //弹出提示消息
                    if (a.status) {
                        layer.msg(a.info, {icon: 1})
                        $('#'+id+'').remove();
                    } else {
                        layer.msg(a.info, {icon: 2})
                    }
                });
            }, function(){
                layer.close();
            });
        };
    </script>
</div>
<!-- 引入图片上传文件结束-->

                        商品说明<br/><br/>
                        <div class="control-group">
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
                        <!--基本信息 end-->



                        <!--商品多规格start-->
                        <div class="r-title">商品多规格</div>
                        <div class="sui-div" style="height: 30px;line-height: 30px;">
                            <label class="checkbox-pretty inline">
                                本商品包含多种规格
                            </label>
                        </div>
                        <div class="sui-div guige xian">
                            <h2 class="normal">设定规格及规格值：（最多添加三类规格，每个规格可定义最多20个规格值）</h2>
                            <ul class="xian" v-for="(keys,vo) in lists">
                                <li class="item"><input type="text" placeholder="规格名称" class="guigeInput" v-model="vo.name"></li>

                                <li class="itemMiddle" >
                                    <a href="javascript:void(0);" class="sui-btn  btn-primary" v-for="voson in vo.vals">{{ voson}} <span v-on:click="removevals(keys,$index)">X</span></a>
                                    <input type="text" class="shuxing" placeholder="规格属性值" v-model="vo.temp_name" v-on:keyup.enter="addvals($index)">
                                </li>

                                <li class="delte"><a href="javascript:void(0);" v-on:click="removelist($index)">删除</a></li>
                            </ul>

                            <div class="sui-row addItem">
                                <a href="javascript:void(0);" class="sui-btn btn-xlarge btn-primary" v-on:click="addlist" >+添加新规格</a>
                            </div>
                        </div>
                        <!--商品多规格end-->


                        <!--添加商品多规格商品start-->
                        <div class="sui-div addCategory" style="width: 80%;">
                            <h2 class="normal">添加各规格商品：</h2>
                            <table class="sui-table table-bordered order-table table-hover">
                                <thead>
                                <tr>
                                    <th width="10%">商品编码</th>
                                    <th width="10%" v-for="vo in lists">{{ vo.name }}</th>
                                    <th width="10%">零售价(￥)</th>
                                    <th width="10%">成本价(￥)</th>
                                    <th width="10%">上级分销佣金</th>

                                    <th width="10%">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                    <tr v-for="(k1,goods) in goods_lists">
                                        <td>{{ goods.sku }}</td>
                                        <td v-for="(k2,vo) in lists">
                                            <span class="sui-dropdown dropdown-bordered select">
                                                <span class="dropdown-inner">
                                                    <a role="button" data-toggle="dropdown" href="#" class="dropdown-toggle"><i class="caret"></i><span>请选择</span></a>
                                                    <ul  role="menu" aria-labelledby="drop4" class="sui-dropdown-menu">
                                                         <li role="presentation" v-for="voson in vo.vals">
                                                            <a role="menuitem" tabindex="-1" href="javascript:void(0);" v-text="voson" v-on:click="setting_goodslists_vals(k1,k2,voson)">{{ voson }}</a>
                                                         </li>
                                                    </ul>
                                                </span>
                                            </span>
                                        </td>
                                        <td><input type="number" v-model="goods.price" class="inputWord"></td>
                                        <td><input type="number" v-model="goods.costprice" class="inputWord"></td>
                                        <td><input type="number" v-model="goods.fenxiao_rate" class="inputWord">%</td>

                                        <td><a href="javascript:void(0);" v-on:click="removegoodslists($index)">删除</a></td>
                                    </tr>


                                    <tr>
                                        <td colspan="7" align="center">
                                            <div style="width: 100%;text-align: center;">
                                                <a href="javascript:void(0);" class="sui-btn btn-xlarge btn-primary" v-on:click="addgoodslists();">+添加规格商品</a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--添加商品多规格商品end-->
                        <div class="control-group">
                            <label class="control-label"></label>
                            <div class="control-group">
                                <label class="control-label"></label>
                                <div class="controls">
                                    <a href="javascript:void(0);" class="sui-btn btn-primary" onclick='goods_add("<?php echo url('goods/goods_add'); ?>")'>提交</a>
                                    <a href="javascript:void(0);" class="sui-btn" onclick="javascript :history.back(-1);">返回</a>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!--添加商品规格 end-->
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript" src="STATIC_PATH/assets/js/goods.js"></script>