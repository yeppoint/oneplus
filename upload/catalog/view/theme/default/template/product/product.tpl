<?php echo $header; ?> 
  <style type="text/css">
  </style>
  <article>
      <div class="container cf aL sell-cont">
        <div class="b-detail-l aC">
          <div class="b-pic pic-fez">
            <ul class="p-pic" id="p-pic">
                  <?php foreach ($images as $image) { ?>
                      <li><img src="<?php echo $image['popup']?>" alt="">
                  <?php }?>
            </ul>
          </div>
          <div class="p-pager">
              <ul class="ul-pager" id="ul-pager">
                      <?php 
                       for ($i = 0;$i<count($images);$i++ ) { 
                          $image = $images[$i];?>
                          <li><a href="javascript:;" data-slide-index="<?php echo $i;?>"><img src="<?php echo $image['popup'];?>" alt=""></a></li>
                      <?php }?>
              </ul>
          </div>
          <!--<div class="p-sale"><p class="sale-info">特价</p></div> -->
        </div>
        <div class="b-detail-r sell-ph-det">
          <h1 class="p-title" style="color:#10181f"><?php echo $product_name;?></h1>
          <p class="p-des"><a href="#"></a></p>
                <div class="p-price">
                    <label class="s-title2"><?php echo $text_price;?></label><strong><?php echo $price;?></strong>
                </div>

                <!--option属性-->
                <div class="p-capacity">
                    <?php if(isset($options) && isset($options['option_value'])){ ?>
                        <h2 class="p-tr-title"><?php echo $text_available_options;?></h2>
                        <dl class="p-tr cf">
                          <?php foreach ($options['option_value'] as $option_value) { ?>
                             <dd>
                                <a class="p-td" name="<?php echo $options['product_option_id']; ?>" id="<?php echo $option_value['product_option_value_id']; ?>"><i></i><?php echo $option_value['name']; ?></a>
                            </dd>
                          <?php }?>
                        </dl>
                    <?php }?>
                </div>
              
                <div class="p-qty new-qty cf">
                    <label class="s-title2"><?php echo $text_quantity;?></label>
                    <div class="box-qty-new">
                        <span class="i-minus"></span>
                        <span class="i-qty" style="-moz-user-select:none;" onselectstart="return false;">1</span>
                        <span class="i-plus"></span>
                    </div>
                </div>

                <div class="p-bbtn cf">
                    <?php if($quantity > 0) { ?>
                      <input id="addCartBtn" data-disabled="true" type="button" class="btn fl btn-shop-red btn-shop-xxl" value="<?php echo $text_add_to_cart;?>" >
                    <? } else {?>
                      <input id="addCartBtn" data-disabled="true" type="button" class="btn fl btn-shop-gray btn-shop-xxl disable" value="<?php echo $stock;?>" >
                    <? } ?>
                </div>
            </div>
        </div>
    </article>

    <article>
        <div class="as-detail container">
            <ul class="as-detail-nav">  
                <li class="f"><a href="<?php echo $product_url;?>#anchor-pic"><?php echo $text_product_decription;?></a></li>
                <li class="s"><a href="<?php echo $product_url;?>#anchor-spec"><?php echo $text_product_attributes;?></a></li>
                <li class="l"><a href="<?php echo $product_url;?>#anchor-question"><?php echo $text_faq;?></a></li>
            </ul>
            <!--商品详情-->
    
            <ul class="as-detail-pic" >
                 <?php echo $product_description;?>

            <!--规格参数-->
            <section>
             
              <div class="box as-detail-spec" >
                    <h2 ><?php echo $text_product_attributes;?></h2>
                    <div class="c cf ">
                      <ul>
                        <?php foreach ($attrs as $attr) {        
                           foreach ($attr['attribute'] as $attribute) { ?>
                               <li>
                                 <span><?php echo $attribute['name'];?></span>
                                  <?php echo $attribute['text'];?>
                               </li>
                           <?php }
                         }?>                    
                      </ul>
                    </div>                  
                </div>
            </section>

            <!--常见问题-->
            <section>
               
                <div class="box as-detail-question" >
                    <h2><?php echo $text_faq;?></h2>
                    <div class="c cf">
                        <dl>
                            <dt>Not things</dt>
                        </dl>
                       
                    </div>
                </div>
            </section>
        </div>
    </article>
    <div class="s-large"></div>
    <script type="text/javascript" src="catalog/view/javascript/jquery/jquery.bxslider.min.js"></script>
 
    <script type="text/javascript">
        var currSpecList = [];
        $(function(){
            $('#p-pic').bxSlider({mode:'fade',pagerCustom:'#ul-pager',responsive:true});
  
        });
    </script>

    <script type="text/javascript">
    $(document).ready(function() {

        //init
        if($('.p-td').length>0){
          $('.p-td:first').addClass('sel');
        }

        var text_success = "<?php echo $text_add_success; ?>";
        var text_add_to_cart = "<?php echo $text_add_to_cart;?>";
        $("#addCartBtn").on("click", function() {
            //disable ..
            if($('#addCartBtn').hasClass('disable')){
              return;
            }

            var post_data = {
              "quantity":parseInt($('.i-qty').text()),
              "product_id":<?php echo $product_id;?>,
               <?php if(isset($options) && isset($options['option_value'])){ ?>
                  "option":{
                    "<?php echo $options['product_option_id']; ?>":parseInt($('a.sel').attr('id'))
                   }
                  
              <?php }?>
            }

          $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'POST',
            dataType:'json',
            data: post_data,
            beforeSend:function(){

              $('#addCartBtn').addClass('disable');
            }
           
          })
          .done(function(json) {

             $('#addCartBtn').attr('value', text_success);
             setTimeout(function(){
                 $('#addCartBtn').removeClass('disable');
                 $('#addCartBtn').attr('value', text_add_to_cart);
             }, 1500);
          })
          .fail(function() {
            alert("Please check your network");
   
          });
         
          
          
        });
        //option value
        $('.p-td').on('click',function(){
            $('.p-td').removeClass('sel');
            $(this).addClass('sel');
        });

        //+ -
        $('.i-minus').on('click',function(){
            if(parseInt($('.i-qty').text())>0){
              $('.i-qty').text( parseInt($('.i-qty').text())-1);
            }
        });

        $('.i-plus').on('click',function(){
            $('.i-qty').text(parseInt($('.i-qty').text()) + 1);
        });
    });

    </script>
<?php echo $footer; ?>