<?php echo $header; ?>

<?php if (isset($mainproduct)) { ?>
<?php echo $mainproduct['general_description']; ?>
<?php echo $mainproduct['design_description']; ?>
<?php echo $mainproduct['function_description']; ?>
<?php echo $mainproduct['attribute_description']; ?>
<?php } ?>

<?php echo $footer; ?>