<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <link rel="shortcut icon" href="favicon.ico">
    <script type="text/javascript" src="STATIC_PATH/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="STATIC_PATH/plugins/layer/layer.js"></script>
    <style>
        * {
            font-family: 'Microsoft Yahei', Tahoma, Arial;
            margin: 0;
            padding: 0;
            outline: 0;
        }
    </style>
</head>
<body>
    <span id="code" style="display: none;"><?php echo($code);?></span>
    <span id="msg" style="display: none;"><?php echo(strip_tags($msg));?></span>
    <a id="href" href="<?php echo($url);?>" style="display: none;"></a>
    <span id="wait" style="display: none;"><?php echo($wait);?></span>
</body>
<script type="text/javascript">
    (function() {
        // 设置layer
        layer.config({
            offset: '30%'
        });

        var code = document.getElementById('code').innerHTML;
        var msg = document.getElementById('msg').innerHTML;
        if (code == 1) {
            layer.msg(msg, {icon: 1});
        } else {
            layer.msg(msg, {icon: 2});
        }
        var wait = document.getElementById('wait').innerHTML;
        var href = document.getElementById('href').href;
        var interval = setInterval(function() {
            var time = --wait;
            if (time <= 0) {
                location.href = href;
                clearInterval(interval);
            }
        }, 1000);
    })();
</script>
</html>
