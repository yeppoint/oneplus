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
        <strong class="o-ta-r">手机注册</strong>
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
                <li class="with-phone" style="display: none;"><label><em>＊</em>手　机　号：</label><input name="mobilePhone" type="text" value="" placeholder="手机号码" id="mobilePhone" rules="mobilePhone"></li>
                <li class="with-phone" style="display: none;"><label><em>＊</em>验　证　码：</label><input name="imgValidCodePhone" type="text" value="" placeholder="图片验证码" id="imgValidCodePhone"><img src="/regist/verify/v/0.8024761267006397" alt="验证码" title="点击更换验证码" class="o-ml-10 captcha" id="imgCodePhone"></li>
                <li class="with-phone" id="needimgvalid" style="display: none;"><label><em>＊</em>短信验证码：</label><input name="validCode" type="text" value="" placeholder="短信验证码" id="validCode" rules="validCode"><input type="button" value="获取验证码" class="btn btn-shop-gray btn-shop-s o-ml-10" disabled="disabled" id="btn-getvericode"></li>
                <li class="with-email" style="display: list-item;"><label><em>＊</em>电 子 邮 件：</label><input name="email" type="text" value="" placeholder="邮箱地址" id="email" rules="email"></li>
                <li><label><em>＊</em>密 码 设 置：</label><input name="password" type="password" value="" placeholder="密码6~16位，数字/字母/字符至少两种" id="password" refid="password2" rules="password"></li>
                <li><label><em>＊</em>密 码 确 认：</label><input name="password2" type="password" value="" placeholder="密码6~16位，数字/字母/字符至少两种" id="password2" refid="password" rules="password2"></li>
                <li class="with-email" style="display: list-item;"><label><em>＊</em>验　证　码：</label><input name="imgValidCode" type="text" value="" placeholder="请输入验证码" id="imgValidCode"><img src="/regist/verify/v/0.014865639852359891" alt="验证码" title="点击更换验证码" class="o-ml-10 captcha" id="imgCode"></li>
                <li class="btns o-mt-25"><label class="o-ti-999">buttons</label><a href="javascript:;" class="btn btn-shop-red btn-shop-m" id="btn-submit">免费注册</a><a href="/login/index" class="btn btn-shop-gray btn-shop-m o-ml-10" target="_blank">登录</a><input type="hidden" name="reg_type" id="reg_type" value="2"></li>
                <li class="tips o-c-6 o-fs-12 o-mt-40">点击“免费注册”，即表示您愿意遵守一加<a href="/regist/accord" target="_blank">用户协议</a></li>
            </ul>
        </form>
    </div>
</section>

<script>
$(function(){
    var mobileOld,validCodeOld,emailOld,imgValidCodeOld,imgValidCodePhoneOld,
        mobileState = false,
        validCodeState = false,
        emailState = false,
        imgValidCodeState = false,
        imgValidCodePhoneState = false,
        validator = new FormValidate();
    var _this = this, param = {};
    /**
     * ajax检查手机唯一性
     * @param {def} 表示同步或异步请求，true值时表示同步
     */
    function ajaxCheckMobile(obj, def) {
        var async = true;
        async = !def || false;
        //格式有误 => 返回
        if ($("#mobilePhone").parent().find("[data-flag='incorrect']").length > 0 || $("#mobilePhone").val() === "") {
            return;
        }
        //值跟上次一样 => 也返回
        if (mobileOld === $("#mobilePhone").val()) {
            if (!mobileState) {
                //验证失败
                validator.showErrorTip(false, "mobilePhone", $('#mobilePhone').data('error'));
            }
            return;
        }
        //记录这次的值
        mobileOld = $("#mobilePhone").val();
        validator.showErrorTip(false, "mobilePhone", "检验中……");
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/regist/ajaxuniqephone",
            data: "phone=" + $("#mobilePhone").val(),
            async: async,
            timeout: 30000,
            success: function (d) {
                if (d.ret == '1') {
                    validator.showErrorTip(true, "mobilePhone", d.errMsg);
                    //记录状态
                    mobileState = true;
                } else {
                    validator.showErrorTip(false, "mobilePhone", d.errMsg);
                    //记录状态
                    mobileState = false;
                    $("#mobilePhone").data('error', d.errMsg);
                }
            },
            error: function () {
                validator.showErrorTip(true, "mobilePhone", "验证手机失败");
                //记录状态
                mobileState = false;
            }
        });
    }

    /**
     * ajax检查验证码正确性
     * @param {def} 表示同步或异步请求，true值时表示同步
     */
    function ajaxCheckValidCode(obj, def) {
        var async = true;
        async = !def || false;
        //格式有误 => 返回
        if ($("#validCode").parent().find("[data-flag='incorrect']").length > 0 || $("#validCode").val() === "") {
            return;
        }
        //值跟上次一样 => 也返回
        if (validCodeOld === $("#validCode").val()) {
            if (!validCodeState) {
                //验证失败
                validator.showErrorTip(false, "validCode", $('#validCode').data('error'));
            }
            return;
        }
        //记录这次的值
        validCodeOld = $("#validCode").val();
        validator.showErrorTip(false, "validCode", "检验中……");
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/phone/ajaxverifyregist",
            data: {phone:$("#mobilePhone").val(),verify:$("#validCode").val()},
            async: async,
            timeout: 30000,
            success: function (d) {
                if(d.ret == '1'){
                    validator.showErrorTip(true, "validCode", "验证通过");
                    //记录状态
                    validCodeState = true;
                } else {
                    validator.showErrorTip(false, "validCode", d.errMsg);
                    //记录状态
                    validCodeState = false;
                    $("#validCode").data('error', d.errMsg);
                }
            },
            error: function () {
                validator.showErrorTip(false, "validCode", "验证码校验失败");
                //记录状态
                validCodeState = false;
            }
        });
    }

    /**
     * ajax检查邮箱唯一性
     * @param {def} 表示同步或异步请求，true值时表示同步
     */
    function ajaxCheckEmail(obj, def) {
        var async = true;
        async = !def || false;
        //格式有误 => 返回
        if ($("#email").parent().find("[data-flag='incorrect']").length > 0 || $("#email").val() === "") {
            return;
        }
        //值跟上次一样 => 也返回
        if (emailOld === $("#email").val()) {
            if (!emailState) {
                //验证失败
                validator.showErrorTip(false, "email", $('#email').data('error'));
            }
            return;
        }
        //记录这次的值
        emailOld = $("#email").val();
        validator.showErrorTip(false,"email", "检验中……");
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/regist/ajaxuniqeemail",
            data: "email=" + $("#email").val(),
            async:  async,
            timeout: 30000,
            success: function (d) {
                if(d.ret == '1'){
                    validator.showErrorTip(true, "email", d.errMsg);
                    //记录状态
                    emailState = true;
                }else{
                    validator.showErrorTip(false, "email", d.errMsg);
                    //记录状态
                    emailState = false;
                    $("#email").data('error', d.errMsg);
                }
            },
            error: function () {
                validator.showErrorTip(false, "email", "验证邮箱失败");
                //记录状态
                emailState = false;
            }
        });
    }

    /**
     * ajax检查图形验证码是否输入正确
     * @param {def} 表示同步或异步请求，true值时表示同步
     */
    function ajaxImgValid(obj,def){
        var async = true;
        async = !def || false;
        //格式有误 => 返回
        if ($("#imgValidCode").parent().find("[data-flag='incorrect']").length > 0 || $("#imgValidCode").val() === "") {
            return;
        }
        //值跟上次一样 => 也返回
        if (imgValidCodeOld === $("#imgValidCode").val()) {
            if (!imgValidCodeState) {
                //验证失败
                validator.showErrorTip(false, "imgValidCode", $('#imgValidCode').data('error'));
            }
            return;
        }
        //记录这次的值
        imgValidCodeOld = $("#imgValidCode").val();
        validator.showErrorTip(false,"imgValidCode", "检验中……");
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/regist/ajaxverify",
            data: "code=" + $("#imgValidCode").val(),
            async:  false,
            timeout: 30000,
            success: function (d) {
                if(d.ret == '1'){
                    validator.showErrorTip(true, "imgValidCode", d.errMsg);
                    //记录状态
                    imgValidCodeState = true;
                }else{
                    validator.showErrorTip(false, "imgValidCode", d.errMsg);
                    //记录状态
                    imgValidCodeState = false;
                    $("#imgValidCode").data('error', d.errMsg);
                }
            },
            error: function () {
                validator.showErrorTip(false, "imgValidCode", "连接服务器出错");
                //记录状态
                imgValidCodeState = false;
            }
        });
    }
    
    /**
     * ajax检查图形验证码【手机注册】是否输入正确
     * @param {def} 表示同步或异步请求，true值时表示同步
     */
    function ajaxImgValidPhone(obj,def){
        var async = true;
        async = !def || false;
        //格式有误 => 返回
        if ($("#imgValidCodePhone").parent().find("[data-flag='incorrect']").length > 0 || $("#imgValidCodePhone").val() === "") {
            return;
        }
        //值跟上次一样 => 也返回
        if (imgValidCodePhoneOld === $("#imgValidCodePhone").val()) {
            if (!imgValidCodePhoneState) {
                //验证失败
                validator.showErrorTip(false, "imgValidCodePhone", $('#imgValidCodePhone').data('error'));
            }
            return;
        }
        //记录这次的值
        imgValidCodePhoneOld = $("#imgValidCodePhone").val();
        validator.showErrorTip(false,"imgValidCodePhone", "检验中……");
        $.ajax({
            type: "post",
            dataType: "json",
            url: "/regist/ajaxverify",
            data: "code=" + $("#imgValidCodePhone").val(),
            async:  false,
            timeout: 30000,
            success: function (d) {
                if(d.ret == '1'){
                    validator.showErrorTip(true, "imgValidCodePhone", d.errMsg);
                    //记录状态
                    imgValidCodePhoneState = true;
                    if(!/\d/.test($('#btn-getvericode').val())) {
                        $('#btn-getvericode').removeAttr('disabled').removeClass('btn-shop-gray').addClass('btn-shop-red');
                    }
                }else{
                    validator.showErrorTip(false, "imgValidCodePhone", d.errMsg);
                    //记录状态
                    imgValidCodePhoneState = false;
                    $("#imgValidCodePhone").data('error', d.errMsg);
                    if(!/\d/.test($('#btn-getvericode').val())) {
                        $('#btn-getvericode').attr('disabled','disabled').removeClass('btn-shop-red').addClass('btn-shop-gray');
                    }
                }
            },
            error: function () {
                validator.showErrorTip(false, "imgValidCodePhone", "连接服务器出错");
                //记录状态
                imgValidCodePhoneState = false;
                if(!/\d/.test($('#btn-getvericode').val())) {
                    $('#btn-getvericode').attr('disabled','disabled').removeClass('btn-shop-red').addClass('btn-shop-gray');
                }
            }
        });
    }
    $("header").find("h1").find("strong").html("手机注册");
    $(".regtype>li").on("click", function () {
        var i=$(this).index();
        $(".regtype .input-radio").removeClass("input-radio-checked");
        $(this).find(".input-radio").addClass("input-radio-checked");
        if(i==0){
            $(".with-phone").show();
            $(".with-email").hide();
            $("header").find("h1").find("strong").html("手机注册");
        }
        else if(i==1){
            $(".with-phone").hide();
            $(".with-email").show();
            $("header").find("h1").find("strong").html("邮箱注册");
        }
        $("#reg_type").val(i+1); 
        $("#regform").find(".validate_tip").hide().attr("data-flag","");
        $("#regform").find(".validate_br").removeClass("validate_br");
        validator.errors = {};
        $("#imgCode").attr("src","/regist/verify"+"/v/"+Math.random());
        $("#imgCodePhone").attr("src","/regist/verify"+"/v/"+Math.random());
        $("#imgValidCode").val("");
        $("#imgValidCodePhone").val("");
    });
    
    $('#needimgvalid').one('click',function(){
        if($('#btn-getvericode').attr("disabled")){
            validator.showErrorTip(false,"validCode", "请先校验图形验证码");
        }
    });

    // 获取验证码
    $("#btn-getvericode").on("click", function () {
        $("#mobilePhone").blur();
        //ajaxCheckMobile('', true);
        if ($("#mobilePhone").parent().find("[data-flag='incorrect']").length > 0 || $("#mobilePhone").val() === "") {
            return;
        }
        if(!mobileState){
            return;
        }
        $("#btn-getvericode").attr('disabled','disabled').removeClass('btn-shop-red').addClass('btn-shop-gray');
        $.post("/phone/ajaxregist", {"phone": $("#mobilePhone").val(),"verify": $("#imgValidCodePhone").val()}, function (d) {
            if (d.ret == '1') {
                //validator.showErrorTip(true, "validCode", "输入正确");
                OPTools.passport.setInterval(120, "btn-getvericode", "重新获取", "获取验证码");
            } else {
                validator.showErrorTip(false, "validCode", d.errMsg);
                $("#btn-getvericode").removeAttr('disabled');
                if (d.ret == '-1') {
                    $("#imgCodePhone").attr("src","/regist/verify"+"/v/"+Math.random());
                    $('#btn-getvericode').attr('disabled','disabled').removeClass('btn-shop-red').addClass('btn-shop-gray');
                }
            }
        }, "json").fail(function () {
                validator.showErrorTip(false, "validCode", "连接服务器出错");
                $("#btn-getvericode").removeAttr('disabled');
            });
    });

    //ajax检查手机唯一性
    $("#mobilePhone").on("blur", ajaxCheckMobile);

    //ajax检查手机验证码
    $("#validCode").on("blur", ajaxCheckValidCode);

    //ajax检查Email
    $("#email").on("blur", ajaxCheckEmail);

    //ajax检查图形验证码
    $("#imgValidCode").on("blur",function(){
        if($(this).val().replace(/^\s+|\s*$/g,"")==""){
            validator.showErrorTip(false, "imgValidCode", "请输入验证码");
            return;
        }
        validator.showErrorTip(true, "imgValidCode", "");
        ajaxImgValid.call(_this);
    });
    //ajax检查图形验证码【手机注册】
    $("#imgValidCodePhone").on("blur",function(){
        if($(this).val().replace(/^\s+|\s*$/g,"")==""){
            validator.showErrorTip(false, "imgValidCodePhone", "请输入验证码");
            return;
        }
        validator.showErrorTip(true, "imgValidCodePhone", "");
        ajaxImgValidPhone.call(_this);
    });

    //点击时更换图形验证码
    $("#imgCode,#imgCodePhone").on("click",function(){
        this.src = "/regist/verify"+"/v/"+Math.random();
    });

    //submit提交
    $("#btn-submit").on("click",function () {
        validator.blur();

        //ajax验证
        if (/checked/.test($(".regtype .input-radio").eq(0).attr('class'))) {//手机注册
            ajaxCheckMobile('', true);
            ajaxCheckValidCode('', true);
            ajaxImgValidPhone('', true);
        } else {//邮箱注册
            $("#imgValidCode").blur();
            ajaxCheckEmail('', true);
            ajaxImgValid('', true);
        }
        if ($("#regform").find("[data-flag='incorrect']").length > 0) {
            return false;
        }
        else{
            $("#regform").submit();
            $(this).off();
            //return true;
        }
    });

    //解绑blur
    /*$('#btn-submit').on({
        mouseover: function () {
            $('#email').off('blur', ajaxCheckEmail);
            $('#mobilePhone').off('blur', ajaxCheckMobile);
            $('#validCode').off('blur', ajaxCheckValidCode);
        },
        mouseout: function () {
            $('#email').on('blur', ajaxCheckEmail);
            $('#mobilePhone').on('blur', ajaxCheckMobile);
            $('#validCode').on('blur', ajaxCheckValidCode);
        }
    });*/

    //回车提交
    $(document).keydown(function(event){
        if(event.keyCode == 13){
            $('#btn-submit').trigger('click');
        }
    });
    $('#mobilePhone,#email').keydown(function(event){
        if(event.keyCode == 13){
            event.stopPropagation();
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