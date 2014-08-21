<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
    <meta charset="UTF-8" />
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>
    <?php if (isset($icon)&&$icon) { ?>
        <link href="<?php echo $icon; ?>" rel="icon" />
    <?php } ?>
    <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
    <?php foreach ($styles as $style) { ?>
        <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
    <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
    <script type="text/javascript" src="catalog/view/javascript/common.js"></script>
    <?php foreach ($scripts as $script) { ?>
    <script type="text/javascript" src="<?php echo $script; ?>"></script>
    <?php } ?>
    <!--[if IE 7]> 
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
    <![endif]-->
    <!--[if lt IE 7]>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
    <script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
    <script type="text/javascript">
    DD_belatedPNG.fix('#logo img');
    </script>
    <![endif]-->

</head>

<link rel="stylesheet" type="text/css" href="catalog/view/css/init.css" media="screen">
<link rel="stylesheet" type="text/css" href="catalog/view/css/common.css" media="screen">
<link rel="stylesheet" type="text/css" href="catalog/view/css/oneplus.css" media="screen">
<link rel="stylesheet" type="text/css" href="catalog/view/css/index.css" media="screen">
<body>

    <header>
        <div class="header">
            <div class="header-box">
                <div class="container clearfix">
                    <h1 class="logo"><a href="index.php"><img src="<?php if(isset($logo)&&$logo) echo $logo;?>" ></a></h1>
                    <div class="header-top">
                        <ul class="tul clearfix">
                            <li class="nav-t nav-login" id="nav-login">
                                <div class="nav-name nav-login-t">
                                    <span>
                                         <?php echo $language; ?>
                                    </span>
                                </div>
                            </li>
                            <li class="nav-t nav-login" id="nav-login">
                                <div class="nav-name nav-login-t">

                                    <span>
                                        <?php if (!$logged) {
                                            echo $text_welcome;
                                        } else {
                                            echo $text_logged;
                                        }
                                        ?>
                                    </span>
                                </div>
                            </li>
                            <li class="nav-t nav-cart" id="nav-cart">
                                <div class="nav-name nav-cart-t">
                                    <span class="anchor t">
                                        <a href="index.php?route=checkout/cart" class="t"><i class="icon-cart"></i><?php echo $text_cart; ?><em class="cartNum" style="display:none"></em></a>
                                    </span>

                                </div>
                            </li>
                        </ul>
                    </div>
                    <nav>
                        <ul class="nav">
                            <li class="nav-li nav-li1">
                                <a href="index.php?route=module/mainproduct/general" class="nav-name"><?php echo $text_overview; ?></a>
                            </li>
                            <li class="nav-li nav-li3">
                                <a href="index.php?route=product/featured" class="nav-name"><?php echo $text_accessories; ?></a>

                            </li>
                            <li class="nav-li nav-li4">
                                <a href="<?php echo $clientservice; ?>" class="nav-name"><?php echo $text_clientservice; ?></a>
                            </li>
                            <li class="nav-li nav-li4">
                                <a href="#" class="nav-name"><?php echo $text_support; ?></a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>  
        </div>
    </header>
    <!--注意,这里在footer必须闭合-->
   <!--  <div id="container">

        <?php if ($error) { ?>

            <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>

        <?php } ?>
        <div id="notification"></div>
 -->
