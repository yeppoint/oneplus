<?php echo $header;?>
<link media="screen" href="catalog/view/css/phoneaccessories/list.css" type="text/css" rel="stylesheet">
<section class="container clearfix" id="phaccsect1">
        <h2 class="phacc_h2 f-2l"><div><span class="fl"><?php echo $featured_product; ?></span></div></h2>
        <ul class="phaccul_1">
            <?php foreach ($featured_products as $product) { ?>
                <li class="phaccul_li01">
                    <div class="nobrdr nobrdb">
                        <figure><a href="<?php echo $product['href'];?>"><img src="<?php echo $product['image'];?>" alt="<?php echo $product['name'];?>"></a></figure>
                        <figcaption><a href="<?php echo $product['href'];?>"><?php echo $product['name'];?><em><?php echo $product['price'];?></em></a></figcaption>
                    </div>
                </li>
            <?php }?>  
        </ul>
    </section>
<section class="container clearfix" id="phaccsect2">
        <h2 class="phacc_h2 f-2l"><div><span class="fl"><?php echo $all_product; ?></span></div></h2>
         <ul class="phaccul_1">
            <?php foreach ($all_products as $product) { ?>
                <li class="phaccul_li01">
                    <div class="nobrdr nobrdb">
                        <figure><a href="<?php echo $product['href'];?>"><img src="<?php echo $product['image'];?>" alt="<?php echo $product['name'];?>"></a></figure>
                        <figcaption><a href="<?php echo $product['href'];?>"><?php echo $product['name'];?><em><?php echo $product['price'];?></em></a></figcaption>
                    </div>
                </li>
            <?php }?>  
        </ul>
</section>
<?php echo $footer;?>