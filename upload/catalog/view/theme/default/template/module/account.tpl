<div class="main-l">
  <dl class="l-menu">
    <dt><?php echo $text_account; ?><i class="icon-info"></i></dt>
      <dd>
        <a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a>
        <a href="<?php echo $password; ?>"><?php echo $text_password; ?></a>
        <a href="<?php echo $address; ?>"><?php echo $text_address; ?></a>
        <a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a>      
      </dd>
  </dl>
  <dl class="l-menu">
    <dt><?php echo $text_my_orders; ?><i class="icon-ass"></i></dt>
      <dd>
        <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
        <a href="<?php echo $download; ?>"><?php echo $text_download; ?></a>
        <?php if ($reward) { ?>
        <a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a>
        <?php } ?>
        <a href="<?php echo $return; ?>"><?php echo $text_return; ?></a>
        <a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a>
        <a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a>
      </dd>
   </dl>
  <dl class="l-menu">
    <dt><?php echo $text_my_newsletter; ?><i class="icon-ass"></i></dt>
      <dd>
        <a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a>
      </dd>
  </dl>
</div>
