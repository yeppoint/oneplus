<?php  echo $header;  ?>
 <div id="content">
	  <div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	  </div>
	  <?php if ($error_warning) { ?>
	  <div class="warning"><?php echo $error_warning; ?></div>
	  <?php } ?>
		<div class="box">
			<div class="heading">
			  <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
			
			</div>
			
			<div class="content">
				<div class="box-columns">
					
					<div class="column2">
						
						<div class="tool-icons clearfix" style="width:100%">
							<h4><?php echo $this->language->get('text_quickicons');?></h4>
							<ul>
																<li><a href="<?php echo $manage_category_link;?>"><span class="icon-category icon"></span><span><?php echo $this->language->get('databroad_categories')?></span></a></li>
								<li><a href="<?php echo $add_category_link;?>"><span class="icon-addcategory icon"></span><span><?php echo $this->language->get('databroad_add_category')?></span></a></li>
								<li><a href="<?php echo $manage_blog_link;?>"><span class="icon-blogs icon"></span><span><?php echo $this->language->get('databroad_blogs')?></span></a></li>
								<li><a href="<?php echo $add_blog_link;?>"><span class="icon-blog icon"></span><span><?php echo $this->language->get('databroad_add_blog')?></span></a></li>
							</ul>
						</div>
					</div>
					<div class="column2">
						
						<div  class="htabs">
							<a href="#panel-lastest"><?php echo $this->language->get('latest_blog');?></a>
							<a href="#panel-mostread"><?php echo $this->language->get('most_read');?></a>
						</div>
						<div id="panel-lastest">
							<ul>
							<?php foreach( $newest as $blog ) { ?>
								<li>
									<a href="<?php echo $this->url->link("module/pavblog/blog","id=".$blog['blog_id']."&token=".$token);?>"><?php echo $blog['title'];?></a>
								</li>
							<?php } ?>
							</ul>
						</div>
						<div id="panel-mostread">
							<ul>
							<?php foreach( $mostread as $blog ) { ?>
								<li>
									<a href="<?php echo $this->url->link("module/pavblog/blog","id=".$blog['blog_id']."&token=".$token);?>"><?php echo $blog['title'];?></a>
								</li>
							<?php } ?>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>	
		
		
 </div>
 
 <script type="text/javascript">
	$('.htabs a').tabs();

	$("#guide-links a").click( function(){
	
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="'+$(this).attr('href')+'" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: 'Guide',
		close: function (event, ui) {},	
		bgiframe: false,
		width: 900,
		height: 550,
		resizable: false,
		modal: true
	});
		return false; 
	 });
 </script>
<?php echo $footer; ?>
