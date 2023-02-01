<div class="embossed">
	<?php $count = $count + 1; ?>
	<a onClick='showit(<?= $count ?>)'>
		<h2>Follow us on Facebook</h2>
	</a>
	<div id='sud<?= $count ?>'>
		<div id="fb-root"></div>
		<script>
			(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) return;
				js = d.createElement(s);
				js.id = id;
				js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
		</script>
		<div class="fb-like-box" data-href="<?= $facebook ?>" data-width="<?php echo $width; ?>" data-height="320" data-show-faces="true" data-stream="false" data-header="true" data-colorscheme="light" style='background-color:#ffffff;'></div>
	</div>
</div>
<div class="embossed">
	<?php $count = $count + 1; ?>
	<a onClick='showit(<?= $count ?>)'>
		<h2>Visitors of our website</h2>
	</a>
	<div id='sud<?= $count ?>'>
		<script type="text/javascript" src="//ra.revolvermaps.com/0/0/6.js?i=0ni7luzu4ll&amp;m=0&amp;s=220&amp;c=ff0000&amp;cr1=ffffff&amp;f=arial&amp;l=0" async="async"></script>
		<a href="http://bit.ly/12REuTy"><img src="http://s11.flagcounter.com/count/12REuTy/bg_006794/txt_ffffff/border_006794/columns_6/maxflags_72/viewers_0/labels_0/pageviews_0/flags_0/" alt="Flag Counter" border="0"></a>
	</div>
</div>
<div class="embossed">
	<?php $count = $count + 1; ?>
	<a onClick='showit(<?= $count ?>)'>
		<h2>Comment using Facebook account</h2>
	</a>
	<div id='sud<?= $count ?>'>
		<div class="fb-comments" data-href="http://<?php echo $domain; ?>" data-width="<?= $width ?>" data-num-posts="10" data-colorscheme="light"></div>
	</div>
</div>