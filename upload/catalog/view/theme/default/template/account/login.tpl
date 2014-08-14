<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>账户登录</title>
    <link rel="shortcut icon" href="http://statics.oneplus.cn/img/oneplus.ico" type="image/x-icon">
    <link rel="stylesheet" href="http://statics.oneplus.cn/css/init.css" media="screen">
    <link rel="stylesheet" href="http://statics.oneplus.cn/css/common.css" media="screen">
    <link rel="stylesheet" href="http://statics.oneplus.cn/css/account.css" media="screen">
    <script src="http://statics.oneplus.cn/js/lib/jquery-1.9.1.js"></script>
    <script src="http://statics.oneplus.cn/js/lib/respond.min.js"></script>
    <!--[if lt IE 9]>
    <script src="http://statics.oneplus.cn/js/lib/html5.js"></script>
    <![endif]-->

</head>
<body class="o-ta-l">
<header>
    <h1>
        <a href="http://www.oneplus.cn/index.php/"><img src="http://statics.oneplus.cn/img/logo-oneplus.png" alt="一加手机官网" title="一加手机官网" class="o-f-l"></a>
        <nav class="o-ta-r nav-t">
                </nav>
        <strong class="o-ta-r"><?php echo $text_welcome; ?></strong>
    </h1>
</header>
    <section class="main">
    <div class="main main-login">
        <form class="form-login">
            <ul class="o-mt-150 o-mb-150">
                <li><label><?php echo $text_username; ?>：</label><input name="account"  type="text" value="" placeholder="<?php echo $text_email; ?>" id="userAccount"></li>
                <li><label><?php echo $text_password; ?>：</label><input name="password" type="password" value="" placeholder="<?php echo $text_password; ?>" id="password"></li>
                <li id="verifyLi" class=""><label><?php echo $text_captcha; ?>：</label><input name="imgValidCode" type="text" value="" placeholder="<?php echo $text_captcha; ?>" id="imgValidCode"><img src="index.php?route=tool/captcha" alt="验证码" class="o-ml-10 captcha" id="imgCode"></li>
                <li class="tips"><label class="o-ti-999">　提　示：</label><span class="validate_tip">&nbsp;</span></li>
                <li style="visibility:hidden" class="rememberme"><a href="#" class="o-ml-30">[忘记密码]</a></li>
                <li class="btns"><label class="o-ti-999">buttons</label><a href="javascript:;" class="btn btn-shop-red btn-shop-m" id="btn-login"><?php echo $text_login; ?></a><a href="index.php?route=account/register" class="btn btn-shop-gray btn-shop-m o-ml-10"><?php echo $text_register; ?></a></li>
            </ul>
        </form>
    </div>
</section>

<script>
     
    $(function(){
        //点击时更换图形验证码
        $("#imgCode").on("click",function(){
            this.src = "index.php?route=tool/captcha#"+Math.random();
        });

        $('#btn-login').click(function(event) {
             $.post('index.php?route=account/login',{
                email:$('#userAccount').val(),
                password:$('#password').val(),
                captcha:$('#imgValidCode').val()
             },function(json){
                if(json.warning){
                     $(".validate_tip").text(json.warning);
                }else{
                    location = json.redirect;
                }
             });
        });
        
        //回车登录
        $(document).keydown(function(event){
            if(event.keyCode == 13){
                $('#btn-login').trigger('click');
            }
        });
    });
</script>
<footer>
    <address>
        <p class="o-ta-c">ICP &copy; 2014 深圳市创尔科科技有限公司 版权所有</p>
    </address>
</footer>

 
</body>
</html>