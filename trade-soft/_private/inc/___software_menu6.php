<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /* Sugession menu Start  */ ?>





<li class="treeview treeview main-tree sugesstion-tree"  >
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "পন্য মজুদ" : "Stock");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">


		<li>

			<li class="treeview sugesstion-tree"  >
				<a href="#">
					<i class="fa fa-bar-chart-o"></i>
					<span><?=($lang ? "রিপোর্ট" : "Report");?></span>
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">

					<li>
						<a class = 'inactive page-loader box-entry  link0802' data="cat_id=1&cat_name=PPR" href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "পি,পি,অার, মজুদ" : "PPR Stock");?></span>
						</a>

					</li>
					<li>
						<a class = 'inactive page-loader box-entry  link0802' data="cat_id=2&cat_name=uPVC" href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "ইউ, পি, ভি, সি, মজুদ" : "uPVC Stock");?></span>
						</a>

					</li>

					<li>
						<a class = 'inactive page-loader box-entry  link0215' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "মজুদের লগ" : "Stock Log");?></span>
						</a>

					</li>
					<? if(0){ ?>
					<li>
						<a class = 'inactive page-loader box-entry  link0225' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "চাহিদার লগ" : "Stock demand Log");?></span>
						</a>

					</li>
					<? } ?>
				</ul>
			</li>   

		</li>


	</ul>
</li>



<li class="treeview treeview main-tree sugesstion-tree"  >
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "ব্যাবহারকারী" : "User");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu search-result">

		<li class = 'menu-label'>
			<a class = 'inactive page-loader box-entry link0253' href="#">
				<i class = 'fa fa-square-o'></i><span><?=($lang ?  "পাসওয়ার্ড সংশোধন করুন" : "Change Password");?></span>
			</a>

		</li>
	</ul>
</li>



<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* Sugestion menu end  */ ?>
