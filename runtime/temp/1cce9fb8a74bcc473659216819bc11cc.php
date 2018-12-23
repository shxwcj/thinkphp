<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:94:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\goods\recommend_add.html";i:1484531210;s:86:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\public\head.html";i:1484792114;s:88:"D:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\public\navbar.html";i:1489979851;s:45:"../application/admin/view/public/picture.html";i:1483665779;}*/ ?>
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
                <li><a href="<?php echo url('goods/index'); ?>">商品列表</a></li>
                <li class="active"><a href="<?php echo url('goods/recommend_list'); ?>"><i class="sui-icon icon-tb-right pull-right mt3"></i>商品推介</a></li>
                <li><a href="<?php echo url('goods/cate_list'); ?>">分类管理</a></li>
                <li><a href="<?php echo url('goods/unit_list'); ?>">单位管理</a></li>
            </ul>
        </div>
        <div class="content" v-cloak>
            <!--begin breadcrumb-->
            <div class="breadcrumb">
                <ul class="sui-breadcrumb breadcrumb-dark">
                    <li><a href="<?php echo url('index/index'); ?>">首页</a></li>
                    <li><a href="<?php echo url('goods/index'); ?>">商品</a></li>
                    <li class="active">商品推介</li>
                    <li class="active">添加推介</li>
                </ul>
            </div>
            <!--end breadcrumb-->
            <div class="bs-form">
                <form class="sui-form form-horizontal queryForm ajax-form" action="<?php echo url('cate_add'); ?>" method="post">
                    <div class="control-group">
                        <label  class="control-label">标题：</label>
                        <div class="controls">
                            <input type="text" name="title" v-model="title"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label  class="control-label">关联内容：</label>
                        <div class="controls">
                            <input type="text" name="content" v-model="content"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label  class="control-label">商品ID：</label>
                        <div class="controls">
                            <input type="number" name="goods_id" v-model="goods_id"/>
                        </div>
                    </div>
                    <!--引入图片上传开始-->
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
            <?php if(isset($cover)): ?>
                <div id="WU_FILE_0" class="file-item thumbnail upload-state-done">
                    <img src="<?php echo $cover['url']; ?>" style="height: 100px;"/>
                    <div class="info"><span class="cancel" onclick="removefile()">删除</span></div>
                    <input type="hidden" value="<?php echo $cover['id']; ?>" name="cover">
                </div>
            <?php endif; ?>

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
                                '<div class="info"><span class="cancel" onclick="removefile()">删除</span></div>' +
                                '</div>'
                        ),
                        $img = $li.find('img');

                $list.html($li);

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
                var n = '<input type="hidden" value="'+ response.id +'" name="cover">';
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
        function removefile() {
            var cover = $("#fileList input[name='cover']").val();
            var url = "/admin/uploader/removefile.html";
            //询问框
            layer.confirm('是否删除？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                $.post(url, {cover:cover}, function (a) {
                    //弹出提示消息
                    if (a.status) {
                        layer.msg(a.info, {icon: 1})
                        $("#fileList").html('');
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
                    <!--引入图片上传结束-->
                    <div class="control-group">
                        <label  class="control-label">位置：</label>
                        <div class="controls">
                            <input type="radio"  value="1" name="group_id" v-model="group_id"><span>版头</span>
                            <input type="radio"  value="2" name="group_id" v-model="group_id"><span>推介</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"></label>
                        <div class="controls">
                            <a href="javascript:void(0);" class="sui-btn btn-primary" v-on:click="recommend_add()">提交</a>
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
    var vm = new Vue({
        el: '.content',
        data: {
            id: 0,
            title: '',
            content: '',
            cover: 0,
            goods_id: '',
            group_id: ''
        },
        methods: {
            recommend_add: function () {
                vm.cover = $("input[name='cover']").val();
                if(!vm.goods_id){
                    layer.msg('关联商品id必须填写', {icon: 2});
                    return false;
                }
                if(!vm.cover){
                    layer.msg('必须上传图片', {icon: 2});
                    return false;
                }
                if(!vm.group_id){
                    layer.msg('图片位置必须设置', {icon: 2});
                    return false;
                }
                //提交数据参数
                var parms = {
                    id: vm.id,
                    title: vm.title,
                    content: vm.content,
                    goods_id: vm.goods_id,
                    cover: vm.cover,
                    group_id: vm.group_id
                };
                var url = '<?php echo url('recommend_add'); ?>';
                $.post(url, parms, function (a) {
                    handleAjax(a);
                });
            }
        }
    });
</script>