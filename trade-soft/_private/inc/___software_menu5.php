<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /* Sugession menu Start  */ ?>



<li class="treeview treeview main-tree sugesstion-tree"  >
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "বিক্রয়" : "Sales");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>

	<ul class="treeview-menu">

		<li class="treeview"  >
			<a href="#">
				<i class="fa fa-bar-chart-o"></i>
				<span><?=($lang ? "পি. পি. আর." : "PPR");?></span> 
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu search-result">

				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0031' data="cat_id=1&cat_name=PPR" href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "নতুন অর্ডার" : "New Order");?></span>
					</a>
				</li>
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0072' data="cat_id=1&cat_name=PPR" href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "অর্ডারের তালিকা " : "Order List");?></span>
					</a>
				</li>
				<!--
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0147' data="cat_id=1&cat_name=PPR" href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "চালান করুন " : "Make Chalan");?></span>
					</a>
				</li>
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0148' data="cat_id=1&cat_name=PPR" href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "বিল করুন " : "Make Bill");?></span>
					</a>
				</li>
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0070' data="cat_id=1&cat_name=PPR" href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "বিক্রয় ফেরত " : "Sales Return");?></span>
					</a>
				</li>
				-->
			</ul>
		</li>   
		<li class="treeview"  >
			<a href="#">
				<i class="fa fa-bar-chart-o"></i>
				<span><?=($lang ? "ইউ. পি. ভি. সি." : "uPVC");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu search-result">

				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0031' data="cat_id=2&cat_name=uPVC" href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "নতুন অর্ডার" : "New Order");?></span>
					</a>
				</li>
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0072' data="cat_id=2&cat_name=uPVC" href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "অর্ডারের তালিকা " : "Order List");?></span>
					</a>
				</li>
				<!--
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0147' data="cat_id=2&cat_name=uPVC" href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "চালান করুন " : "Make Chalan");?></span>
					</a>
				</li>
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0148' data="cat_id=2&cat_name=uPVC" href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "সাধারন বিক্রয়" : "Make Bill");?></span>
					</a>
				</li>
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0070' data="cat_id=2&cat_name=uPVC" href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "বিক্রয় ফেরত " : "Sales Return");?></span>
					</a>
				</li>
				-->
			</ul>
		</li>
		
		<!--
		<li>
			<a class = 'inactive page-loader box-entry link0024' href="#">
				<i class = 'fa fa-square-o'></i><span><?=($lang ?  "বিক্রয় রিপোর্ট  " : "Sales Report");?></span>
			</a>
		</li>  
		<li class = 'menu-label'>
			<a class = 'inactive page-loader box-entry link0219' href="#">
				<i class = 'fa fa-square-o'></i><span><?php echo($lang ?  "বিক্রয় ফেরতের তথ্য" : " Sales return history " );?></span>
			</a>
		</li>
		-->
		<li class="treeview sugesstion-tree"  >
				<a href="#">
					<i class="fa fa-bar-chart-o"></i>
					<span><?=($lang ? "রিপোর্ট" : "Report");?></span>
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">


					<li>
							<a class = 'inactive page-loader box-entry  link0175' href="#">
								<i class = 'fa fa-square-o'></i><span><?=($lang ?  "বিক্রয় খতিয়ান" : "Sales Ledger");?></span>
							</a>

					</li>


					<li>
						<a class = 'inactive page-loader box-entry  link0176' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "বিক্রয় তথ্য" : "Sales Statement");?></span>
						</a>

					</li>
					<li>
						<a class = 'inactive page-loader box-entry  link0181' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "তারিখ অনুযায়ী বিক্রয় তথ্য" : "Date-Wise Sales Statement");?></span>
						</a>

					</li>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0182' href="#">
							<i class = 'fa fa-square-o'></i><span><?php echo($lang ?  "কর্মচারীর বিক্রয় তথ্য " : "Sales Representative Statement");?></span>
						</a>
					</li>

					<li>
						<a class = 'inactive page-loader box-entry  link0180' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "মোট বিক্রয় তথ্য" : "Total Sales Summary");?></span>
						</a>

					</li>

				</ul>
		  
		</li>
		
	</ul>
</li> 


<li class="treeview treeview main-tree sugesstion-tree"  >
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "ক্রেতা" : "Client");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu search-result">



		<li class="treeview sugesstion-tree"  >
				<a href="#">
					<i class="fa fa-bar-chart-o"></i>
					<span><?=($lang ? "রিপোর্ট" : "Report");?></span>
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">

					<li>
						<a class = 'inactive page-loader box-entry  link0240' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "ব্যালেন্স" : "Balance");?></span>
						</a>

					</li>


				</ul>
		  

		</li>

	</ul>
</li>   





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
