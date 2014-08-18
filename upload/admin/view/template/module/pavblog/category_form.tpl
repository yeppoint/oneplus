<?php
/******************************************************
 * @package Pav pavblog_category module for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/

if( $menu ): 
$module_row= 'ss';
?>
<?php if( $menu['category_id'] > 0 ) { ?>
<h3><?php echo sprintf($text_edit_menu, $menu['title'], $menu['category_id']);?></h3>
<?php } else { ?>
<h3><?php echo $text_create_new;?></h3>
<?php } ?>
<div>
	<h4><?php echo $this->language->get('text_category_information');?></h4>
		 <div id="language-<?php echo $module_row; ?>" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#tab-language-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>
          <?php foreach ($languages as $language) { ?>
          <div id="tab-language-<?php echo $language['language_id']; ?>">
            <table class="form">
              <tr>
				<td>Title</td>
				<td><input name="pavblog_category_description[<?php echo $language['language_id'];?>][title]" value="<?php echo $menu_description[$language['language_id']]['title'];?>"/></td>
              </tr>
            </table>
          </div>
          <?php } ?>

	 <table class="form">
		<tr>
			<td style="display: none"><?php echo $this->language->get('entry_parent_id');?></td>
				
			<td style="display: none">
				<?php echo $menus;?>
 			</td>
		</tr>
	</table>
	<input type="hidden" name="pavblog_category[category_id]" value="<?php echo $menu['category_id']?>"/>
</div>
<?php endif; ?>

<script type="text/javascript"> 
$("#type_submenu-"+$("#pavblog_category-type_submenu").val()).show();
$("#pavblog_category-type_submenu").change( function(){
	$(".type_submenu").hide();
	$("#type_submenu-"+$(this).val()).show();
} );

   $( ".htabs a" ).tabs();
   $(".pavblog_categorytype").hide();
   $("#pavblog_categorytype-"+ $("#pavblog_categorytype").val()).show();
   $("#pavblog_categorytype").change( function(){
		$(".pavblog_categorytype").hide();
		$("#pavblog_categorytype-"+$(this).val()).show();
   } );

$('input[name=\'pavblog_category-manufacturer\']').autocomplete({
	delay: 500,
	source: function(request, response) {		
		$.ajax({
			url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					'manufacturer_id':  0,
					'name':  '<?php echo $text_none; ?>'
				});
				
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.manufacturer_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'pavblog_category-manufacturer\']').val(ui.item.label);
		$('input[name=\'pavblog_category[item]\']').val(ui.item.value);
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$("#pavblog_category-information").change( function(){ 
	$('input[name=\'pavblog_category[item]\']').val($(this).val());
} );

$('input[name=\'pavblog_category-product\']').autocomplete({
	delay: 500,
	source: function(request, response) {		
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					'product_id':  0,
					'name':  '<?php echo $text_none; ?>'
				});
				
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'pavblog_category-product\']').val(ui.item.label);
		$('input[name=\'pavblog_category[item]\']').val(ui.item.value);
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

   
$('input[name=\'path\']').autocomplete({
	delay: 500,
	source: function(request, response) {		
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					'category_id':  0,
					'name':  '<?php echo $text_none; ?>'
				});
				
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.category_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'path\']').val(ui.item.label);
		$('input[name=\'pavblog_category[item]\']').val(ui.item.value);
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
</script>
