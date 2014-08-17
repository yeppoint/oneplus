<?php  echo $header;  ?>
	 

  
 <div id="content">
	  <div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	  </div>
	  <?php if ($error_warning) { ?>
	  <div class="warning"><?php 
	  
	  if( is_array($error_warning) ) {
		echo implode("<br>",$error_warning);
	 } else {
		echo $error_warning;
	  }
	  ?>
	  
	  </div>
	  <?php } ?>
		<div class="box">
		   
		   <div class="toolbar"><?php require( dirname(__FILE__).'/toolbar.tpl' ); ?></div>
		  
			<div class="heading">
			  <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
				<div class="buttons">
				  <a onclick="$('#form').submit();" class="button"><?php echo $this->language->get("button_save"); ?></a>
				  <a onclick="__submit('save-edit')" class="button"><?php echo $this->language->get('button_save_edit'); ?></a>
				  <a onclick="__submit('save-new')" class="button"><?php echo $this->language->get('button_save_new'); ?></a>
				  <?php if( $blog['blog_id'] ) { ?>	
					<a  href="<?php echo $action_delete;?>" class="button action-delete"><?php echo $this->language->get("button_delete"); ?></a>	
				  <?php } ?>
				</div>  
			</div>
			
			<div class="content">
				<div class="box-columns">
					
					 
					<form id="form" enctype="multipart/form-data" method="post" action="<?php echo $action;?>">
							<input type="hidden" name="action_mode" id="action_mode" value=""/>
							<div id="tab-general">
									<input type="hidden" name="pavblog_blog[blog_id]" value="<?php echo $blog['blog_id'];?>"/>
									<div>
										 <table class="form">
											<tr>
												<td><?php echo $this->language->get('entry_category_id');?></td>
												<td><?php echo $menus;?></td>
											</tr>
											<tr>
												<td><?php echo $this->language->get('entry_status');?></td>
												<td>
													<select name="pavblog_blog[status]">
													<?php foreach( $yesno as $k=>$v ) { ?>
														<option value="<?php echo $k;?>" <?php if( $k==$blog['status'] ) { ?> selected="selected" <?php } ?>><?php echo $v;?></option>
													<?php } ?>
												</td>
											</tr>
									  </table>
									</div>
									
									<div id="language-blog" class="htabs pavtabs">
										<?php foreach ($languages as $language) { ?>
										<a href="#tab-language-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
										<?php } ?>
									  </div>
									  <?php foreach ($languages as $language) { ?>
									  <div id="tab-language-<?php echo $language['language_id']; ?>">
										<table class="form">
										  <tr>
											<td><?php echo $this->language->get('entry_title');?></td>
											<td><input name="pavblog_blog_description[<?php echo $language['language_id'];?>][title]" size="120" value="<?php echo $pavblog_blog_descriptions[$language['language_id']]['title'];?>"/></td>
										  </tr>
										   <tr>
											<td><?php echo $this->language->get('entry_content');?></td>
											<td>
												<textarea name="pavblog_blog_description[<?php echo $language['language_id'];?>][content]"  rows="6" cols="10"><?php echo $pavblog_blog_descriptions[$language['language_id']]['content'];?></textarea>
											</td>
										  </tr>
										</table>
									  </div>
									  <?php } ?>
									 
							</div>
					</form>
				 
				</div>
			</div>
		</div>	
		
		
 </div>
 <script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
 <script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
 <script type="text/javascript">
 $('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.pavtabs a').tabs();
	function __submit( val ){
		$("#action_mode").val( val );
		$("#form").submit();
	}
	$(".action-delete").click( function(){ 
		return confirm( "<?php echo $this->language->get("text_confirm_delete");?>" );
	} );
  <?php foreach ($languages as $language) { ?>
CKEDITOR.replace('pavblog_blog_description[<?php echo $language['language_id']; ?>][content]', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>

function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 700,
		height: 400,
		resizable: false,
		modal: false
	});
};
 </script>
<?php echo $footer; ?>
