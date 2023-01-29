var reloadPage = ["0257","0012","0250","0001","0000"];

$.expr[':'].containsIgnoreCase = function (n, i, m) {
            return jQuery(n).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
        };

function reverseWindowState($obj){

	var well = $obj.find("div.well:visible");
	
	if(well.length == 1){
		well.hide(animationDef,1000);
		$obj.find("button.data-collapse:first i:first").removeClass('fa-compress').addClass('fa-expand');
		$obj.find("h3.box-title:first").show();
	}
	else{
		$obj.find("div.well:first").show(animationDef,1000);
		$obj.find("button.data-collapse:first i:first").removeClass('fa-expand').addClass('fa-compress');
		$obj.find("h3.box-title:first").hide();		
		
	}
	
}
function closeWindowState($obj){
	
}
$(document).on('dblclick','div.form-group span.input-group-addon',function(){
	$(this).parents("div.form-group:first").find("div.input-group:not(:eq(0))").toggle('slide');
$(this).parents("div.form-group:first").find("div.input-group:first").find('select,input').toggle('slide');
});

$(document).on('mouseover','li.menu-label',function(){
	$li = $(this);
	$label = $li.find("span:first").html();
	$("#breadcrumb").html("<li>"+$label+"</li>");
	findParentMenu($li);
});	


$(document).on('click','a.inactive',function(e){
	e.defaultPrevented;
});

function findParentMenu($obj){
	$prl = $obj.parents("ul > li:eq(0)");
	
	if($prl.length){
		$("#breadcrumb").prepend("<li>"+$prl.find("span:first").html()+"</li>");
		findParentMenu($prl);
	}
}

$(document).on('click','#switch-collapse',function(){

	$win = $("div.window");
	$win.each(function(){
		reverseWindowState($(this));
	});
});




$(document).on('change','select.product-show-details',function(){

	var	product_id = $(this).val();

	$row = $(this).parents('div.form-group:first');
	if(product_id>0){
		$row.find("span.product-unite").html($("tr#product-row-"+product_id).find("td:eq(4)").html());
		$row.find("input.product-mrp").val($("tr#product-row-"+product_id).find("td:eq(2)").html());
		$row.find("span.product-mrp").html($("tr#product-row-"+product_id).find("td:eq(2)").html());
		$row.find("span.product-sales-type").html($("tr#product-row-"+product_id).find("td:eq(5)").html());
		$row.find("span.product-purchase-type").html($("tr#product-row-"+product_id).find("td:eq(5)").html());
		$row.find("span.product-mpp").html($("tr#product-row-"+product_id).find("td:eq(3)").html());
		$row.find("input.product-mpp").val($("tr#product-row-"+product_id).find("td:eq(3)").html());
		$row.find("span.stock-amount").html($("tr#product-row-"+product_id).find("td:eq(6)").html());
		
		$(this).next("input,select").focus();
	}
	else{
		$row.find("span.product-unite").html("");
		$row.find("input.product-mrp").val("");
		$row.find("span.product-mrp").html("");
		$row.find("span.product-mpp").html("");
		$row.find("input.product-mpp").val("");
		$row.find("span.stock-amount").html("");

	}
	
	var fg = $(this).parents("div.form-group:first");
	var div = $(this).parents("div.row.window:first");
	var id = div.attr('id');
	
/**************/	
	//This Function is in purchase.js
	if( $(this).hasClass('purchase-data') ){
		initiate_change2(fg, div, id);  
	}
	
	//This Function is in sales.js 
	if( $(this).hasClass('sales-data') ){
		initiate_change(fg, div, id); 
	}
	
});


/**********           Profit Estimation         ************/
$(document).on('keyup','input.overhead',function(){

	var	add_rate = $(this).val(); //alert(add_rate);
	$tr = $(this).parents("div").find("table.profit-table tbody tr");
	$tr.each(function(){
		var price = $(this).find("td:eq(2)").html();  
		var other_exp = $(this).find("td:eq(5)").html();  
		var over_cost = price*add_rate/100; //alert(over_cost);
		var actual_price = Number(over_cost)+Number(other_exp)+Number(price); 
		actual_price = actual_price.toFixed(2); 
		
		$(this).find("td:eq(6)").html(over_cost);
		$(this).find("td:eq(7)").html(actual_price);
		
	});
	
});

$(document).on('keyup','input.pipe-rate',function(){

	var	dis_rate = $(this).val();
	
	var total = 0;
	$tr = $(this).parents("div").find("table.profit-table tbody tr.tr-body");
	$tr.each(function(){
		var sale_price = $(this).find("td input.sale-price").val();  //alert(sale_price);
		var after_dis = sale_price - (sale_price*dis_rate)/100; 
		var type = $(this).find("td:eq(10)").html();
		if(type == 1){
			$(this).find("td:eq(9)").html(after_dis);
			
			var qty = $(this).find("td:eq(3)").html();
			var subtot_sale = after_dis*qty;
			total = Number(total)+Number(subtot_sale);
			
			subtot_sale = subtot_sale.toFixed(2);
			$(this).find("td:eq(11)").html(subtot_sale);
		}
	});
	
});


$(document).on('keyup','input.fit-rate',function(){

	var	dis_rate = $(this).val();
	
	var total = 0;
	$tr = $(this).parents("div").find("table.profit-table tbody tr.tr-body");
	$tr.each(function(){
		var sale_price = $(this).find("td input.sale-price").val();  //alert(sale_price);
		var after_dis = sale_price - (sale_price*dis_rate)/100; 
		var type = $(this).find("td:eq(10)").html();
		if(type == 2){
			$(this).find("td:eq(9)").html(after_dis);
			
			var qty = $(this).find("td:eq(3)").html();
			var subtot_sale = after_dis*qty;
			total = Number(total)+Number(subtot_sale);
			
			subtot_sale = subtot_sale.toFixed(2);
			$(this).find("td:eq(11)").html(subtot_sale);
		}
	});
	
});


$(document).on('change','input.profit-estimate',function(){

	var total = 0;
	var subtot_sale = 0;
	$tr = $(this).parents("div").find("table.profit-table tbody tr.tr-body");
	$tr.each(function(){
		subtot_sale = $(this).find("td:eq(11)").html();
		total = Number(total)+Number(subtot_sale);  //alert(total);
	});
	total = total.toFixed(2);
	$(this).parents("div").find("table.profit-table tbody tr th.total").html(total);
	
});









$(document).on('change','input.product-stock',function(){
	$row = $(this).parents('div.form-group:first');
	var rs = Number($(this).val());
	var pro = Number($row.find("select:eq(0)").val());
	if(pro>0){	
	
	var enc = $("span#enc").html();
	var lang = $("span#ln").html();
	var s_url = "index.php?mother_call=ok&e="+enc+"&page=0000&sub=0806&ln="+lang+"&&gb=0&&pr="+pro;

	 $.ajax({
			url: s_url,
			type: "POST",
			async:true,
			success:function(msg){

				var st = eval(msg);
				var cs =  Number(st[0]['cs']);
				if(cs < rs){
					alert("You have "+cs+" ammount in stock");
					$(this).val(0);
				}
																					

				
			},
			error:function(){
			}
			,complete:function(){
				
			}
			
	 });
		
		
		
		
		
	}
	else{
		alert("Please Select Product");
		$(this).val("");
		
	}
});





$(document).on('click','button.data-remove',function(){


	var win = $(this).parents("div.window:first");
	var page = win.attr("page");
	var data = win.attr("data");
	var id = "#window-"+page+"-"+data;
	$obj = $(id);
	$obj.hide(animationDef,1000,function(){ win.hide(); });

	
});


$(document).on('click','button.data-collapse',function(){

	//$win = $(this).find("i:first").removeClass('fa-compress').addClass('fa-expand');
	var win = $(this).parents("div.window:first");
	var page = win.attr("page");
	var data = win.attr("data");
	var id = "#window-"+page+"-"+data;
	$obj = $(id);
	reverseWindowState($obj);
});




function findParentMenu($obj){

	$prl = $obj.parents("ul > li:eq(0)");
	
	if($prl.length){
		$("#breadcrumb").prepend("<li>"+$prl.find("span:first").html()+"</li>");
		findParentMenu($prl);
	}
}


$(document).on('click','#switch-button',function(){

	toggleUpperPanel();
	
	if($("#switch-button").find("span:eq(0)").attr('data-mode')=='1'){		
		$("div.row.switch-hook:first").ScrollTo({
			duration: 1000,
			easing: 'linear'
		});
	}
});



$(document).on('click','button.data-collapse',function(){

	$div = $(this).parents("div.window:eq(0)");
});


$(document).on('click','.data-reload',function(){

  var alink = $(this);
  var label = "";
  
  var enc = $("span#enc").html();
  var lang = $("span#ln").html();
  if(lang=='1'){
  		label = 'অাবার লোড করা হচ্ছে';
  }
  else{
  	  	label = 'Reloading';
  }
  var link_id = "";
  var classList = $(this).attr('class').split(/\s+/);
  for(var i = 0; i < classList.length; i++) {
    if (classList[i].indexOf("link") != -1) {
      link_id = classList[i];
    }
  }

  var target = link_id.substr(4,4);
  var passing_data = $(this).attr('data');
  var passed_int_data = ""
  if(passing_data){
  		passed_int_data = passing_data; 
  }  
  var button = $(this);
  if(passing_data){
    var pdata = passing_data;
  }
  else{
    var pdata = "";
  }

  while(pdata.search("&") != "-1"){
    pdata = pdata.replace("&","-");
  }
  while(pdata.search("=") != "-1"){
    pdata = pdata.replace("=","_");    
  }
 while(pdata.search("/") != "-1"){
    pdata = pdata.replace("/","_");    
  }
 while(pdata.search(" ") != "-1"){
    pdata = pdata.replace(" ","_");    
  }
 while(pdata.search("'") != "-1"){
    pdata = pdata.replace("'","_");    
  }
 while(pdata.search('"') != "-1"){
    pdata = pdata.replace('"',"_");    
  }
 while(pdata.search(':') != "-1"){
    pdata = pdata.replace(":","_");    
  }
  
  var fake_content = "<h4><i class='fa fa-gears fa-spin'></i> Please Wait . . .</h4>";
  var def_head = "<div class = 'form-group'><div class='col-lg-12 noticiations' id = 'window-head-"+target+"-"+pdata+"' ><div class = 'knob-holder'><input type='text' class='knob optional'  value='0' data-skin='tron'  data-thickness='0.2' data-width='90' data-height='90' data-fgColor='#3c8dbc' data-readonly='true'/></div><div class='alert alert-success alert-dismissable'><i class='fa fa-check'></i><span></span></div><div class='alert alert-danger alert-dismissable'><i class='fa fa-ban'></i><span></span></div><div class='alert alert-info alert-dismissable'><i class='fa fa-info'></i><span></span></div><div class='notification-button'></div></div></div>";
  var main_div = "<div style='display:none' class= 'row window unlock window-"+target+"' data = '"+pdata+"' page = '"+target+"' id = 'window-"+target+"-"+pdata+"'><div class='col-lg-12'><div class='box box-solid box-primary'><div class='box-header'><h3 class='box-title box-visible'> <i class='fa'></i> <span class = 'page-heading' >"+label+"</span> </h3><div class='box-tools pull-left'><button class='btn btn-primary btn-sm data-unlock' ><i class='fa fa-unlock'></i></button></div><div class='box-tools pull-right'><button class='btn btn-primary btn-sm data-reload link"+target+"' data = '"+passed_int_data+"' data-widget='reload'><i class='fa fa-refresh'></i></button><button class='btn btn-primary btn-sm data-collapse' data-widget='collapse'><i class='fa fa-compress'></i></button><button class='btn btn-primary btn-sm data-remove' data-widget='remove'><i class='fa fa-times'></i></button></div></div><div class='box-body'> <div class='overlay'></div><div class='loading-img'></div> <div class='well'>"+fake_content+"</div></div></div></div></div></div>";
  var s_url = "index.php?mother_call=ok&e="+enc+"&page=0000&sub="+target+"&ln="+lang+"&&gb=0";
  var id = "window-"+target+"-"+pdata;
  var head = "window-head-"+target+"-"+pdata;
   console.log("ID IS : "+"$('#"+id+"')");
   console.log("HEAD  IS : "+"$('#"+head+"')");
  $("div#window-"+target+"-"+pdata).hide('slide',1000);
  $("div#window-"+target+"-"+pdata).remove();
  if( $("div#window-"+target+"-"+pdata+":hidden").length == 1){
  	$("div#window-"+target+"-"+pdata).show(animationDef,1500);
  	$("div#window-"+target+"-"+pdata).ScrollTo({
					    			duration: 1000,
					    			easing: 'linear'
	});
  }
  else if($("div#window-"+target+"-"+pdata).length == 0){
	  $("h4#head-loading").show(animationDef,1000,function(){
	  						$("h4#head-loading").ScrollTo({
					    			duration: 1000,
					    			easing: 'linear'
					    	});

	  });
	  $("#main_content").prepend(main_div);
	  
	  $("div#window-"+target+"-"+pdata).show(animationDef,1500);
	  
	  $.ajax({
	  	url: s_url,
		type: "POST",
		async:true,
		data: passing_data,
		success:function(msg){

			
			$("div#"+id).find("div.well:first").hide(animationDef,function(){			
						$("div#"+id).find("div.well:first").html(msg);
						var leg = $("div#"+id).find("legend:first").html(); 
						$("div#"+id).find("legend:first").prepend("<i class = 'fa fa-spinner fa-spin'></i> ");
						$("div#"+id).find("h3.box-title").removeClass("box-visible");
						$("div#"+id).find("legend:first").after(def_head);

						$("h4#head-loading").hide(animationDef,1000);
						$("div#"+id).find("div.well:first").show(animationDef,function(){
							
						alink.find("i.fa-square-o:first").removeClass("fa-square-o").addClass("fa-check-square-o");
						alink.parent("li:first").addClass("active");
								
							$("div#"+id).ScrollTo({
					    			duration: 1000,
					    			easing: 'linear',
					    			callback: function(){

											$("div#window-"+target+"-"+pdata).find(".box-title:first").html(leg);

											$date_inp = $("div#window-"+target+"-"+pdata).find(".date");

											if($date_inp.length> 0)
											$date_inp.each(function(){
												if($(this).val()==''){
						                       					$(this).val($("#entryday").val());
												}
						                       				$(this).daterangepicker({ singleDatePicker: true, format: 'DD-MM-YYYY' });
											});

											$product = $("div#window-"+target+"-"+pdata).find(".product");
											if($product.length > 0){
												loadProduct($product);
											}

											$client = $("div#window-"+target+"-"+pdata).find(".client");
											if($client.length > 0){
												loadClients($client);
											}
											$supplier = $("div#window-"+target+"-"+pdata).find(".supplier");
											if($supplier.length > 0){
												loadSupplier($supplier);
											}

											$pest = $("div#window-"+target+"-"+pdata).find(".showroom, .godown, .factory");

											if($pest.length > 0){
												loadPestablishment($pest)
											}

											$staff = $("div#window-"+target+"-"+pdata).find(".employee");
											if($staff.length > 0){

												loadStaff($staff);
											}

											$bank = $("div#window-"+target+"-"+pdata).find(".bank");
											if($bank.length > 0){
												loadBank($bank);
											}
											$trnhead = $("div#window-"+target+"-"+pdata).find("select.trn-head");
											if($trnhead.length > 0){
												loadTransactionHead($("div#window-"+target+"-"+pdata).find(".trn-head"));
											}
											$mest = $("div#window-"+target+"-"+pdata).find(".mestablishment");
											if($mest.length > 0){
												loadMestablishment($mest);
											}
											ele = $("div#"+id).find("input.form-control:not('.date'):first , select.form-control:first");

											if(ele.length>0){
												ele[0].focus();
											}

											$("div#"+id).find("legend").find("i:first").remove();
											
																						

									}
							});
							
						});
			});

			
		},
		error:function(){
		}
		,complete:function(){
			
		}
		
	  });
  }
  else{
		$("div#"+id).ScrollTo({
  			duration: 1000,
			easing: 'linear',
  			callback: function(){

				ele = $("div#"+id).find("input.form-control:not('.date'):first , select.form-control:first");

				if(ele.length>0){
					ele[0].focus();
				}

			}
		});
  }


});
 


function inititateData(){
  var label = "";
  
  var enc = $("span#enc").html();
  var lang = $("span#ln").html();
  console.log("INITIATING DATA");
  var target = "9999";
  var pdata = "";
  var passed_int_data = "";
  var fake_content = "<h4><i class='fa fa-gears fa-spin'></i> Please Wait . . .</h4>";
  var def_head = "<div style='display:none' class = 'form-group'><div class='col-lg-12 noticiations' id = 'window-head-"+target+"-"+pdata+"' ><div class = 'knob-holder'><input type='text' class='knob optional'  value='0' data-skin='tron'  data-thickness='0.2' data-width='90' data-height='90' data-fgColor='#3c8dbc' data-readonly='true'/></div><div class='alert alert-success alert-dismissable'><i class='fa fa-check'></i><span></span></div><div class='alert alert-danger alert-dismissable'><i class='fa fa-ban'></i><span></span></div><div class='alert alert-info alert-dismissable'><i class='fa fa-info'></i><span></span></div><div class='notification-button'></div></div></div>";
  var main_div = "<div style='display:none' class= 'row window window-"+target+"' data = '"+pdata+"' page = '"+target+"' id = 'window-"+target+"-"+pdata+"'><div class='col-lg-12'><div class='box box-solid box-primary'><div class='box-header'><h3 class='box-title box-visible'> <i class='fa'></i> <span class = 'page-heading' >DI</span> </h3><div class='box-tools pull-right'><button class='btn btn-primary btn-sm data-reload link"+target+"' data = '"+passed_int_data+"' data-widget='reload'><i class='fa fa-refresh'></i></button><button class='btn btn-primary btn-sm data-collapse' data-widget='collapse'><i class='fa fa-compress'></i></button><button class='btn btn-primary btn-sm data-remove' data-widget='remove'><i class='fa fa-times'></i></button></div></div><div class='box-body'> <div class='overlay'></div><div class='loading-img'></div> <div class='well'>"+fake_content+"</div></div></div></div></div></div>";
  var s_url = "index.php?mother_call=ok&e="+enc+"&page=0000&sub="+target+"&ln="+lang+"&&gb=0";
  var id = "window-"+target+"-"+pdata;
  var head = "window-head-"+target+"-"+pdata;
  
	  $("h4#head-loading").show(animationDef,1000,function(){
	  						

	  });
	  
	  $("#window-head-"+target+"-"+pdata).remove();
	  
	  $("#main_content").prepend(main_div);
	  
	  
	  $.ajax({
	  	url: s_url,
		type: "POST",
		async:true,
		success:function(msg){

			$("div#"+id).find("div.well:first").hide(animationDef,function(){			
						$("div#"+id).find("div.well:first").html(msg);
						var leg = $("div#"+id).find("legend:first").html(); 
						$("div#"+id).find("legend:first").prepend("<i class = 'fa fa-spinner fa-spin'></i> ");
						$("div#"+id).find("h3.box-title").removeClass("box-visible");
						$("div#"+id).find("legend:first").after(def_head);
						$("div#"+id).find("input.knob").knob();
						$("h4#head-loading").hide(animationDef,1000);
						$("div#"+id).find("div.well:first").show(animationDef,function(){
							
								

					    	

											$("div#window-"+target+"-"+pdata).find(".box-title:first").html(leg);

											$date_inp = $("div#window-"+target+"-"+pdata).find(".date");
											$date_inp.each(function(){
												if($(this).val()==''){
						                       		$(this).val($("#entryday").val());
												}
						                       				$(this).daterangepicker({ singleDatePicker: true, format: 'DD-MM-YYYY' });
											});


											$("div#"+id).find("legend").find("i:first").remove();
											var ct = $("div#"+id).find("legend").html();
											$("div#"+id).find("legend").html(ct);
																						

						
							
							
						});
			});

			
		},
		error:function(){
		}
		,complete:function(){
			
		}
		
	  });

}

$(document).on('click','.data-unlock',function(){
	$pr = $(this).parents("div.window");
	if($pr.hasClass('unlock')){
		$(this).find("i:first").removeClass('fa-unlock').addClass('fa-lock');
		$(this).parents("div.window").removeClass('unlock');
	}
	else{
		$(this).find("i:first").removeClass('fa-lock').addClass('fa-unlock');
		$(this).parents("div.window").addClass('unlock');
	}
	
});


$(document).on('click','.page-loader.box-entry',function(){
  $("div.ui-effects-wrapper").remove();
  $ulw = $("div.window.unlock");
  $ulw.each(function(){
	  $(this).remove();
  });
  
  $blank = $("div.ui-effects-wrapper");
  
  $blank.each(function(){
	  $(this).remove();
  });
  
  if($("#window-9999-").length == 0){
	  inititateData();
  }
  
  var alink = $(this);
  var label = $(this).find("span:eq(0)").html();
  var enc = $("span#enc").html();
  var lang = $("span#ln").html();
  var link_id = "";
  var classList = $(this).attr('class').split(/\s+/);
  for(var i = 0; i < classList.length; i++) {
    if (classList[i].indexOf("link") != -1) {
      link_id = classList[i];
    }
  }

  var target = link_id.substr(4,4);
  var passing_data = $(this).attr('data');
  var passed_int_data = ""
  if(passing_data){
  		passed_int_data = passing_data; 
  }  
  var button = $(this);
  if(passing_data){
    var pdata = passing_data;
  }
  else{
    var pdata = "";
  }

  while(pdata.search("&") != "-1"){
    pdata = pdata.replace("&","-");
  }
  while(pdata.search("=") != "-1"){
    pdata = pdata.replace("=","_");    
  }
 while(pdata.search("/") != "-1"){
    pdata = pdata.replace("/","_");    
  }
 while(pdata.search(" ") != "-1"){
    pdata = pdata.replace(" ","_");    
  }
 while(pdata.search("'") != "-1"){
    pdata = pdata.replace("'","_");    
  }
 while(pdata.search('"') != "-1"){
    pdata = pdata.replace('"',"_");    
  }
 while(pdata.search(':') != "-1"){
    pdata = pdata.replace(":","_");    
  }
  
  var fake_content = "<h4><i class='fa fa-gears fa-spin'></i> Please Wait . . .</h4>";
  var def_head = "<div class = 'form-group'><div class='col-lg-12 noticiations' id = 'window-head-"+target+"-"+pdata+"' ><div class = 'knob-holder'><input type='text' class='knob optional'  value='0' data-skin='tron'  data-thickness='0.2' data-width='90' data-height='90' data-fgColor='#3c8dbc' data-readonly='true'/></div><div class='alert alert-success alert-dismissable'><i class='fa fa-check'></i><span></span></div><div class='alert alert-danger alert-dismissable'><i class='fa fa-ban'></i><span></span></div><div class='alert alert-info alert-dismissable'><i class='fa fa-info'></i><span></span></div><div class='notification-button'></div></div></div>";
  var main_div = "<div style='display:none' class= 'row window unlock window-"+target+"' data = '"+pdata+"' page = '"+target+"' id = 'window-"+target+"-"+pdata+"'><div class='col-lg-12'><div class='box box-solid box-primary'><div class='box-header'><h3 class='box-title box-visible'> <i class='fa'></i> <span class = 'page-heading' >"+label+"</span> </h3><div class='box-tools pull-left'><button class='btn btn-primary btn-sm data-unlock' ><i class='fa fa-unlock'></i></button></div><div class='box-tools pull-right'><button class='btn btn-primary btn-sm data-reload link"+target+"' data = '"+passed_int_data+"' data-widget='reload'><i class='fa fa-refresh'></i></button><button class='btn btn-primary btn-sm data-collapse' data-widget='collapse'><i class='fa fa-compress'></i></button><button class='btn btn-primary btn-sm data-remove' data-widget='remove'><i class='fa fa-times'></i></button></div></div><div class='box-body'> <div class='overlay'></div><div class='loading-img'></div> <div class='well'>"+fake_content+"</div></div></div></div></div></div>";
  var s_url = "index.php?mother_call=ok&e="+enc+"&page=0000&sub="+target+"&ln="+lang+"&&gb=0";
  var id = "window-"+target+"-"+pdata;
  var head = "window-head-"+target+"-"+pdata;
   console.log("ID IS : "+"$('#"+id+"')");
   console.log("HEAD  IS : "+"$('#"+head+"')");
  if( $("div#window-"+target+"-"+pdata+":hidden").length == 1){
  	$("div#window-"+target+"-"+pdata).show(animationDef,1500);
  	$("div#window-"+target+"-"+pdata).ScrollTo({
					    			duration: 1000,
					    			easing: 'linear'
	});
  }
  else if($("div#window-"+target+"-"+pdata).length == 0){
	  $("h4#head-loading").show(animationDef,1000,function(){
	  						$("h4#head-loading").ScrollTo({
					    			duration: 1000,
					    			easing: 'linear'
					    	});

	  });
	  $("#main_content").prepend(main_div);
	  
	  $("div#window-"+target+"-"+pdata).show(animationDef,1500);
	  
	  $.ajax({
	  	url: s_url,
		type: "POST",
		async:true,
		data: passing_data,
		success:function(msg){

			

			$("div#"+id).find("div.well:first").hide(animationDef,function(){			
						$("div#"+id).find("div.well:first").html(msg);

						var leg = $("div#"+id).find("legend:first").html(); 
						$("div#"+id).find("legend:first").prepend("<i class = 'fa fa-spinner fa-spin'></i> ");
						$("div#"+id).find("h3.box-title").removeClass("box-visible");
						$("div#"+id).find("legend:first").after(def_head);

						$("h4#head-loading").hide(animationDef,1000);
						$("div#"+id).find("div.well:first").show(animationDef,function(){
							
						alink.find("i.fa-square-o:first").removeClass("fa-square-o").addClass("fa-check-square-o");
						alink.parent("li:first").addClass("active");
								
							$("div#"+id).ScrollTo({
					    			duration: 1000,
					    			easing: 'linear',
					    			callback: function(){

											$("div#window-"+target+"-"+pdata).find(".box-title:first").html(leg);

											$date_inp = $("div#window-"+target+"-"+pdata).find(".date");
											$date_inp.each(function(){
												if($(this).val()==''){
						                       					$(this).val($("#entryday").val());
												}
						                       				$(this).daterangepicker({ singleDatePicker: true, format: 'DD-MM-YYYY' });
											});


											$product = $("div#window-"+target+"-"+pdata).find(".product");
											if($product.length > 0){
												loadProduct($product);
											}

											$client = $("div#window-"+target+"-"+pdata).find(".client");
											if($client.length>0){
												loadClients($client);
											}
											$supplier = $("div#window-"+target+"-"+pdata).find(".supplier");
											if($supplier.length>0){
												loadSupplier($supplier);
											}
											$pest = $("div#window-"+target+"-"+pdata).find(".showroom, .godown, .factory");
											if($pest.length>0){
												loadPestablishment($pest)
											}
											$staff = $("div#window-"+target+"-"+pdata).find(".employee");
											if($staff.length>0){
												loadStaff($staff);
											}
											$bank = $("div#window-"+target+"-"+pdata).find(".bank");
											if($bank.length>0){
												loadBank($bank);
											}											

											$trn_head = $("div#window-"+target+"-"+pdata).find(".trn-head");
											if($trn_head.length>0){
												loadTransactionHead($trn_head);
											}
											
											$mest = $("div#window-"+target+"-"+pdata).find(".mestablishment");
											if($mest.length>0){
												loadMestablishment();
											}

											
											ele = $("div#"+id).find("input.form-control:not('.date'):first , select.form-control:first");
											if(ele.length>0){
												ele[0].focus();
											}
											$("div#"+id).find("legend").find("i:first").remove();
											var ct = $("div#"+id).find("legend").html();
											$("div#"+id).find("legend").html(ct.trim());

																						

									}
							});
							
						});
			});

			
		},
		error:function(){
		}
		,complete:function(){
	
		}
		
	  });

  }
  else{
		$("div#"+id).ScrollTo({
  			duration: 1000,
			easing: 'linear',
  			callback: function(){

				ele = $("div#"+id).find("input.form-control:not('.date'):first , select.form-control:first");

				if(ele.length>0){
					ele[0].focus();
				}

			}
		});
  }
    

});	

$(document).on('focusin','.form-control',function(){
	$div = $(this).parents('form:first').find('div.alert').hide('slide','slow');
});
 
$(document).on('change','select.generate-payable-employee',function(){
	
	var employee = $(this).parents("form:first").find("select.employee:first").val();
	alert(employee);
	var target = $(this).parents("div.window:first").attr('page');
	var type = $(this).attr('save-type');
	var alink = $(this);
	var label = $(this).find("span:eq(0)").html();
	var enc = $("span#enc").html();
	var lang = $("span#ln").html();
	
	
	var sal_bar = $(this).parents("form:first").find("input.employee-sallary:first");
	var wor_bar = $(this).parents("form:first").find("input.worked-hour:first");
	var gr_bar = $(this).parents("form:first").find("input.granted-ammount:first");
	var duty_hour = $(this).parents("form:first").find("select.work-hour-total:first").val();
	
	if(employee>0){
		var s_url = "index.php?mother_call=ok&e="+enc+"&page=0000&sub=0302&ln="+lang+"&&gb=0&&submit_type="+type;
		$.ajax({
				url: s_url,
				type: "POST",
				async:true,
				dataType: 'json',
				data: "id="+employee+"&ab=ok",
				success:function(msg){
					var response = eval(msg);
					alert(response['salary'] + "  " + response['worked'])
					
					sal_bar.val(response['salary']);
					wor_bar.val( Number( (Number(response['worked'])/60)/60).toFixed(2) );
					
					duty = $(this).parents("form:first").find("select.work-hour-total:first").val();
					worked = response['worked'];
					salary = response['salary'];
					
					gr_bar.val( Number(( response['salary'] /  duty_hour   )*((Number(response['worked'])/60)/60)).toFixed(2)  );
					
					
					
					
					
				},
				complete:function(){
				}	
		});
	}
});


$(document).on('click','#switch-mn-col',function () {
	$i = $("li.active").find("i.fa-angle-down");
	$i.each(function(){
		$(this).click();
	});
});



function loadProductDetails($row,product_id){
	if(product_id>0){
		$row.find("span.product-unite").html($("tr#product-row-"+product_id).find("td:eq(4)").html());
		$row.find("input.product-mrp").val($("tr#product-row-"+product_id).find("td:eq(2)").html());
		$row.find("span.product-mrp").html($("tr#product-row-"+product_id).find("td:eq(2)").html());
		$row.find("span.product-mpp").html($("tr#product-row-"+product_id).find("td:eq(3)").html());
		$row.find("input.product-mpp").val($("tr#product-row-"+product_id).find("td:eq(3)").html());
		$(this).next("input,select").focus();
	}
	else{
		$row.find("span.product-unite").html("");
		$row.find("input.product-mrp").val("");
		$row.find("span.product-mrp").html("");
		$row.find("span.product-mpp").html("");
		$row.find("input.product-mpp").val("");

	}

}
$(document).on('click','tr.stock-product-list',function () {
	if($(this).hasClass('not-for-print')){
		$(this).removeClass('red-row');
		$(this).removeClass('not-for-print');
	}
	else{
		$(this).addClass('red-row');
		$(this).addClass('not-for-print');
	}

});

	$(document).on('click','#btn-hide-4000-key',function(){
		
		$tr = $("table#table-4000 tr");
		$tr.each(function(){
			$t = $(this);
			var tem_400_a = $t.find("td:eq(2)").html();
			var tem_400_b = $t.find("td:eq(3)").html();
			var tem_400_c = $t.find("td:eq(4)").html();
			
			if(tem_400_a == '0.00' && tem_400_b == '0.00' && tem_400_c == '0.00'){
				$t.hide();
			}
			else{
				$t.show();
			}

		});
	});
	
		$(document).on('click','#btn-show-4000-key',function(){
		
		$tr = $("table#table-4000 tr");
		$tr.each(function(){
				$t.show();

		});
	});

