<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:86:"C:\phpStudy\PHPTutorial\WWW\thinkphp\public/../application/admin\view\login\index.html";i:1545551498;}*/ ?>
<html lang="zh-CN" class="is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents no-mobile is-AppPromotionBarVisible cssanimations csstransforms csstransitions flexbox no-touchevents"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <meta name="google-site-verification" content="FTeR0c8arOPKh8c5DYh_9uu98_zJbaWw53J-Sch9MTg">
    <meta name="baidu-site-verification" content="KPFppAFoYF4Kkdv9">
    <meta property="qc:admins" content="00544670776201056375">
    <meta id="znonce" name="znonce" content="50f46aca74b949f28fad78f749819154">
    <!--[if lt IE 9]>
    <script src="https://static.zhihu.com/static/components/respond/dest/respond.min.js"></script>
    <link href="https://static.zhihu.com/static/components/respond/cross-domain/respond-proxy.html" id="respond-proxy" rel="respond-proxy" />
    <link href="/static/components/respond/cross-domain/respond.proxy.gif" id="respond-redirect" rel="respond-redirect" />
    <script src="/static/components/respond/cross-domain/respond.proxy.js"></script>
    <![endif]-->
    <link href="STATIC_PATH/assets/css/login.css" rel="stylesheet">
</head>
<body class="zhi  no-auth">
    <div class="index-main">
        <div class="index-main-body">
            <div class="index-header">
                <h1 class="logo hide-text">logo区域，背景图片显示</h1>
                <h2 class="subtitle">乐文易购管理后台</h2>
            </div>
            <div class="desk-front sign-flow clearfix sign-flow-simple">
                <div class="view view-signin" data-za-module="SMSSignInForm" style="display: block;">
                    <form action="<?php echo url('login/index'); ?>" method="post" novalidate="novalidate">
                        <div class="group-inputs">
                            <div class="account input-wrapper">
                                <input type="text" name="username" aria-label="用户名" placeholder="用户名" required="">
                            </div>
                            <div class="verification input-wrapper">
                                <input type="password" name="password" aria-label="密码" placeholder="密码" required="">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label ">
                                <input type="checkbox" checked="checked" name="remember-me" style="margin-left: 10px;margin-top: 20px;">
                                <span>&nbsp;记住我</span>
                            </label>
                        </div>
                        <div class="button-wrapper command">
                            <button class="sign-button submit" type="submit" id="admin-login">登录</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <a href="http://www.miibeian.gov.cn/" target="_blank">京 ICP 13213125511 号</a>
        <span class="dot">·</span>
        <span>京公网安备 13213125511 号</span>
        <span class="dot">·</span>
        <a href="#" target="_blank">出版物经营许可证</a>
    </div>
    <canvas id="particles" class="particles-js-canvas-el" width="1423" height="241" style="width: 100%; height: 100%;">
    </canvas>
    <script>
        //定义画布宽高和生成点的个数
        var WIDTH = window.innerWidth, HEIGHT = window.innerHeight, POINT = 35;

        var canvas = document.getElementById('particles');
        canvas.width = WIDTH,
            canvas.height = HEIGHT;
        var context = canvas.getContext('2d');
        context.strokeStyle = 'rgba(0,0,0,0.02)',
            context.strokeWidth = 1,
            context.fillStyle = 'rgba(0,0,0,0.05)';
        var circleArr = [];

        //线条：开始xy坐标，结束xy坐标，线条透明度
        function Line (x, y, _x, _y, o) {
            this.beginX = x,
                this.beginY = y,
                this.closeX = _x,
                this.closeY = _y,
                this.o = o;
        }
        //点：圆心xy坐标，半径，每帧移动xy的距离
        function Circle (x, y, r, moveX, moveY) {
            this.x = x,
                this.y = y,
                this.r = r,
                this.moveX = moveX,
                this.moveY = moveY;
        }
        //生成max和min之间的随机数
        function num (max, _min) {
            var min = arguments[1] || 0;
            return Math.floor(Math.random()*(max-min+1)+min);
        }
        // 绘制原点
        function drawCricle (cxt, x, y, r, moveX, moveY) {
            var circle = new Circle(x, y, r, moveX, moveY)
            cxt.beginPath()
            cxt.arc(circle.x, circle.y, circle.r, 0, 2*Math.PI)
            cxt.closePath()
            cxt.fill();
            return circle;
        }
        //绘制线条
        function drawLine (cxt, x, y, _x, _y, o) {
            var line = new Line(x, y, _x, _y, o)
            cxt.beginPath()
            cxt.strokeStyle = 'rgba(0,0,0,'+ o +')'
            cxt.moveTo(line.beginX, line.beginY)
            cxt.lineTo(line.closeX, line.closeY)
            cxt.closePath()
            cxt.stroke();

        }
        //初始化生成原点
        function init () {
            circleArr = [];
            for (var i = 0; i < POINT; i++) {
                circleArr.push(drawCricle(context, num(WIDTH), num(HEIGHT), num(15, 2), num(10, -10)/40, num(10, -10)/40));
            }
            draw();
        }

        //每帧绘制
        function draw () {
            context.clearRect(0,0,canvas.width, canvas.height);
            for (var i = 0; i < POINT; i++) {
                drawCricle(context, circleArr[i].x, circleArr[i].y, circleArr[i].r);
            }
            for (var i = 0; i < POINT; i++) {
                for (var j = 0; j < POINT; j++) {
                    if (i + j < POINT) {
                        var A = Math.abs(circleArr[i+j].x - circleArr[i].x),
                            B = Math.abs(circleArr[i+j].y - circleArr[i].y);
                        var lineLength = Math.sqrt(A*A + B*B);
                        var C = 1/lineLength*7-0.009;
                        var lineOpacity = C > 0.03 ? 0.03 : C;
                        if (lineOpacity > 0) {
                            drawLine(context, circleArr[i].x, circleArr[i].y, circleArr[i+j].x, circleArr[i+j].y, lineOpacity);
                        }
                    }
                }
            }
        }

        //调用执行
        window.onload = function () {
            init();
            setInterval(function () {
                for (var i = 0; i < POINT; i++) {
                    var cir = circleArr[i];
                    cir.x += cir.moveX;
                    cir.y += cir.moveY;
                    if (cir.x > WIDTH) cir.x = 0;
                    else if (cir.x < 0) cir.x = WIDTH;
                    if (cir.y > HEIGHT) cir.y = 0;
                    else if (cir.y < 0) cir.y = HEIGHT;

                }
                draw();
            }, 16);
        }

    </script>
</body>
</html>
<script type="text/javascript" src="STATIC_PATH/plugins/jquery/jquery.min.js"></script>
<script src="STATIC_PATH/assets/js/login.js"></script>
<script>
    $(document).keydown(function(event) {
        if (event.keyCode == 13) {
            $("#admin-login").click();
            return false;
        }
    })
</script>