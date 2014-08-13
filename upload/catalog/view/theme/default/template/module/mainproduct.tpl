<?php echo $header; ?>
<script type="text/javascript">

$(window).load(function(){
	var urlnow = window.location.href;
	var url    = $('#gregist').attr('href');
	$('#gregist').attr('href', url+'?jump='+encodeURIComponent(urlnow));
});
</script>
<link rel="stylesheet" type="text/css" href="http://statics.oneplus.cn/css/s1.css?v=201407102142" media="screen" />
<link rel="stylesheet" type="text/css" href="http://statics.oneplus.cn/css/paidui.css?v=201407102142" media="screen" />
<!--[if lte IE 6]>
	<script type="text/javascript">
		DD_belatedPNG.fix('.logo img');
        DD_belatedPNG.fix('.icon-user');
		DD_belatedPNG.fix('.l-card img');
		DD_belatedPNG.fix('.r-card img');
		DD_belatedPNG.fix('.pin img');
		DD_belatedPNG.fix('.img-mask img');
	</script>
	<![endif]-->
<!--main-->
    <nav>
		<div class="topbox cf">
			<div class="container cf">
				<div class="topbox-bg">
				<h1 class="ntitle"></h1>
				<ul class="top-nav">
					<li class="tn1"><a href="index.php?route=module/mainproduct/general"><?php echo $text_general;?></a></li>
					<li class="tn2"><a href="index.php?route=module/mainproduct/func"><?php echo $text_function;?></a></li>
					<li class="tn3"><a href="index.php?route=module/mainproduct/design"><?php echo $text_design;?></a></li>
					<li class="tn4"><a href="index.php?route=module/mainproduct/attribute"><?php echo $text_attribute;?></a></li>
				</ul>
				</div>
			</div>
		</div>
	</nav>
	<!-- <section> -->
	<section class="s1">
		<div class="container cf">
			<div class="s-box tc">
				<?php echo $description; ?>
			</div>
		</div>

	</section>


<?php echo $footer; ?>
