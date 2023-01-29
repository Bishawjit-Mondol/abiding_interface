

$(document).on('change','.editable-product',function(){
	var pro = $(this).val();
	$tr = $("#product-row-"+pro);
	
	$(this).parents("form:first").find("input.product_name:first").val( $tr.find("td:eq(1)").html());
	$(this).parents("form:first").find("input.product_mrp:first").val( $tr.find("td:eq(2)").html());
	$(this).parents("form:first").find("input.product_mpp:first").val( $tr.find("td:eq(3)").html());

});

