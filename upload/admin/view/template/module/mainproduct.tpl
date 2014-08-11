<?php echo $header; ?>
<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']?>"><?php echo $breadcrumb['text']?></a>
		<?php } ?>
	</div>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/module.png" alt="" /><?php echo $heading_title; ?></h1>
			<div class="buttons">
				<a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
				<a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
			</div>
		</div>
		<div class="content">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
				<table class="form">
					<tr>
						<td><?php echo $text_status; ?></td>
						<td>
							<select name="status">
								<?php if ($product) { ?>
								<?php if ((int)$status) { ?>
								<option value="1" selected="selected"><?php echo $text_enable; ?></option>
								<option value="0"><?php echo $text_disable; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enable; ?></option>
								<option value="0" selected="selected"><?php echo $text_disable; ?></option>
								<?php } ?>
								<?php } else { ?>
								<option value="1"><?php echo $text_enable; ?></option>
								<option value="0" selected="selected"><?php echo $text_disable; ?></option>
								<?php } ?>
							</select>
						</td>
					</tr>
					<tr>
						<td><?php echo $text_filter_name; ?></td>
						<td><input type="text" id="filter-name" />&nbsp;<a onclick="filter_button_clicked();" class="button"><?php echo $button_filter; ?></a></td>
					</tr>
					<tr>
						<td><?php echo $text_option; ?></td>
						<td>
							<table class="list">
								<thead>
									<tr>
										<td></td>
										<td><?php echo $text_product_image; ?></td>
										<td><?php echo $text_product_name; ?></td>
										<td><?php echo $text_product_model; ?></td>
										<td><?php echo $text_product_price; ?></td>
										<td><?php echo $text_product_quantity; ?></td>
										<td><?php echo $text_product_status; ?></td>
									</tr>
								</thead>
								<tbody id="option-list">
									<?php if ($product) { ?>
									<tr>
										<td><input type="hidden" name="product-id" value="<?php echo $product['product_id']?>"></td>
										<td><img src="<?php echo $product['image']; ?>" alt="" /></td>
										<td><?php echo $product['name']; ?></td>
										<td><?php echo $product['model']; ?></td>
										<td><?php echo $product['price']; ?></td>
										<td><?php echo $product['quantity']; ?></td>
										<td><?php echo $product['status']; ?></td>
									</tr>
									<?php } ?>
								</tbody>
							</table>
						</td>
					</tr>
				</table>
				<table class="form">
					<tr>
						<td>
							<div id="tabs" class="htabs">
								<a href="#tab-general"><?php echo $text_general; ?></a>
								<a href="#tab-function"><?php echo $text_function; ?></a>
								<a href="#tab-design"><?php echo $text_design; ?></a>
								<a href="#tab-attribute"><?php echo $text_attribute; ?></a>
							</div>
							<div id="tab-general">
								<textarea name="general-description">
									<?php echo $general_description; ?>
								</textarea>
							</div>
							<div id="tab-function">
								<textarea name="function-description">
									<?php echo $function_description; ?>
								</textarea>
							</div>
							<div id="tab-design">
								<textarea name="design-description">
									<?php echo $design_description; ?>
								</textarea>
							</div>
							<div id="tab-attribute">
								<textarea name="attribute-description">
									<?php echo $attribute_description; ?>
								</textarea>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	CKEDITOR.replace('general-description', {
		filebrowserBrowseUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageBrowseUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});
	CKEDITOR.replace('function-description', {
		filebrowserBrowseUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageBrowseUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});
	CKEDITOR.replace('design-description', {
		filebrowserBrowseUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageBrowseUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});
	CKEDITOR.replace('attribute-description', {
		filebrowserBrowseUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageBrowseUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl:'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});
</script>
<script type="text/javascript">
	$('#tabs a').tabs();
</script>
<script type="text/javascript">
	function filter_button_clicked() {
		var product_name = $('#filter-name').val();
		$.get("<?php echo $filter_action; ?>", { token: "<?php echo $token; ?>", filter_name: product_name }, function(data, status) {
			
				$('#option-list').empty();
				data = JSON.parse(data);
				$.each(data, function(i, val) {
					var option_value = 
					'<tr><td><input type="radio" name="product-id" value="' + val['product_id'] + '" /></td>' +
					'<td><img src="' + val['image'] + '" alt="" /></td>' +
					'<td>' + val['name'] + '</td>' +
					'<td>' + val['model'] + '</td>' +
					'<td>' + val['price'] + '</td>' +
					'<td>' + val['quantity'] + '</td>' +
					'<td>' + val['status'] + '</td></tr>';
					
					$('#option-list').append(option_value);	
				});
			
		});
	}
</script>
<?php echo $footer; ?>