<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /* Sales Account */ ?>



<li class="treeview treeview main-tree sugesstion-tree"  >
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "বিক্রয়" : "Sales");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>

	<ul class="treeview-menu">


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
					<li>
						<a class = 'inactive page-loader box-entry  link0400' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "নিষ্ক্রিয়তা তথ্য" : "Inactivity Statement");?></span>
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
		<span><?=($lang ? "ক্রয়" : "Purchase");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">

	


		<li class="treeview sugesstion-tree"  >
				<a href="#">
					<i class="fa fa-bar-chart-o"></i>
					<span><?=($lang ? "রিপোর্ট" : "Report");?></span>
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">

					<li>
						<a class = 'inactive page-loader box-entry  link0177' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "ক্রয় খতিয়ান" : "Purchase Ledger");?></span>
						</a>
					</li>
					<li>
						<a class = 'inactive page-loader box-entry  link0178' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "ক্রয় তথ্য" : "Purchase Statement");?></span>
						</a>
					</li>
					<li>
						<a class = 'inactive page-loader box-entry  link0179' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "মোট ক্রয় তথ্য" : "Total Purchase Statement");?></span>
						</a>
					</li>			
		<li>
			<a class = 'inactive page-loader box-entry  link0068' href="#">
				<i class = 'fa fa-square-o'></i><span><?=($lang ?  "প্রস্তাবিত ক্রয়" : "Proposed Purchase");?></span>
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

	

	</ul>
</li>   












<li class="treeview treeview main-tree sugesstion-tree"  >
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "কর্মকর্তা / কর্মচারী" : "Employee");?></span>
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

					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0182' href="#">
							<i class = 'fa fa-square-o'></i><span><?php echo($lang ?  "কর্মচারীর বিক্রয় তথ্য " : "Sales Representative Statement");?></span>
						</a>
					</li>
				</ul>
		</li>

	</ul>
</li> 


<li class="treeview treeview main-tree sugesstion-tree"  >
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "একাউন্টস" : "Accounts");?></span>
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
						<a class = 'inactive page-loader box-entry link0113' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "একাউন্ট লেজার" : "A/C Ledger");?></span>
						</a>
					</li>
					<li>
						<a class = 'inactive page-loader box-entry link0136' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "একাউন্ট ব্যালেন্স" : "A/C Balance");?></span>
						</a>
					</li>
					<? if($loan_solved){ ?>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0224' href="#">
							<i class = 'fa fa-square-o'></i><span><?php echo($lang ?  "ঋণের তথ্য " : "Loan statement");?></span>
						</a>
					</li>
					<? } ?>
					<? if(0){ ?>
					<li>
						<a class = 'inactive page-loader box-entry link0118' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "প্রস্তাবিত চেকের তথ্য" : "Proposed Advance Cheque");?></span>
						</a>
					</li>

					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0119' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "প্রস্তাবিত ক্যাশ / ব্যাংক তথ্য" : "Proposed Cash / Bank Statement");?></span>
						</a>
					</li>

					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0123' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "প্রস্তাবিত গ্রহনের তথ্য" : "Proposed receive Statement");?></span>
						</a>
					</li>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0122' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "প্রস্তাবিত প্রদানের তথ্য" : "Proposed Pay Statement");?></span>
						</a>
					</li>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0121' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "প্রস্তাবিত ব্যাংক তথ্য" : "Proposed Bank Statement");?></span>
						</a>
					</li>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0120' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "প্রস্তাবিত ক্যাশ তথ্য" : "Proposed Cash Statement");?></span>
						</a>
					</li>
					<? } ?>
					
				</ul>
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
