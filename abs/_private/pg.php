<div class="embossed">
	<?php $count=$count+1;?>
	<a onClick='showit(<?=$count?>)'><h2>Follow us on Facebook</h2></a>
	<div id='sud<?=$count?>'>
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
		fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<div class="fb-like-box" data-href="<?=$facebook?>" data-width="<?php echo $width;?>" data-height="320" data-show-faces="true" data-stream="false" data-header="true" data-colorscheme="light" style='background-color:#ffffff;'></div>
	</div>
</div>
<div class="embossed">
		<?php $count=$count+1;?>
		<a onClick='showit(<?=$count?>)'><h2>Visitors of our website</h2></a>
		<div id='sud<?=$count?>'>
		</div>
</div>
<div class="embossed">
		<?php $count=$count+1;?>
		<a onClick='showit(<?=$count?>)'><h2>Comment using Facebook account</h2></a>
		<div id='sud<?=$count?>'>
		<div class="fb-comments" data-href="http://<?php echo $domain;?>" data-width="<?=$width?>" data-num-posts="10" data-colorscheme="light"></div>
		</div>
</div>