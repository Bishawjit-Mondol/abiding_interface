            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p><? echo  ($lang ? "হ্যালো, " : "Hello, ").$name; ?></p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form class="sidebar-form" <form onSubmit="return false;" style = 'display:none'>
                        <div class="input-group">
                            <input type="text" name="search_query" id = "search_query" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='button' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">


<li class="treeview treeview main-tree sugesstion-tree"  >
	<a href="#">
		<i class="fa fa-wrench"></i>
		<span><?=($lang ? "ব্যাবস্থা" : "Settings");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">

		<li>
                            <a class = 'inactive' href="#" id = 'switch-button' >
                                <i class="fa fa-dashboard"></i> <span data-mode = '1' ><?php echo ($lang ? "তারিখ নির্বাচন" : "Date Selection"); ?></span>
                            </a>

		</li>

		<li>
                            <a class = 'inactive' href="#" id = 'switch-collapse' >
                                <i class="fa fa-arrows-v"></i> <span data-mode = '0' ><?php echo ($lang ? "অাকার উল্টে দাও" : "Invert Window"); ?></span>
                            </a>

		</li>
		<li>
                            <a class = 'inactive' href="index.php?e=<?php echo 	$encptid; ?>&&ln=<?php if($lang=='1'){ echo '0'; } else{ echo '1'; } ?>" id = 'switch-lang' >
                                <i class="fa fa-book"></i> <span data-mode = '0' ><?php echo ($lang ? "ইংরেজী ভাষা" : "Bangla Language"); ?></span>
                            </a>

		</li>
		<li>
                            <a class = 'inactive' href="#" id = 'switch-mn-col' >
                                <i class="fa fa-chevron-circle-up"></i> <span data-mode = '0' ><?php echo ($lang ? "সাবম্যেনু বন্ধ কর" : "Close Submenu"); ?></span>
                            </a>
                            

		</li>


	</ul>
</li>   
‌<? // MENU BEAGUN FROM THERE ----------------------------------------------------------------------------------------------- ?>                        
<? include '_private/inc/software_menu.php'; ?>
<? // MENU END THERE ----------------------------------------------------------------------------------------------- ?>                                                
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

