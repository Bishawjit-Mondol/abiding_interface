function sales_ammount_calculate(fg,div,id){
	
	
	$st = div.find("span.product-sales-type");
	var pipe = 0.00;
	var fitt = 0.00;

	$st.each(function(){
		if($(this).html() == '1' ){
			
			
			pipe = Number(pipe)+(Number($(this).parents("div.form-group:first").find("input.sub_tot:first").val()));
		}
		if($(this).html() == '2' ){
			fitt = Number(fitt)+(Number($(this).parents("div.form-group:first").find("input.sub_tot:first").val()));
		}
		
	});

	var pd = div.find("input.sales_discount_pp:first").val();
	var fd = div.find("input.sales_discount_ft:first").val();
	
	var trs = Number(div.find("input.sales_trns:first").val()).toFixed(2);
	var pdis = Number((pipe/100)*pd).toFixed(2);
	var fdis = Number((fitt/100)*fd).toFixed(2);
	
	div.find("input.sales_total:first").val(Number(pipe+fitt).toFixed(2));
	div.find("span#pipe-discount-rate-show").html(Number(pd).toFixed(2)+"%");
	div.find("span#fitt-discount-rate-show").html(Number(fd).toFixed(2)+"%");
	div.find("td.sales-f-subtp").html(Number(pipe).toFixed(2));
	div.find("td.sales-f-subf").html(Number(fitt).toFixed(2));
	div.find("td.sales-f-trp").html(Number(trs).toFixed(2));
	
	div.find("td.sales-f-pdis").html(pdis);
	
	div.find("td.sales-f-fdis").html(fdis);
	

	
	print_total(fg,div,id);
	
	
	
	
	
}
function print_total(fg,div,id){
	pipe = Number(div.find("td.sales-f-subtp").html());
	fitt = Number(div.find("td.sales-f-subf").html());
	trs = Number(div.find("td.sales-f-trp").html());
	
	pdis = div.find("td.sales-f-pdis").html();
	fdis = div.find("td.sales-f-fdis").html();
	
	
	var total = Number( Number(pipe) + Number(fitt) + Number(trs) - Number(pdis) - Number(fdis)).toFixed(2);
	
	
	div.find("label.sales-f-ar").html(total);

}
$(document).on('change','input.ini_sec_sales_change',function(){
	var fg = $(this).parents("div.form-group:first");
	var div = $(this).parents("div.row.window:first");
	var id = div.attr('id');
	sales_ammount_calculate(null,div,null);
	
});




function initiate_change(fg, div, id){
	
	var price = Number(fg.find("input.sales_quantity:eq(0)").val())*Number(fg.find("input.product-mrp,input.product-mpp:eq(0)").val());
	
	fg.find("input.sub_tot:eq(0)").val(price.toFixed(2));   //alert( 'ss '+price ); 
	
	fg.next().removeClass('hidden');
	fg.next().find("input,select").removeAttr('disabled');

	$next = fg.next().find("select:eq(0)");
	$next.addClass("product");

	if($next.find("option").length == 0){
		loadSelectorProduct($next);
	}

	sales_ammount_calculate(fg,div,id);

}

$(document).on('keyup','.sales-data',function(){

	var fg = $(this).parents("div.form-group:first");
	var div = $(this).parents("div.row.window:first");
	var id = div.attr('id');
	initiate_change(fg, div, id);

});

$(document).on('change','.discount-sales-changer',function(){
		
		var enc = $("span#enc").html();
		var lang = $("span#ln").html();
		var target = '0811';
		var pr = Number($(this).val());
		
		if(pr != 0){
			var s_url = "index.php?mother_call=ok&e="+enc+"&page=0000&sub="+target+"&ln="+lang+"&&gb=0&&pr="+pr;
			  $.ajax({
				url: s_url,
				type: "POST",

				data: "ab=ok",
				success:function(msg){
					cl = eval(msg);
					$("input.sales_discount_ft").val(cl[1]['fittings']);
					$("input.sales_discount_pp").val(cl[0]['pipe']);
					
				},
				complete:function(){
				
				}	
			});
		}
});



