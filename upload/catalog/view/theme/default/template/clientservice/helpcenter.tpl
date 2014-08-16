<?php echo $header; ?>
<div id="content">
    <div class="breadcrumbs">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <div class="help-container">
        <div class="container clearfix">
            <!-- left menu -->
			<div class="help-nav fl">
            <?php /*
				1. $first 用于监视当前的list是否为第一个list，如果为第一个list，则为这个list着色！
				2. $is_belongto 用于监视当前文章是否处于某个目录下，如果是处于该目录下，则通过
				   style="display: block"来展开该目录，并将arrow指向上方；否则就隐藏该目录，将
				   arrow指向下方！
				3. 这代码看起来会蛋碎，看码需谨慎！！
			*/?>
            <?php foreach ($all_categories as $category) { ?>
            <ul id="helpNav"> 
			    <li class="nav-category">
                    
                <h4><?php echo $category['title']; ?>
                    <?php $is_belongto = false; ?>
                    <?php foreach ($all_articles[$category['category_id']] as $article) { ?>
                    <?php if (isset($blog_id)) {?>
                    <?php if ((int)$article['blog_id'] == $blog_id) { ?>
                    <i class="arrow arrow-up"></i>
                    <?php $is_belongto = true; break; } ?>
                    <?php } ?>
                    <?php } ?>
                    <?php if (!$is_belongto) { ?>
                    <i class="arrow arrow-down"></i>
                    <?php } ?>
                </h4>
                    
                <?php $is_belongto = false; ?>
                <?php foreach ($all_articles[$category['category_id']] as $article) { ?>
                <?php if (isset($blog_id)) { ?>
                <?php if ((int)$article['blog_id'] == $blog_id) { ?>
                <ul style="display: block">
                <?php $is_belongto = true; break; }?>
                <?php } ?>
                <?php } ?>
                <?php if (!$is_belongto) { ?>
                <ul>
                <?php } ?>
                    <?php foreach ($all_articles[$category['category_id']] as $article) { ?>
					<li id="faq-id-<?php echo $article['blog_id']; ?>"><a href="<?php echo $article['link']; ?>"><?php echo $article['title']; ?></a></li> 
                    <?php } ?>
                </ul>
                    
        		</li>
            </ul>
            <?php } ?>
	        </div>
            <div class="help-sub-content fl">
                <div class="sub-content-hd">
                    <?php foreach ($all_articles as $articles) { ?>
                    <?php foreach ($articles as $article) { ?>
                    <?php if ($article['blog_id'] == $blog_id) { ?>
                    <h3><?php echo $article['title'];?></h3>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                </div>
                <div class="sub-content-bd">
                    <div class="sub-block">
                    <?php foreach ($all_articles as $articles) { ?>
                    <?php foreach ($articles as $article) { ?>
                    <?php if ($article['blog_id'] == $blog_id) { ?>
                    <div style="margin-top: 30px;"><?php echo html_entity_decode($article['content'], ENT_QUOTES, 'UTF-8');?></div>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                    </div>
                </div>
            </div>
            <!--
            <div class="help-common fr">
                <div class="common-qa">
                    <h3>常见问题</h3>
                    <ol>
				        <li><a title="未付款的订单会保存多久？" href="#">未付款的订单会保存多久？</a></li>
				        <li><a title="什么情况下可以申请退换货？" href="#">什么情况下可以申请退换货？</a></li>
				        <li><a title="一加商城支持哪些在线支付方式？" href="#">一加商城支持哪些在线支付方式？</a></li>
				        <li><a title="一加商城的购物流程步骤是什么？" href="#">一加商城的购物流程步骤是什么？</a></li>
                    </ol>
                </div> 
            </div> -->           
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#helpNav ul li").removeClass("cur");
    $("#faq-id-<?php echo $blog_id; ?>").addClass("cur");
</script>
<?php echo $footer; ?>