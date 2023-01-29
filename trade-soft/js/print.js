$(document).on('click','span.print-report',function(){

	var pt = $(this).parents("div.box:first");
	$tr = pt.find("table.report-table tbody tr:not(.not-for-print)");
	$th = pt.find("table.report-table thead tr");
	$tf = pt.find("table.report-table tfoot tr");

	var flag_print_header = false;
	var flag_print_footer = false;
	var page_header_flag = false;

	var te = "";
	
	if(pt.find("table.report-ender:eq(0)").length){
		te = pt.find("table.report-ender:eq(0)").html()
		flag_print_footer = true;
	}	

	if(pt.find("table.report-table thead tr").length){
		page_header_flag = true;
	}	
	
	
	console.log("Starting");
	var i = 0;
	var header = "";
	
	if(pt.find("table.report-head:first").length){
		header = pt.find("table.report-head:first").html();
		flag_print_header = true ;
	}

	var num = Number($(this).parent("div.input-group:first").find("input:first").val());;
	var k = Number(Number($tr.length)/num);
	var l = 0;
	

         var mywindow = window.open('', 'print-page',  'width=980px');
		   var content = "<html><head><title>my div</title>";
			content = content + "<link rel='stylesheet' href='css/print.css'>";
			content = content + "</head><body align = 'center' onload='window.print(); window.close();' ><div id = 'content' style = 'text-align:center;'>";

		
        $tr.each(function(){
			console.log("Each row of body");
        	if(i == 0){
        		
        		   k--;
        		   
        		   if(flag_print_header){
        		   	console.log("Adding header 0" + header );
        		   	content = content + "<table class = 'head' width='100%'>"+header+"</table>";
        		   }
		        

		        if(k>0){
		        	content  = content + "<table class = 'table-report-body' border = '1px' style='page-break-after:always' width='100%' >";	
			     }
		        else{
		        	content  = content + "<table class = 'table-report-body' border = '1px' width='100%' >";
			     }
			     
			     if(page_header_flag){
			      	console.log("Adding header of report "  );
			      	content  = content + "<thead><tr>"+$th.html()+"</tr></thead>";
			      }
				   
		        content  = content + "<tbody>";

	       }
	       if($(this)){
	       	console.log("Adding row of report " + (l++) );
	       	content  = content + "<tr width='100%'>"+$(this).html()+"</tr>";
	       }
        	
        	if(i == num - 1){
				content  = content + "</tbody>";
				content  = content + "<tfoot><tr>"+$tf.html()+"</tr></tfoot>";
				content  = content + "</table>";
        		i=0;	
	        	}
        	else{
        		i++;
        		}
        	
        });
        
		
		content  = content + "</tbody>";
		if($tf.length){
		  console.log("Adding page footer " + $tf.html() );
        content  = content + "<tfoot><tr>"+$tf.html()+"</tr></tfoot>";
      }
        content  = content + "</table>";
      if(te.length){
      			console.log("Adding report footer " + te );
      	      content  = content + "<table>"+te+"</table>";
      }  
		        
        
        
		content  = content + '</div>';
			
		content  = content + "<div style='font-family:Helvetica, Arial, Verdana, sans-serif; font-size:15px;'>সফটওয়্যার প্রস্তুতকারকঃ ইউনিক ওয়েবার্স লিমিটেড, ওয়েবসাইটঃ www.uniquewebers.com, মোবাইলঃ ০১৭৭৭৭-৪৩-৭০৩  </div>";
		content  = content + '</body>';

		content  = content +  "</html>";        
	 
		mywindow.document.write(content + "<script type = 'text/javascript'> window.print(); window.close(); </script>");


		
});





$(document).on('click','button.print-money-recipt',function(){
	 var pt = $(this).parents("div.box:first");
         var mywindow = window.open('', 'print-page',  'width=980px');
		   var content = "<html><head><title>my div</title>";
			content = content + "<link rel='stylesheet' href='css/mine.css'>";
			content = content + "</head><body align = 'center' onload='window.print(); ' ><div id = 'content' style = 'text-align:center;'>";
		content = content + pt.find("table.recipt:first").html();

		content  = content + '</div></body>';
		content  = content +  "</html>"; 

		mywindow.document.write(content + "<script type = 'text/javascript'> window.print(); window.close(); </script>");	

});
$(document).on('click','button.print-chalan-secial',function(){

	 var pt = $(this).parents("div.box:first");
         var mywindow = window.open('', 'print-page',  'width=980px');
		   var content = "<html><head><title>my div</title>";
			content = content + "<link rel='stylesheet' href='css/mine.css'>";
			content = content + "</head><body align = 'center' onload='window.print(); ' ><div id = 'content' style = 'text-align:center;'>";
		content = content + pt.find("div#page_print_211").html();

		content  = content + '</div></body>';
		content  = content +  "</html>"; 

		mywindow.document.write(content + "<script type = 'text/javascript'> window.print(); window.close(); </script>");	
});


$(document).on('click','button.print-bill-secial',function(){

	 var pt = $(this).parents("div.box:first");
         var mywindow = window.open('', 'print-page',  'width=980px');
		   var content = "<html><head><title>my div</title>";
			content = content + "<link rel='stylesheet' href='css/mine.css'>";
			content = content + "</head><body align = 'center' onload='window.print(); ' ><div id = 'content' style = 'text-align:center;'>";
		content = content + pt.find("div#page_print_306").html();

		content  = content + '</div></body>';
		content  = content +  "</html>"; 

		mywindow.document.write(content + "<script type = 'text/javascript'> window.print();   </script>");	
});




