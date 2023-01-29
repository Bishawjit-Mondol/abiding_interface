
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /* Sayem menu start  */ ?>


<li class="treeview main-tree">
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "বিক্রয় খাতা" : "Sayem");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0113' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Cash / Bank Statement");?></span>
						</a>
					</li>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0112' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Add Cheque Leaf");?></span>
						</a>
					</li>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0008' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Add Bank Account");?></span>
						</a>
					</li>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0109' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Edit Purchase Return");?></span>
						</a>
					</li>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0108' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Purchase Return");?></span>
						</a>
					</li>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0110' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Edit Sales Return");?></span>
						</a>
					</li>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0070' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Sales Return");?></span>
						</a>
					</li>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0107' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Edit Purchase");?></span>
						</a>
					</li>
					<li class = 'menu-label'>
						<a class = 'inactive page-loader box-entry link0106' href="#">
							<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Edit Order");?></span>
						</a>
					</li>
					<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0105' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Fund Transfer");?></span>
					</a>
					</li>
					<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0104' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "New Incentive Receiver");?></span>
					</a>
					</li>
					<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0103' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Add New Lender");?></span>
					</a>
					</li>
					<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0102' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Add New Loan");?></span>
					</a>
					</li>
					<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0100' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Edit Transaction");?></span>
					</a>
					</li>
					<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0101' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "--" : "Loan Transaction");?></span>
					</a>
					</li>		
	</ul>

</li>   


<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* Sayem menu end  */ ?>


<? /*sales order menu begain  */ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<li class="treeview main-tree">
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "" : "Sales Order");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "New Order");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0031' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "All Product");?></span>
					</a>
				</li>	

				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0211' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Sales BILL / INVOICE");?></span>
					</a>
				</li>	
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0212' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Purchase BILL / INVOICE");?></span>
					</a>
				</li>	
				
				<li class="treeview">
					<a href="#" class = 'inactive'>
						<i class="fa fa-square"></i><span><?=($lang ? "" : "Category Wise");?></span><i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu catagorical-sales">
					</ul>			
				</li>                            	
			</ul>			
		</li>  
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Report");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0072' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Order Receive");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0024' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Order Delivered");?></span>
					</a>
				</li>					

			</ul>			
		</li>  
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Action");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0072' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Confirm Order");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Edit Order");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Delete Order");?></span>
					</a>
				</li>					
				
			</ul>			
		</li>  

	</ul>

</li>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /*sales order menu end  */ ?>




<? /*sales book menu start  */ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<li class="treeview main-tree">
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "" : "Sales Book");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Sales Return");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0070' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "All Product");?></span>
					</a>
				</li>					
				<li class="treeview">
					<a href="#" class = 'inactive'>
						<i class="fa fa-square"></i><span><?=($lang ? "" : "Category Wise");?></span><i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu catagorical-sales-return">
					</ul>			
				</li>                            	
			</ul>			
		</li>  
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "History");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Sales History");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Sales Return History");?></span>
					</a>
				</li>					

			</ul>			
		</li>  

		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Report");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Statement");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Monthly Statement");?></span>
					</a>
				</li>					

				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Summary");?></span>
					</a>
				</li>					

			</ul>			
		</li>  
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Graph");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Party-Wise");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Product-Wise");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Ratio");?></span>
					</a>
				</li>					

			</ul>			
		</li>  

	</ul>

</li>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /*sales book menu end  */ ?>


<? /*Purchase book menu start  */ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<li class="treeview main-tree">
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "" : "Purchase Book");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "New Order");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a  class = 'inactive page-loader box-entry link0030' href="#" >
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "All Product");?></span>
					</a>
				</li>					
				<li class="treeview">
					<a href="#" class = 'inactive'>
						<i class="fa fa-square"></i>
							<span><?=($lang ? "" : "Category Wise");?></span>
							<i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu catagorical-purchase">
					</ul>			
				</li>                            	
			</ul>			
		</li>  
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "History");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Purchase");?></span>
					</a>
				</li>
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Transaction");?></span>
					</a>
				</li>

			</ul>			
		</li>  

		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Report");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0068' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Proposed Order ");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Statement");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Monthly Statement");?></span>
					</a>
				</li>					

				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Total Purchase Summary");?></span>
					</a>
				</li>					

			</ul>			
		</li>  

	<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Action");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0068' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Confirm Order");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Edit Order");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Delete Order");?></span>
					</a>
				</li>					
				
			</ul>			
		</li> 

		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Graph");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Party-Wise");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Product-Wise");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Ratio");?></span>
					</a>
				</li>					

			</ul>			
		</li>  

	</ul>

</li>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /*purchase book menu end  */ ?>




<? /* stock book menu start  */ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<li class="treeview main-tree">
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "" : "Stock Book");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "List");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0801' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "All Product");?></span>
					</a>
				</li>					
				<li class="treeview">
					<a href="#" class = 'inactive'>
						<i class="fa fa-square"></i><span><?=($lang ? "" : "Category Wise");?></span><i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu catagorical-product-list">
					</ul>			
				</li>                            	
			</ul>			
		</li>  
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Report");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0802' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "All Product");?></span>
					</a>
				</li>					
				<li class="treeview">
					<a href="#" class = 'inactive'>
						<i class="fa fa-square"></i><span><?=($lang ? "" : "Category Wise");?></span><i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu catagorical-product-stock">
					</ul>			
				</li>                            	
			</ul>		
		</li>  

		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Add");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0022' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Stock Transfer");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0021' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Stock Adjustment");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0012' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Product");?></span>
					</a>
				</li>					

				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0005' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Product Type");?></span>
					</a>
				</li>	
				
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0004' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Product Unite");?></span>
					</a>
				</li>					
				

			</ul>			
		</li>  
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Action");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>

			<ul class="treeview-menu">

				<li class="treeview">
					<a href="#" class = 'inactive'>
						<i class="fa fa-square"></i>
							<span><?=($lang ? "" : "Confirm");?></span>
							<i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li class = 'menu-label'>
							<a class = 'inactive page-loader box-entry link0000' href="#">
								<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Transfer");?></span>
							</a>
						</li>	
						<li class = 'menu-label'>
							<a class = 'inactive page-loader box-entry link0000' href="#">
								<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Adjustment");?></span>
							</a>
						</li>	
					</ul>			
				</li>    




				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Edit product");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Delete Product");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Dlete Unite");?></span>
					</a>
				</li>					

			</ul>			
		</li>  

	</ul>

</li>


<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /* stock book menu end  */ ?>





<? /* Supplier / Client Book */ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<li class="treeview main-tree">
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "" : " Supplier / Client Book");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "List");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a  class = 'inactive page-loader box-entry link0202' href="#" >
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Client List");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a  class = 'inactive page-loader box-entry link0203' href="#" >
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Supplier List");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a  class = 'inactive page-loader box-entry link0205' href="#" >
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Incentive Receiver List");?></span>
					</a>
				</li>	            	
			</ul>			
		</li>  
		
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Report");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0068' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Ledger");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Client Balance");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Client sales statement");?></span>
					</a>
				</li>					

				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Supplier purchase statement");?></span>
					</a>
				</li>					

			</ul>			
		</li>  
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Action");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0001' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "New Client");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "New Supplier");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "New Incentive Receiver");?></span>
					</a>
				</li>					

			</ul>			
		</li> 

		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Graph");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
									
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Client balance");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Supplier balance");?></span>
					</a>
				</li>					

			</ul>			
		</li>  

	</ul>

</li>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /*  Supplier / Client Book End */ ?>



<? /* Admin */ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<li class="treeview main-tree">
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "" : " Admin");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "List");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a  class = 'inactive page-loader box-entry link0207' href="#" >
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Employee List");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a  class = 'inactive page-loader box-entry link0208' href="#" >
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Designation List");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a  class = 'inactive page-loader box-entry link0205' href="#" >
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Incentive Receiver List");?></span>
					</a>
				</li>	            	
			</ul>			
		</li>  
		
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Report");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
									
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Employee Balance");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0068' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Employee Ledger");?></span>
					</a>
				</li>
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Employee Sallary Sheet");?></span>
					</a>
				</li>					

				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Sales Incentive Ledger");?></span>
					</a>
				</li>					

			</ul>			
		</li>  
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Action");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0001' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "New Client");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "New Supplier");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "New Incentive Receiver");?></span>
					</a>
				</li>					

			</ul>			
		</li> 

		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Graph");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
									
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Client balance");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Supplier balance");?></span>
					</a>
				</li>					

			</ul>			
		</li>  

	</ul>

</li>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /*  Admin End */ ?>

       

<? /* Account */ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<li class="treeview main-tree">
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "" : " Accounts ");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "List");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a  class = 'inactive page-loader box-entry link0209' href="#" >
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Cash/Bank List");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a  class = 'inactive page-loader box-entry link0210' href="#" >
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Transaction head List");?></span>
					</a>
				</li>					
				    	
			</ul>			
		</li>  
		
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Report");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0068' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Proposed Transaction");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "A/C Balance");?></span>
					</a>
				</li>	
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0113' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "A/C Ledger");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0114' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Payment statement");?></span>
					</a>
				</li>					

				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0115' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Receive Statement");?></span>
					</a>
				</li>	
				
				
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0116' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Cash Statement");?></span>
					</a>
				</li>					
				
				
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0117' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Bank Statement");?></span>
					</a>
				</li>					

				
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Head-wise Statement");?></span>
					</a>
				</li>					

				
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Loan Statement");?></span>
					</a>
				</li>	

				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Advance Cheque Details");?></span>
					</a>
				</li>										

			</ul>			
		</li>  
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Action");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			
			   <ul class="treeview-menu">	
				<li class="treeview">
					<a href="#" class = 'inactive'>
						<i class="fa fa-square"></i>
							<span><?=($lang ? "" : "Add");?></span>
							<i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li class="treeview">
							<a href="#" class = 'inactive'>
								<i class="fa fa-square"></i>
									<span><?=($lang ? "" : "Transaction");?></span>
								<i class="fa fa-angle-left pull-right"></i>
							</a>
			
			  			    <ul class="treeview-menu">	
							<li class="treeview">
								<a class = 'inactive page-loader box-entry link0017' href="#">
									<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "With supplier");?></span>
								</a>
							</li>	
							<li class="treeview">
								<a class = 'inactive page-loader box-entry link0111' href="#">
									<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "With Client");?></span>
								</a>
							</li>	
								
							<li class="treeview">
								<a class = 'inactive page-loader box-entry link0018' href="#">
									<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "With Employee");?></span>
								</a>
							</li>	
						
							<li class="treeview">
								<a class = 'inactive page-loader box-entry link0019' href="#">
									<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "With Director");?></span>
								</a>
							</li>	
						
							<li class="treeview">
								<a class = 'inactive page-loader box-entry link0000' href="#">
									<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "With Sales Commission");?></span>
								</a>
							</li>	
							
							<li class="treeview">
								<a class = 'inactive page-loader box-entry link0000' href="#">
									<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "For Loan");?></span>
								</a>
							</li>	

							<li class="treeview">
								<a class = 'inactive page-loader box-entry link0000' href="#">
									<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "For Fund Transfer");?></span>
								</a>
							</li>	
						    </ul>

						</li>	

						<li class="treeview">
								<a class = 'inactive page-loader box-entry link0000' href="#">
									<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Transaction Head ");?></span>
								</a>
							</li>	

						<li class="treeview">
								<a class = 'inactive page-loader box-entry link0007' href="#">
									<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Cash");?></span>
								</a>
							</li>	

						<li class="treeview">
								<a class = 'inactive page-loader box-entry link0008' href="#">
									<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Bank");?></span>
								</a>
							</li>	
					</ul>			
				</li> 
			
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0001' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Edit Transaction");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Cheque Bounced");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Delete Transaction");?></span>
					</a>
				</li>					

			</ul>			
		</li> 

		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Graph");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
									
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "A/C balance");?></span>
					</a>
				</li>					
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "" : "Head-wise Transaction");?></span>
					</a>
				</li>					

			</ul>			
		</li>  

	</ul>

</li>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /* Account End */ ?>



<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /* Loan menu end  */ ?>


<li class="treeview main-tree">
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "বিক্রয় খাতা" : "Loan");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
				<span><?=($lang ? "" : "Add");?></span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#">
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "বিক্রয় " : "Lender");?></span>
					</a>
				</li>					
			</ul>			
		</li>  
		<li class="treeview">
			<a href="#" class = 'inactive'>
				<i class="fa fa-square"></i>
			   <span><?=($lang ? "" : "Report");?></span>
			   <i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu">
				<li class = 'menu-label'>
					<a class = 'inactive page-loader box-entry link0000' href="#"> 
						<i class = 'fa fa-square-o'></i><span><?=($lang ?  "বিক্রয় " : "Ledger");?></span>
					</a>
				</li>
			</ul>			
		</li>  
	</ul>

</li>   


<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* Loan menu end  */ ?>



<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /* Salamn menu Start  */ ?>


<li class="treeview main-tree">
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "বিক্রয় খাতা" : "Salman");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu">
				
	</ul>

</li>   


<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* Salam menu end  */ ?>

<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>          
<? /* Sugession menu Start  */ ?>


<li class="treeview treeview main-tree sugesstion-tree active" style = 'display:none' >
	<a href="#">
		<i class="fa fa-bar-chart-o"></i>
		<span><?=($lang ? "খুজে দেওয়া" : "Search");?></span>
		<i class="fa fa-angle-left pull-right"></i>
	</a>
	<ul class="treeview-menu search-result">


	</ul>

</li>   


<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* ----------------------------------------------------------------------------*/ ?>
<? /* Sugestion menu end  */ ?>
