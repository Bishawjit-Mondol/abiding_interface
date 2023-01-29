$(document).on("change","select.transaction-method-hook",function(){
	var method = $(this).parents("form:first").find("select.transaction-method:first").val();
	if(method=='2'){
		$(this).parents("form:first").find("div.cheque-details").show('slide');		
		if($(this).parents("form:first").find("select.transaction-type").val()=='1'){
			//reciving
			$(this).parents("form:first").find("select.cheque_number_select").prop('disabled',true);
			$(this).parents("form:first").find("select.cheque_number_select").hide('slide');
			$(this).parents("form:first").find("input.cheque_number_text").prop('disabled',false);
			$(this).parents("form:first").find("input.cheque_number_text").show('slide')
		}
		else{
			$(this).parents("form:first").find("select.cheque_number_select").prop('disabled',false);
			$(this).parents("form:first").find("input.cheque_number_text").prop('disabled',true);
			$(this).parents("form:first").find("select.cheque_number_select").show('slide');
			$(this).parents("form:first").find("input.cheque_number_text").hide('slide')
			var bt = $(this).parents("form:first").find("select[name=v4] option:selected").text();
			$cb = $(this).parents("form:first").find("select.cheque_bank option");
			$cb.each(function(){
				if($(this).html()==bt){
					$(this).prop('selected', true);















	$form = $(this).parents("form:first");

	var trn_type = $form.find("select.transaction-type").val();
	var trn_method = $form.find("select.transaction-method").val();
	$cheque_leaf = $form.find("select.cheque_number_select");
	$cheque_leaf.empty();

	var trn_bank = $form.find("select.cheque_bank:first").val();

	if(trn_type == -1 && trn_method == 2 ){

		



	var label = $(this).find("span:eq(0)").html();
	var enc = $("span#enc").html();
	var lang = $("span#ln").html();
	var target = '0810';

		var s_url = "index.php?mother_call=ok&e="+enc+"&page=0000&sub="+target+"&ln="+lang+"&&gb=0&&bn="+trn_bank;
		  $.ajax({
		  	url: s_url,
			type: "POST",

			data: $form.serialize()+"&ab=ok",
			success:function(msg){
				var cl = eval(msg);
				for(var i =0 ; i<cl.length; i++){
					$cheque_leaf.append("<option value = '"+cl[i]['id']+"'>"+cl[i]['num']+"</option>");
				}
				
			},
			complete:function(){


			}	
		});





	}


































				}
			});




		}
	}
	else{
		$(this).parents("form:first").find("div.cheque-details").hide('slide');
	}
});
$(document).on("click, change","select.bank.cheque-details",function(){

	$form = $(this).parents("form:first");

	var trn_type = $form.find("select.transaction-type").val();
	var trn_method = $form.find("select.transaction-method").val();
	$cheque_leaf = $form.find("select.cheque_number_select");
	$cheque_leaf.empty();

	var trn_bank = $form.find("select.cheque_bank:first").val();

	if(trn_type == -1 && trn_method == 2 ){

	



	var label = $(this).find("span:eq(0)").html();
	var enc = $("span#enc").html();
	var lang = $("span#ln").html();
	var target = '0810';

		var s_url = "index.php?mother_call=ok&e="+enc+"&page=0000&sub="+target+"&ln="+lang+"&&gb=0&&bn="+trn_bank;
		  $.ajax({
		  	url: s_url,
			type: "POST",

			data: $form.serialize()+"&ab=ok",
			success:function(msg){
				var cl = eval(msg);
				for(var i =0 ; i<cl.length; i++){
					$cheque_leaf.append("<option value = '"+cl[i]['id']+"'>"+cl[i]['num']+"</option>");
				}
				
			},
			complete:function(){


			}	
		});





	}

});


$(document).on("change","select.transaction-method-hook-1",function(){
	var method = $(this).parents("form:first").find("select.transaction-method:first").val();
	if(method=='2'){
		$(this).parents("form:first").find("div.cheque-details").show('slide');		
		if($(this).parents("form:first").find("select.transaction-type").val()=='1'){
			//reciving
			$(this).parents("form:first").find("select.cheque_number_select").prop('disabled',true);
			$(this).parents("form:first").find("select.cheque_number_select").hide('slide');
			$(this).parents("form:first").find("input.cheque_number_text").prop('disabled',false);
			$(this).parents("form:first").find("input.cheque_number_text").show('slide')
		}
		else{
			$(this).parents("form:first").find("select.cheque_number_select").prop('disabled',false);
			$(this).parents("form:first").find("input.cheque_number_text").prop('disabled',true);
			$(this).parents("form:first").find("select.cheque_number_select").show('slide');
			$(this).parents("form:first").find("input.cheque_number_text").hide('slide')
			var bt = $(this).parents("form:first").find("select[name=v1] option:selected").text();
			$cb = $(this).parents("form:first").find("select.cheque_bank option");
			$cb.each(function(){
				if($(this).html()==bt){
					$(this).prop('selected', true);















	$form = $(this).parents("form:first");

	var trn_type = -1;
	var trn_method = $form.find("select.transaction-method").val();
	$cheque_leaf = $form.find("select.cheque_number_select");
	$cheque_leaf.empty();



	var trn_bank = $form.find("select.cheque_bank:first").val();

	if(trn_type == -1 && trn_method == 2 ){

		



	var label = $(this).find("span:eq(0)").html();
	var enc = $("span#enc").html();
	var lang = $("span#ln").html();
	var target = '0810';

		var s_url = "index.php?mother_call=ok&e="+enc+"&page=0000&sub="+target+"&ln="+lang+"&&gb=0&&bn="+trn_bank;
		  $.ajax({
		  	url: s_url,
			type: "POST",

			data: $form.serialize()+"&ab=ok",
			success:function(msg){
				var cl = eval(msg);
				for(var i =0 ; i<cl.length; i++){
					$cheque_leaf.append("<option value = '"+cl[i]['id']+"'>"+cl[i]['num']+"</option>");
				}
				
			},
			complete:function(){


			}	
		});





	}


































				}
			});




		}
	}
	else{
		$(this).parents("form:first").find("div.cheque-details").hide('slide');
	}
});

