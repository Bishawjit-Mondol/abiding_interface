				<div class="about">
						<div class="wrap">
							<h1>About <span><?=$companyname?></span></h1>
							<div class="panels">
								<div class="panel-left">
									<span> </span>
								</div>
								<div class="panel-right">
									<h3><span><?=$home_heading?></span><br/><?=$slogan?></h3>
									<p>
										<?=$home_intro?>
									</p>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
								<div class="clear"> </div>
						<div class="testimonials">
							<div class="wrap">
								<div class="testimonial-head">
									<h1><span><?=$companyname?></span> Management</h1>
									<p>The people behind <?=$companyname?></p>
								</div>
								<?
									grid_images('management');
								?>
							</div>
						</div>
								<div class="clear"> </div>
						<div class="testimonials">
							<div class="wrap">
								<div class="testimonial-head">
									<h1>Units of <span><?=$companyname?></span></h1>
									<p>The <?=$companyname?> Family</p>
								</div>
								<?
									grid_images('units');
								?>
							</div>
						</div>
								<div class="clear"> </div>
				</div>