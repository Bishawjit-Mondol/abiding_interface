
function discount_change( id ){
	var rt =	$("div#"+id).find("input.purchase_discount_rt:first").val();
	if(Number(rt)<0){
		$(this).val(0.00);
		rt = 0;
	}
	var st =	$("div#"+id).find("input.purchase_total:first").val()
	var da = (st/100)*rt;
	$("div#"+id).find("input.purchase_discount:first").val(da.toFixed(2));

}

function purchase_finalization(id){
	var st = $("div#"+id).find("input.purchase_total:first").val();
	var dr = $("div#"+id).find("input.purchase_discount_rt:first").val();
	var da = $("div#"+id).find("input.purchase_discount:first").val();
	var tc = $("div#"+id).find("input.purchase_trns:first").val();
	var tot = Number(st)-Number(da)+Number(tc);
	$("div#"+id).find("td.purchase-f-subt:first").html(st);
	$("div#"+id).find("span.purchase-f-disr:first").html(dr);
	$("div#"+id).find("td.purchase-f-dis:first").html(da);
	$("div#"+id).find("td.purchase-f-trp:first").html(tc);

	$("div#"+id).find("label.purchase-f-ar:first").html(tot);
}
function calculate_purchase_charge(id){

	var total = 0.00;
	$row = $("div#"+id).find("div.purchase-data-form");
	$row.each(function(){
		total = Number(total) + Number($(this).find("input.sub_tot:first").val());
	});
	$("div#"+id).find("input.purchase_total:first").val(total.toFixed(2));
	discount_change(id);	
	purchase_finalization(id)
}

$(document).on('change','.purchase-data',function(){
	var fg = $(this).parents("div.form-group:first");
	var div = $(this).parents("div.row.window:first");
	var id = div.attr('id');
	var price = Number(fg.find("input.purchase_quantity:eq(0)").val())*Number(fg.find("input.product-mpp:eq(0)").val());
	fg.find("input.sub_tot:eq(0)").val(price.toFixed(2));
	
	fg.next().removeClass('hidden');
	fg.next().find("input,select").removeAttr('disabled');

	calculate_purchase_charge(id);
});


$(document).on('change','input.purchase_trns',function(){

	var div = $(this).parents("div.row.window:first");
	var id = div.attr('id');

	purchase_finalization(id);
});
$(document).on('change','input.purchase_discount_rt',function(){
	var div = $(this).parents("div.row.window:first");
	var id = div.attr('id');
	discount_change( id );
	purchase_finalization(id);
		
});
