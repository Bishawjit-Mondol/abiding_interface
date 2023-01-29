function purchase_ammount_calculate(fg,div,id){
	
	
	$st = div.find("span.product-purchase-type");
	var pipe = 0.00;
	var fitt = 0.00;
	$st.each(function(){
		//console.log($(this).html());
		if($(this).html() == '1' ){
			
			pipe = Number(pipe)+(Number($(this).parents("div.form-group:first").find("input.sub_tot:first").val()));
		}
		if($(this).html() == '2' ){
			fitt = Number(fitt)+(Number($(this).parents("div.form-group:first").find("input.sub_tot:first").val()));
		}
		
	});


	var pd = div.find("input.purchase_discount_pp:first").val();
	var fd = div.find("input.purchase_discount_ft:first").val();
	
	var trs = Number(div.find("input.purchase_trns:first").val()).toFixed(2);
	var pdis = Number((pipe/100)*pd).toFixed(2);
	var fdis = Number((fitt/100)*fd).toFixed(2); 

	//alert( fg.find("input.sub_tot:first").val() );
	//alert(pipe+fitt);
	
	div.find("input.purchase_total:first").val(Number(pipe+fitt).toFixed(2));
	div.find("span#pipe-discount-rate-show").html(Number(pd).toFixed(2)+"%");
	div.find("span#fitt-discount-rate-show").html(Number(fd).toFixed(2)+"%");
	div.find("td.purchase-f-subtp").html(Number(pipe).toFixed(2));
	div.find("td.purchase-f-subf").html(Number(fitt).toFixed(2));
	div.find("td.purchase-f-trp").html(Number(trs).toFixed(2));
	
	div.find("td.purchase-f-pdis").html(pdis);
	
	div.find("td.purchase-f-fdis").html(fdis);
	

	
	print_total2(fg,div,id);
	
	
	
	
	
}
function print_total2(fg,div,id){
	pipe = Number(div.find("td.purchase-f-subtp").html());
	fitt = Number(div.find("td.purchase-f-subf").html());
	trs = Number(div.find("td.purchase-f-trp").html());
	
	pdis = div.find("td.purchase-f-pdis").html();
	fdis = div.find("td.purchase-f-fdis").html();
	
	
	var total = Number( Number(pipe) + Number(fitt) + Number(trs) - Number(pdis) - Number(fdis)).toFixed(2);
	
	
	
	div.find("label.purchase-f-ar").html(total);


	
}
$(document).on('change','input.ini_sec_purchase_change',function(){
	var fg = $(this).parents("div.form-group:first");
	var div = $(this).parents("div.row.window:first");
	var id = div.attr('id');
	purchase_ammount_calculate(null,div,null);
	
});




function initiate_change2(fg, div, id){

	var price = Number(fg.find("input.purchase_quantity:eq(0)").val())*Number(fg.find("input.product-mrp,input.product-mpp:eq(0)").val());
	
	fg.find("input.sub_tot:eq(0)").val(price.toFixed(2)); //alert( 'pp '+price );

	fg.next().find("input,select").removeAttr('disabled');

	fg.next().removeClass('hidden');
	$next = fg.next().find("select:eq(0)");
	$next.addClass("product");
	if($next.find("option").length == 0){
		loadSelectorProduct($next);
	}

	purchase_ammount_calculate(fg,div,id);

}

$(document).on('keyup','.purchase-data',function(){

	var fg = $(this).parents("div.form-group:first");
	var div = $(this).parents("div.row.window:first");
	var id = div.attr('id');
	initiate_change2(fg, div, id);

});


