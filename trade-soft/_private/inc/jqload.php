<script type = 'text/javascript'>
	    var animationType = Array('slide','swing');
		var animationDef = animationType[0];	
		function reverseValue(data){
			if(Number(data)==1){
				return 0;
			}
			return 1;
		}
		
		function reverseAttrValue($obj,atr){
			$obj.attr(atr,reverseValue($obj.attr(atr)));
		}
		
		function toggleUpperPanel(){
			// To toggle Upper Panel
			$span = $("#switch-button").find("span:eq(0)");
			if( $span.attr('data-mode') == '1'){
				$span.html('Show Glance-Bar');
			}
			else{
				$span.html('Hide Glance-Bar');
			}
			$("div.row.switch-hook").toggle(animationDef,1500);
			reverseAttrValue($span,'data-mode');
			
		}

</script>
<?
	$query = "SELECT idproduct_catagory, product_catagory_name FROM product_catagory p WHERE product_catagory_salesable = 1;";
	$det = $qur->custom_select_query($query);
?>

        <script src="js/jqueryl.js"></script>
        <!-- jQuery UI 1.10.3 -->
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script src="js/geoPosition.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/geoPositionSimulator.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/map.js" type="text/javascript" charset="utf-8"></script>

        <script src="js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <script src="js/client-supplier-load.js" type="text/javascript"></script>  
        <script src="js/product-load.js" type="text/javascript"></script>
        <script src="js/staff-load.js" type="text/javascript"></script>

        <script src="js/submission.js" type="text/javascript"></script>          
        <script src="js/pestablishment-load.js" type="text/javascript"></script> 
        <script src="js/load-report.js" type="text/javascript"></script>
        <script src="js/bank-load.js" type="text/javascript"></script>
        <script src="js/transaction.js" type="text/javascript"></script>      
        <script src="js/transaction-head-load.js" type="text/javascript"></script>      
        <script src="js/cash-bank-load.js" type="text/javascript"></script>      
        <script src="js/search.js" type="text/javascript"></script>
  

        <script src="js/sales.js" type="text/javascript"></script>
        <script src="js/purchase.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Morris.js charts -->
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="js/plugins/morris/morris.min.js" type="text/javascript"></script>
        <!-- Sparkline -->
        <script src="js/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
        <!-- jvectormap -->
        <script src="js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
        <script src="js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
        <!-- fullCalendar -->
        <script src="js/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
        <!-- jQuery Knob Chart -->
        <script src="js/plugins/jqueryKnob/jquery.knob.js" type="text/javascript"></script>
        <!-- daterangepicker -->
        <script src="js/plugins/daterangepicker/daterangepicker_p.js" type="text/javascript"></script>
        <script src="js/plugins/daterangepicker/moment.js" type="text/javascript"></script>
        
        <!-- Bootstrap WYSIHTML5 -->
        <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
        <!-- iCheck -->
        <script src="js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
		<script src="js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>
        
        <!-- Edit product-->
        <script src="js/edit-product.js" type="text/javascript"></script>
        <!-- Edit product-->
		
        <script src="js/jquery-scrollto.js" type="text/javascript"></script>
        <script src="js/dateRegister.js" type="text/javascript"></script>
        <script src="js/conf_dateregister.js" type="text/javascript"></script>
        <script src="js/print.js" type="text/javascript"></script>
        <script src="js/custom.js" type="text/javascript"></script>
        <script src="js/barcode.js" type="text/javascript"></script>
        
        <script type="text/javascript">
          datePickerRegister("#reportrange",$("#ln").html(),true);
		  $('#entryday').daterangepicker({ singleDatePicker: true, format: 'DD-MM-YYYY' });
          
          datePickerRegister("#reportrange",$("#ln").html(),true);
	  	  $('#entryday').daterangepicker({ singleDatePicker: true, format: 'DD-MM-YYYY' });
          $('#example2').dataTable(
          	{ "bPaginate": false }
          );
          var sales_cats =  $(".catagorical-sales");
          var sales_ret_cats =  $(".catagorical-sales-return");
          var purchase_cats =  $(".catagorical-purchase");
          var prolist_cats =  $(".catagorical-product-list");
          var prostock_cats =  $(".catagorical-product-stock");
          
	  	  <?
	  	  	foreach($det as $d){
		  ?>
		  
		  sales_cats.each(function(){
		    var c = $(this);
		    c.append("<li class = 'menu-label'><a class = 'inactive page-loader box-entry link0031' data='cat_id=<?=$d[0];?>&cat_name=<?=$d[1];?>' href='#'> <i class = 'fa fa-square-o'></i><span><?=$d[1];?></span></a></li>");
		  });

		  sales_ret_cats.each(function(){
		    var c = $(this);
		    c.append("<li class = 'menu-label'><a class = 'inactive page-loader box-entry link0070' data='cat_id=<?=$d[0];?>&cat_name=<?=$d[1];?>' href='#'> <i class = 'fa fa-square-o'></i><span><?=$d[1];?></span></a></li>");
		  });

		  purchase_cats.each(function(){
		    var c = $(this);
		    c.append("<li class = 'menu-label'><a class = 'inactive page-loader box-entry link0030' data='cat_id=<?=$d[0];?>&cat_name=<?=$d[1];?>' href='#'> <i class = 'fa fa-square-o'></i><span><?=$d[1];?></span></a></li>");
		  });

		  prolist_cats.each(function(){
		    var c = $(this);
		    c.append("<li class = 'menu-label'><a class = 'inactive page-loader box-entry link0801' data='cat_id=<?=$d[0];?>&cat_name=<?=$d[1];?>' href='#'> <i class = 'fa fa-square-o'></i><span><?=$d[1];?></span></a></li>");
		  });
		  prostock_cats.each(function(){
		    var c = $(this);
		    c.append("<li class = 'menu-label'><a class = 'inactive page-loader box-entry link0802' data='cat_id=<?=$d[0];?>&cat_name=<?=$d[1];?>' href='#'> <i class = 'fa fa-square-o'></i><span><?=$d[1];?></span></a></li>");
		  });
	  	  
		  <?	  	  		
	  	  	}
	  	  ?>
	  	  
		  setTimeout( function(){ toggleUpperPanel(); } , 1 );			  	  
		</script>
