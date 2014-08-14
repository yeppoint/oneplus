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
		   
		   <div class="toolbar"><?php require( dirname(__FILE__).'/toolbar.tpl' ); ?></div>
		  
			<div class="heading">
			  <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
				<div class="buttons">
				  <a onclick="$('#form').submit();" class="button"><?php echo $this->language->get("button_save"); ?></a>
				</div>  
			</div>
			
			<div class="content"><form action="<?php echo $action;?>" method="post" id="form">
				<div class="box-columns">
					

					<div class="module-setting-tabs htabs">
						<div class="nav-setting pavhtabs">
							<a href="#tab-blog-setting"><?php echo $this->language->get('text_blog_setting');?></a>
							<?php
								if(!empty($layout_modules)){
									foreach($layout_modules as $key=>$modules){
										$key = trim($key);
										?>
										<a href="#tab-module-<?php echo $key ?>"><?php echo $this->language->get("tab_".strtolower($key)); ?></a>
										<?php
									}
								}
							?>
						</div>
					</div>	
						<div class="clearfix clear"></div>
							<div id="tab-blog-setting" >
								<div class="clearfix clear"></div>
								<table class="form">
									
								
								
									<tr>
										<td><?php echo $this->language->get('entry_blog_image_types');?></td>
										<td>
											<select name="pavblog[blog_image_type]">
											<?php foreach( $image_types as $k => $v ) { ?>
												<option value="<?php echo $k;?>" <?php if($k==$general_setting['blog_image_type']){?>selected="selected"<?php } ?>><?php echo $v;?></option>	
											<?php } ?>
											</select>
										</td>
									</tr>
									<tr>
										<td><?php echo $this->language->get('entry_show_title');?></td>
										<td>
											<select name="pavblog[blog_show_title]">
											<?php foreach( $yesno as $k => $v ) { ?>
												<option value="<?php echo $k;?>" <?php if($k==$general_setting['blog_show_title']){?>selected="selected"<?php } ?>><?php echo $v;?></option>	
											<?php } ?>
											</select>
										</td>
									</tr>
									
									<tr>
										<td><?php echo $this->language->get('entry_show_image');?></td>
										<td>
											<select name="pavblog[blog_show_image]">
											<?php foreach( $yesno as $k => $v ) { ?>
												<option value="<?php echo $k;?>" <?php if($k==$general_setting['blog_show_image']){?>selected="selected"<?php } ?>><?php echo $v;?></option>	
											<?php } ?>
											</select>
										</td>
									</tr>

									<tr>
										<td><?php echo $this->language->get('entry_show_author');?></td>
										<td>
											<select name="pavblog[blog_show_author]">
											<?php foreach( $yesno as $k => $v ) { ?>
												<option value="<?php echo $k;?>" <?php if($k==$general_setting['blog_show_author']){?>selected="selected"<?php } ?>><?php echo $v;?></option>	
											<?php } ?>
											</select>
										</td>
									</tr>
									<tr>
										<td><?php echo $this->language->get('entry_show_category');?></td>
										<td>
											<select name="pavblog[blog_show_category]">
											<?php foreach( $yesno as $k => $v ) { ?>
												<option value="<?php echo $k;?>" <?php if($k==$general_setting['blog_show_category']){?>selected="selected"<?php } ?>><?php echo $v;?></option>	
											<?php } ?>
											</select>
										</td>
									</tr>
									<tr>
										<td><?php echo $this->language->get('entry_show_created');?></td>
										<td>
											<select name="pavblog[blog_show_created]">
											<?php foreach( $yesno as $k => $v ) { ?>
												<option value="<?php echo $k;?>" <?php if($k==$general_setting['blog_show_created']){?>selected="selected"<?php } ?>><?php echo $v;?></option>	
											<?php } ?>
											</select>
										</td>
									</tr>
									<tr>
										<td><?php echo $this->language->get('entry_show_hits');?></td>
										<td>
											<select name="pavblog[blog_show_hits]">
											<?php foreach( $yesno as $k => $v ) { ?>
												<option value="<?php echo $k;?>" <?php if($k==$general_setting['blog_show_hits']){?>selected="selected"<?php } ?>><?php echo $v;?></option>	
											<?php } ?>
											</select>
										</td>
									</tr>
								</table><div class="clearfix clear"></div>
						</div>	<div class="clearfix clear"></div>
					 <?php
						if(!empty($layout_modules)){
							foreach($layout_modules as $key=>$item_module){
								//check the module is not installed
								if(!is_array($item_module)){
									$install_link = $this->url->link('extension/module/install', "extension=$key&token=" . $this->session->data['token'], 'SSL');
									?>
									<div id="tab-module-<?php echo $key;?>">
										<div class="tab-inner">
											<p><?php echo $this->language->get("module_not_installed"); ?><a  class="install_button" href="<?php echo $install_link; ?>"><?php echo $this->language->get("install");?></a></p>
											<div class="clear"></div>
										</div>
									</div>
									<?php
								}else{
									$modules_tpl = dirname(__FILE__).'/modules/'.trim($key).'.tpl';
									$modules = $item_module;
									$module_key = $key;
									if (isset($this->request->post[$key.'_module'])) {
										$modules = $this->request->post[$key.'_module'];
									}
									
									?>
									<div id="tab-module-<?php echo $key;?>">
										<div class="tab-inner">
											<input type="hidden" name="pavblog[modules][]" value="<?php echo $key;?>"/>
											<?php
											if( file_exists($modules_tpl) ){
												require_once($modules_tpl);
											}
											?>
											<div class="clear"></div>
										</div>
									</div>
									
									<?php
								}
								
							}
						}
					?>
					
				</div>
				
				
			</div>
		</div>	
		
		
 </div>
  
 <script type="text/javascript">
	$(".pavhtabs a").tabs();
	$(".pavmodshtabs a").tabs();
	function __submit( val ){
		$("#action_mode").val( val );
		$("#form").submit();
	}
	
 </script>
 
<?php echo $footer; ?>
