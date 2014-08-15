<?php echo $header; ?>
<div id="content">
    <div class="breadcrumbs">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <div class="help-container">
        <div class="container clearfix">
            <div class="guide-box fl">
                <ul class="guide-hd clearfix">
                    <li class="current"><a onclick="_opq.push(['trackEvent','onepluscn_C0','自助服务'])" href="javascript:;"><?php echo $text_selfservice; ?></a></li>
                    <li class=""><a onclick="_opq.push(['trackEvent','onepluscn_C1','帮助中心'])" href="javascript:;"><?php echo $text_helpcenter; ?></a></li>
                    <li><a onclick="_opq.push(['trackEvent','onepluscn_C2','联系客服'])" href="javascript:;"><?php echo $text_contactservice; ?></a></li>
                </ul>
                <div class="guide-bd" style="display: block;">
                    <ul class="self-help parallel">
                      	<li><a href="http://my.oneplus.cn" class="isLogin" target="_blank"><i class="icon-order"></i>查询订单</a></li>
						<li><a href="http://my.oneplus.cn" class="isLogin" target="_blank"><i class="icon-cancelorder"></i>取消订单</a></li>
                        <li><a href="http://my.oneplus.cn" class="isLogin" target="_blank"><i class="icon-delivery"></i>查询配送</a></li>
                        <li><a href="javascript:;" id="checkRealBtn"><i class="icon-check"></i>防伪验证</a></li>
                        <li><a href="javascript:;" class="notyet"><i class="icon-returns"></i>申请退换货</a></li>
						<li><a href="http://account.oneplus.cn/regist/index" target="_blank"><i class="icon-register"></i>账户注册</a></li>
						<li><a href="http://account.oneplus.cn/login/forget" target="_blank"><i class="icon-findpwd"></i>找回密码</a></li>
						<li><a href="/Server/shopbranch" target="_blank"><i class="icon-shop"></i>查询售后网点</a></li>
						<li><a href="javascript:;" class="notyet"><i class="icon-buyWarranty"></i>购买延保</a></li>
						<li><a href="javascript:;" class="notyet"><i class="icon-checkWarranty"></i>查询延保</a></li>
						</ul>
                </div>
                <div style="display: none;" class="guide-bd">
                    <dl class="help-menu clearfix">
								<dt>账户管理</dt>
								<dd>
									<ul> 
										<li><a target="_blank" href="#">帐号注册</a></li> 
									 
										<li><a target="_blank" href="#">帐号登录</a></li> 
									 
										<li><a target="_blank" href="#">找回密码</a></li> 
									 
										<li><a target="_blank" href="#">帐号信息管理</a></li> 
									 
										<li><a target="_blank" href="#">账户常见问题</a></li> 
									</ul>
								</dd> 
                        </dl>
                    <div class="guide-more"><a href="http://service.oneplus.cn/account/read" class=" f-red">查看更多&gt;&gt;</a></div>
                </div>
                <div style="display: none;" class="guide-bd contact-card clearfix">
                   <ul class="service-card">
						<li class="online-qq" id="help-qq">
							<a onclick="_opq.push(['trackEvent','onepluscn_D0','在线客服高效服务沟通0距离'])" href="javascript:;">
								<div class="wrap">
                                    <i class="icon-service icon-qq"></i>
									<span class="text">在线客服</span>
								</div>
                                <div class="button"><em>高效服务</em></div>
                                <div class="button"><em>沟通0距离</em></div>
							</a>
						</li>
                        <li>
                            <a onclick="_opq.push(['trackEvent','onepluscn_D1','电话客服温馨关怀无微不至'])" href="javascript:;" class="tel-contact">
                                <div class="wrap">
                                    <i class="icon-service icon-tel"></i>
                                    <span class="text">电话客服</span>
                                </div>
                                <div class="button"><em>温馨关怀</em></div>
                                <div class="button"><em>无微不至</em></div>
                            </a>
                        </li>
                        <li>
                            <a onclick="_opq.push(['trackEvent','onepluscn_D2','微信客服随时随地服务在手'])" href="javascript:;" class="weixin-contact">
                                <div class="wrap">
                                    <i class="icon-service icon-weixin"></i>
                                    <span class="text">微信客服</span>
                                </div>
                                <div class="button"><em>随时随地</em></div>
                                <div class="button"><em>服务在手</em></div>
                            </a>
                        </li>
						<li>
							<a onclick="_opq.push(['trackEvent','onepluscn_D3','微博客服微问题博服务'])" href="http://weibo.com/yjservice" target="_blank">
                                <div class="wrap">
                                    <i class="icon-service icon-sina"></i>
									<span class="text">微博客服</span>
								</div>
                                <div class="button"><em>微问题</em></div>
                                <div class="button"><em>博服务</em></div>
							</a>
						</li>
                        <li>
                            <a onclick="_opq.push(['trackEvent','onepluscn_D4','一加医生疑难问题一键修复'])" href="http://support.oneplus.cn">
                                <div class="wrap">
                                    <i class="icon-service icon-remote"></i>
                                    <span class="text">一加医生</span>
                                </div>
                                <div class="button"><em>疑难问题</em></div>
                                <div class="button"><em>一键修复</em></div>
                            </a>
                        </li>
					</ul>
                </div>
            </div>

            <div class="help-common fr">
                <!-- 常见问题 -->
                <div class="common-qa">
                    <h3>常见问题</h3>
                    <ol>
				    					        <li><a title="未付款的订单会保存多久？" href="http://service.oneplus.cn/account/readOne/knowledgeId/A100000072">未付款的订单会保存多久？</a></li>
				        				        <li><a title="什么情况下可以申请退换货？" href="http://service.oneplus.cn/account/readOne/knowledgeId/A100000033">什么情况下可以申请退换货？</a></li>
				        				        <li><a title="一加商城支持哪些在线支付方式？" href="http://service.oneplus.cn/account/readOne/knowledgeId/A100000012">一加商城支持哪些在线支付方式？</a></li>
				        				        <li><a title="一加商城的购物流程步骤是什么？" href="http://service.oneplus.cn/account/readOne/knowledgeId/A100000002">一加商城的购物流程步骤是什么？</a></li>
				         
                    </ol>
                </div> 
	<script> 
		$(function(){
			$('.search-click').on('click',function(){ 
				title=$(this).parent().find('.searchKey').eq(0).val();
				location.href="http://service.oneplus.cn/account/search?title="+title; 
			});
			$(document).keydown(function(event){
	            if(event.keyCode == 13){
	                $('.search-click').trigger('click');
	            }
	        });
		});
    </script>            </div>
            
        </div>
    </div> 
</div>
<script type="text/javascript">
    
//tab hover 的时候改变当前文字的颜色，点击的时候增加current类，并且修改对应的div 的display属性
    $(".guide-hd li").on("click",function(){
        var index = $(this).index();
        $('.guide-hd li').removeClass('current');
        $(this).addClass('current');
        $('.guide-bd').hide();
        $('.guide-bd').eq(index).show()
    });

//    $("#tabs a").tabs();
</script>
<?php echo $footer; ?>
