<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>账户注册</title>
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
        <strong class="o-ta-r">邮箱注册</strong>
    </h1>
</header>
    <section class="main">
   <div class="main">
        <form method="post" class="form-reg" id="regform">
          <!-- 只有邮箱注册 -->
            <ul class="regtype o-clearfix o-mt-40 o-c-6" style="visibility: hidden;">
                <li><span class="input-radio" id="tab-phone"></span><label for="tab-phone">填写手机号码</label></li>
                <li><span class="input-radio input-radio-checked" id="tab-email"></span><label for="tab-email">填写电子邮箱</label></li>
            </ul>
            <ul class="regform o-mt-20 o-mb-100">
                <li> <p ><em class="validate_tip " data-flag="incorrect" style="display: inline-block;"><?php if(isset($error)){echo $error;} ?></em></p></li>
                <li class="with-phone" style="display: none;"><label><em>＊</em>手　机　号：</label><input name="mobilePhone" type="text" value="" placeholder="手机号码" id="mobilePhone" rules="mobilePhone"></li>
                <li class="with-phone" id="needimgvalid" style="display: none;"><label><em>＊</em>短信验证码：</label><input name="validCode" type="text" value="" placeholder="短信验证码" id="validCode" rules="validCode"><input type="button" value="获取验证码" class="btn btn-shop-gray btn-shop-s o-ml-10" disabled="disabled" id="btn-getvericode"></li>
                <li class="with-email" style="display: list-item;"><label><em>＊</em>电 子 邮 件：</label><input name="email" type="text" value="" placeholder="邮箱地址" id="email" rules="email"></li>
                <li><label><em>＊</em>密 码 设 置：</label><input name="password" type="password" value="" placeholder="密码6~16位，数字/字母" id="password" refid="password2" rules="password"></li>
                <li><label><em>＊</em>密 码 确 认：</label><input name="password2" type="password" value="" placeholder="密码6~16位，数字/字母" id="password2" refid="password" rules="password2"></li>
                <li class="with-email" style="display: list-item;"><label><em>＊</em>验　证　码：</label><input name="imgValidCode" type="text" value="" placeholder="请输入验证码" id="imgValidCode"><img src="index.php?route=tool/captcha" alt="验证码" title="点击更换验证码" class="o-ml-10 captcha" id="imgCode"></li>
                <li class="btns o-mt-25"><label class="o-ti-999">buttons</label><a href="javascript:;" class="btn btn-shop-red btn-shop-m" id="btn-submit">免费注册</a><a href="index.php?route=account/login" class="btn btn-shop-gray btn-shop-m o-ml-10" >登录</a><input type="hidden" name="reg_type" id="reg_type" value="2"></li>
                <li class="tips o-c-6 o-fs-12 o-mt-40">点击“免费注册”，即表示您愿意遵守<a href="/regist/accord" target="_blank">用户协议</a></li>
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

    //submit提交
    $("#btn-submit").on("click",function () {
        $.post('index.php?route=account/register',{
                email :  $("#email").val(),
                password: $("#password").val(),
                password2: $("#password2").val(),
                captcha:$("#imgValidCode").val()
            }
            ,function(json){
                if(json.error){
                    $(".validate_tip").text(json.error);
                }else{
                    location = json.redirect;
                }
            });
       
    });
    //回车提交
    $(document).keydown(function(event){
        if(event.keyCode == 13){
            $('#btn-submit').trigger('click');
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