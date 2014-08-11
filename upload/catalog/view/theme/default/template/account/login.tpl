<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>一加账户登录</title>
    <link rel="shortcut icon" href="http://statics.oneplus.cn/img/oneplus.ico" type="image/x-icon">
    <link rel="stylesheet" href="http://statics.oneplus.cn/css/init.css" media="screen">
    <link rel="stylesheet" href="http://statics.oneplus.cn/css/common.css" media="screen">
    <link rel="stylesheet" href="http://statics.oneplus.cn/css/account.css" media="screen">
    <script src="http://statics.oneplus.cn/js/lib/jquery-1.9.1.js"></script>
    <script src="http://statics.oneplus.cn/js/lib/respond.min.js"></script>
    <script src="http://statics.oneplus.cn/js/lib/OPTools.js"></script>
    <script src="http://statics.oneplus.cn/js/passport/FormVal.js"></script>
    <script src="http://statics.oneplus.cn/js/passport/account.js"></script>
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
        <strong class="o-ta-r">欢迎登录</strong>
    </h1>
</header>
    <section class="main">
    <div class="main main-login">
        <form class="form-login">
            <ul class="o-mt-150 o-mb-150">
                <li><label><em>＊</em>用户名：</label><input name="account"  type="text" value="" placeholder="邮箱" id="userAccount"></li>
                <li><label><em>＊</em>密　码：</label><input name="password" type="password" value="" placeholder="密码" id="password"></li>
                <li id="verifyLi" class=""><label><em>＊</em>验证码：</label><input name="imgValidCode" type="text" value="" placeholder="验证码" id="imgValidCode"><img src="/regist/verify" alt="验证码" class="o-ml-10 captcha" id="imgCode"></li>
                <li class="tips"><label class="o-ti-999">　提　示：</label><span class="validate_tip">&nbsp;</span></li>
                <li class="rememberme"><a href="/login/forget" class="o-ml-30">[忘记密码]</a></li>
                <li class="btns"><label class="o-ti-999">buttons</label><a href="javascript:;" class="btn btn-shop-red btn-shop-m" id="btn-login">登录</a><a href="/regist/index" class="btn btn-shop-gray btn-shop-m o-ml-10">注册</a></li>
            </ul>
        </form>
    </div>
</section>

<script>
    function showErrorTipOne(f,elem,msg,tipclass){
        var elm = $("#"+elem),tip = elm.parent().parent().find("." + (tipclass ? tipclass : "validate_tip"));
        if(!f){
            if(tip.length>0){
                if(!tip.hasClass("error"))
                    tip.addClass("error");
                tip.html(msg).show();
            }else{
                elm.parent().append("<em class='"+tipclass+" error'>"+msg+"</em>");
                if(!tip.hasClass("error"))
                    tip.addClass("error");
                tip = elm.parent().find("."+tipclass);
                tip.html(msg).show();
            }
        }else{
            tip.removeClass("error").html("&nbsp;");
        }
    }

    $(function(){
        //点击时更换图形验证码
        $("#imgCode").on("click",function(){
            this.src = "/regist/verify"+"/v/"+Math.random();
        });

        //记住密码
        $('#rememberme,label[for="rememberme"]').on('click',function(){
            $('#rememberme').toggleClass('input-checkbox-checked');
        });

        
        $('#btn-login').on("click",function(){
            var __self = $(this),
            loginUrl  = "/login/ajaxlogin",
            verifyUrl = "/regist/ajaxverify",
            account   = $('#userAccount').val(),
            password  = $('#password').val(),
            code      = $('#imgValidCode').val(),
            remember  = /checked/.test($('#rememberme').attr('class')) ? 1 : 0;
            
            if(account.replace(/(^\s*)|(\s*$)/g,"")==""){
              return false;
            }
            
            if(password.replace(/(^\s*)|(\s*$)/g,"")==""){
              return false;
            }

            if(!code){
              showErrorTipOne(false, "imgValidCode", "请输入验证码");
              return false;
            }

            $.ajax({
                type: "post",
                dataType: "json",
                url: verifyUrl,
                data: {'code':code},
                async:  false,
                timeout: 30000,
                success: function (d) {
                    if(d.ret == '1'){

                        //验证码验证成功则进行登陆
                      __self.text('登录中...');
                        $.post(loginUrl, {'account':account, 'password':password, 'remember':remember, 'verify':code}, function(data){
                            if(data.ret == 1){
                                showErrorTipOne(true,"userAccount","","validate_tip");
                                window.location = data.loginUrl;
                            }else{
                              $('#imgCode').attr('src',"/regist/verify"+"/v/"+Math.random());
                                showErrorTipOne(false,"userAccount",data.errMsg,"validate_tip");
                                __self.text("登录");
                            }
                        }, 'json')
                        .fail(function(){
                            showErrorTipOne(false,"userAccount","登录失败","validate_tip");
                            __self.val("登录");
                        });
                    }else{
                       __self.text("登录");
                      $('#imgCode').attr('src',"/regist/verify"+"/v/"+Math.random());
                      showErrorTipOne(false, "imgValidCode", "验证码输入错误");
                      return false;
                    }
                },
                error: function () {
                    showErrorTipOne(false, "imgValidCode", "连接服务器出错");
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