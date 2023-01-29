<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /* Sugession menu Start  */ ?>



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
					<span><?=($lang ? "পদক্ষেপ" : "Action");?></span>
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">

					<li>
						<a class = 'inactive page-loader box-entry link0002' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "কর্মকর্তা / কর্মচারী যোগ করুন" : "Add Employee");?></span>
						</a>

					</li>
					<li>
						<a class = 'inactive page-loader box-entry link0300' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "পাওনা অনুমোদন করুন" : "Add Payable");?></span>
						</a>

					</li>
				    

					<li>
						<a class = 'inactive page-loader box-entry link0003' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "পদবী যোগ করুন" : "Add Post");?></span>
						</a>

					</li>
					<li>
						<a class = 'inactive page-loader box-entry  link0304' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "কর্মকর্তা / কর্মচারী সংশোধন" : "Edit Employee");?></span>
						</a>
					</li>
					<li>
						<a class = 'inactive page-loader box-entry  link0155' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "কর্মকর্তা / কর্মচারীর তালিকা" : "Employee List");?></span>
						</a>
					</li>
				</ul>
		</li>


		<li class="treeview sugesstion-tree"  >
				<a href="#">
					<i class="fa fa-bar-chart-o"></i>
					<span><?=($lang ? "রিপোর্ট" : "Report");?></span>
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">

					<li>
						<a class = 'inactive page-loader box-entry link0140' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "খতিয়ান" : "Ledger");?></span>
						</a>
					</li>
					<li>
						<a class = 'inactive page-loader box-entry link0256' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "ব্যালেন্স" : "Balance");?></span>
						</a>
					</li>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0223' href="#">
							<i class = 'fa fa-square-o'></i><span><?php echo($lang ?  "কর্মচারীর বিক্রয় তথ্য " : "Emp. Sales Statement");?></span>
						</a>
					</li>
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
