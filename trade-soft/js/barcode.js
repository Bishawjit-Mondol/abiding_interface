$(document).on('keyup','input.barcode-input',function(e){
	var p = e.which;

	if(p == '13'){
		var a = $(this).val();
			
		$row = $(this).parents("div.form-group:first");
		$row.find("select.product:first").val(a);
		
		if( $row.find("select.product:first").val() > 0 ){
			$row.find("input.sales_quantity:first").val(1);
			product_id = a;
			loadProductDetails($row,product_id);
			
			/* to select price & quantity */
			var div = $(this).parents("div.row.window:first");
			var id = div.attr('id');
			initiate_change($row, div, id);
		
			/* End to select price & quantity */
			
			/* To select Next lines 1st row */
			$(this).parents("div.form-group:first").next("div.form-group").find("input:eq(0)").focus();
			
		}
		else{
			alert("This product does not enlisted");
		}
		
		
	}
});

$(document).on('keyup','input.barcode-input-mpp',function(e){
	var p = e.which;

	if(p == '13'){
		var a = $(this).val();
			
		$row = $(this).parents("div.form-group:first");
		$row.find("select.product:first").val(a);
		
		if( $row.find("select.product:first").val() > 0 ){
			$row.find("input.sales_quantity:first").val(1);
			product_id = a;
			loadProductDetails($row,product_id);
			
			/* to select price & quantity */
			var div = $(this).parents("div.row.window:first");
			var id = div.attr('id');
			initiate_change_mpp($row, div, id);
		
			/* End to select price & quantity */
			
			/* To select Next lines 1st row */
			$(this).parents("div.form-group:first").next("div.form-group").find("input:eq(0)").focus();
			
		}
		else{
			alert("This product does not enlisted");
		}
		
		
	}
});