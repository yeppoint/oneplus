<?php if (count($languages) > 1) { ?>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <?php foreach ($languages as $language) { ?>
            <a title="<?php echo $language['name']; ?>"
                onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>');
                $(this).parent().submit();"><?php echo $language['name']; ?>
            </a>
        <?php } ?>
        <input type="hidden" name="language_code" value="" />
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </form>
<?php } ?>
