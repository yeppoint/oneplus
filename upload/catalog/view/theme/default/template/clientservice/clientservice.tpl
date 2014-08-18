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
                      	<li><a href="#" class="isLogin" target="_blank"><i class="icon-order"></i><?php echo $text_order_tracking; ?></a></li>
                        <li><a href="#" class="isLogin" target="_blank"><i class="icon-delivery"></i><?php echo $text_delivery_tracking; ?></a></li>
						<li><a href="#" target="_blank"><i class="icon-register"></i><?php echo $text_register; ?></a></li>
						<li><a href="#" target="_blank"><i class="icon-findpwd"></i><?php echo $text_forget_password; ?></a></li>
						<li><a href="#" target="_blank"><i class="icon-shop"></i><?php echo $text_after_sale; ?></a></li>
						</ul>
                </div>
                <div style="display: none;" class="guide-bd">
                    <dl class="help-menu clearfix">
                        		<?php foreach ($all_categories as $category) { ?>
								<dt><?php echo $category['title']; ?></dt>
								<dd>
									<ul> 
                                        <?php foreach ($all_articles[$category['category_id']] as $article) { ?>
										<li><a target="_blank" href="<?php echo $article['link']; ?>"><?php echo $article['title']; ?></a></li> 
                                        <?php } ?>
									</ul>
								</dd> 
                        		<?php } ?>
                        </dl>
                    <div class="guide-more"><a href="<?php echo $link_more; ?>" class=" f-red"><?php echo $text_more; ?></a></div>
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
							<a onclick="_opq.push(['trackEvent','onepluscn_D3','微博客服微问题博服务'])" href="#" target="_blank">
                                <div class="wrap">
                                    <i class="icon-service icon-sina"></i>
									<span class="text">微博客服</span>
								</div>
                                <div class="button"><em>微问题</em></div>
                                <div class="button"><em>博服务</em></div>
							</a>
						</li>
                        <li>
                            <a onclick="_opq.push(['trackEvent','onepluscn_D4','一加医生疑难问题一键修复'])" href="#">
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
