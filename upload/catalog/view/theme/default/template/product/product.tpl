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
                <div class="p-price" >
                    <label class="s-title2 "><?php echo $text_price;?></label>
                    <?php if(!$special){?>
                        <strong id='price' data-price='<?php echo $raw_price;?>'><?php echo $price;?></strong> 
                    <?php } else { ?>
                        <small class="line-through"><?php echo $price;?></small>  
                        <strong id='price' data-price='<?php echo $raw_special;?>'><?php echo $special;?></strong> 
                    <?php } ?>
                </div>

                <!--option属性-->
                <?php if(isset($options)) { ?>
                    <?php foreach ($options as $option) { ?>
                        <div class="p-capacity">
                            <h2 class="p-tr-title"><?php echo $option['name'];?></h2>
                            <dl class="p-tr cf">
                              <?php foreach ($option['option_value'] as $option_value) { ?>
                                 <dd>
                                    <a class="p-td" data-price="<?php echo (float)($option_value['price_prefix'].((string)$option_value['raw_price']));?>" name="<?php echo $option['product_option_id']; ?>" id="<?php echo $option_value['product_option_value_id']; ?>">
                                      <i></i><?php echo $option_value['name']; ?>
                                    </a>
                                </dd>
                              <?php }?>
                            </dl>
                        </div>
                    <?php }?>
                <?php }?>
        
              
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
                      <input id="addCartBtn" data-disabled="true" type="button" class="btn fl btn-shop-red btn-shop-xl" value="<?php echo $text_add_to_cart;?>" >
                      <input id="payNow" style="margin-left:10px;" data-disabled="true" type="button" class="btn btn-shop-red btn-shop-xl" value="<?php echo $text_pay_now;?>">
                    <?php } else {?>
                      <input id="addCartBtn" data-disabled="true" type="button" class="btn fl btn-shop-gray btn-shop-xxl disable" value="<?php echo $stock;?>" >
                 
                    <?php } ?>
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
            <a name="anchor-pic"></a>
            <ul class="as-detail-pic" >
                 <?php echo $product_description;?>

            <!--规格参数-->
            <a name="anchor-spec"></a>
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
            <a name="anchor-question"></a>
            <section>
                <div class="box as-detail-question" >
                    <h2><?php echo $text_faq;?></h2>
                    <?php echo $text_faq_content; ?>
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
        //init first_option
        $('.p-capacity').each(function(index) {
          var first_option = $(this).find('.p-td:first').addClass('sel');
        });

        function changePrice(){
            var _price = $('#price').data('price');
            $('a.sel').each(function(){
              _price+=parseFloat($(this).data('price'));
            });
            var currency_symblo = ($('#price').text())[0];
            $('#price').text(currency_symblo+_price);
        }

        changePrice();

        var text_success = "<?php echo $text_add_success; ?>";
        var text_add_to_cart = "<?php echo $text_add_to_cart;?>";
        $("#addCartBtn").on("click", function(event,isPayNow) {
            //disable ..
            if($('#addCartBtn').hasClass('disable')){
              return;
            }

            var _option ={};
            $('a.sel').each(function(){
                _option[$(this).attr('name')] = $(this).attr('id');
            });

            var post_data = {
              "quantity":parseInt($('.i-qty').text()),
              "product_id":<?php echo $product_id;?>,
               <?php if(isset($options)){ ?>
                  "option":_option
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
              console.log(json);
             if(isPayNow==undefined || !isPayNow ){
               //not buy now
               $('#addCartBtn').attr('value', text_success);
               setTimeout(function(){
                   $('#addCartBtn').removeClass('disable');
                   $('#addCartBtn').attr('value', text_add_to_cart);
               }, 1500);
             }else{//buy now
                location = "index.php?route=checkout/checkout";
             }
            
          })
          .fail(function() {
            alert("Please check your network");
   
          }); 
        });

        $('#payNow').on('click',function(){
            $("#addCartBtn").trigger('click',[true]);
        });
        //option value
        // visit sigle `capacity`
        $('.p-capacity').each(function(index) {
          var options = $(this).find('.p-td')
          options.on('click',function(){
              options.removeClass('sel');
              $(this).addClass('sel');
              changePrice();
          });
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