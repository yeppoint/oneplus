<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>账户注册</title>
    <link rel="shortcut icon" href="<?php if($icon)echo $icon;?>" type="image/x-icon">
    <link rel="stylesheet" href="catalog/view/css/init.css" media="screen">
    <link rel="stylesheet" href="catalog/view/css/common.css" media="screen">
    <link rel="stylesheet" href="catalog/view/css/account.css" media="screen">
    <script src="catalog/view/javascript/jquery/jquery-1.9.1.js"></script>
    <script src="catalog/view/javascript/respond.min.js"></script>
    <!--[if lt IE 9]>
    <script src="http://statics.oneplus.cn/js/lib/html5.js"></script>
    <![endif]-->
</head>
<body class="o-ta-l">
<header>
    <h1>
        <a href="index.php"><img src="<?php if(isset($logo)&&$logo)echo $logo; ?>"  class="o-f-l"></a>
        <nav class="o-ta-r nav-t">
                </nav>
        <strong class="o-ta-r"><?php echo $text_email_register;?></strong>
    </h1>
</header>
    <section class="main">
   <div class="main">
        <form method="post" class="form-reg" id="regform">
          <!-- 只有邮箱注册 -->
            <ul class="regtype o-clearfix o-mt-40 o-c-6" style="visibility: hidden;">
                <li><span class="input-radio" id="tab-phone"></span><label for="tab-phone"></label></li>
                <li><span class="input-radio input-radio-checked" id="tab-email"></span><label for="tab-email"></label></li>
            </ul>
            <ul class="regform o-mt-20 o-mb-100">
                <li> <p ><em class="validate_tip " data-flag="incorrect" style="display: inline-block;"></em></p></li>
                <li class="with-email" style="display: list-item;"><label><em>＊</em><?php echo $entry_email; ?></label><input name="email" type="text" value="" placeholder="" id="email" rules="email"></li>
                <li><label><em>＊</em><?php echo $entry_password; ?></label><input name="password" type="password" value="" placeholder="<?php echo $entry_password_notic; ?>" id="password" refid="password2" rules="password"></li>
                <li><label><em>＊</em><?php echo $entry_confirm; ?></label><input name="password2" type="password" value="" placeholder="<?php echo $entry_password_notic; ?>" id="password2" refid="password" rules="password2"></li>
                <li class="with-email" style="display: list-item;"><label><em>＊</em><?php echo $entry_captcha; ?></label><input name="imgValidCode" type="text" value="" placeholder="" id="imgValidCode"><img src="index.php?route=tool/captcha" alt="验证码" title="点击更换验证码" class="o-ml-10 captcha" id="imgCode"></li>
                <li class="btns o-mt-25"><label class="o-ti-999">buttons</label><a href="javascript:;" class="btn btn-shop-red btn-shop-m" id="btn-submit"><?php echo $text_register; ?></a><a href="index.php?route=account/login" class="btn btn-shop-gray btn-shop-m o-ml-10" ><?php echo $text_login; ?></a><input type="hidden" name="reg_type" id="reg_type" value="2"></li>
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