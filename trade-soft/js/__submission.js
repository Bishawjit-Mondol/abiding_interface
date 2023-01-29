var lang = $("span#ln").html();
var fake_content = "";
if(lang == '1'){
	fake_content = "<div class = 'loading-content' style='display:none' ><h1><i class='fa fa-laptop'></i> দয়া করে, একটু অপেক্ষা করুন...</h1><br/><h3><i class='fa fa-gears fa-spin'></i> অাপনার, সার্ভারের সাথে সংযোগ স্থাপন করা হচ্ছে। </h3></div>"
}
else{
	fake_content = "<div class = 'loading-content' style='display:none' ><h1><i class='fa fa-laptop'></i> Please Wait . . .</h1><br/><h3><i class='fa fa-gears fa-spin'></i> Communication With Server . . .</h3></div>"
}



function IsNumeric(num) {
     if(num == null)
	return false;
     return (num >=0 || num < 0);
}
function IsPositive(num) {
     if(num == null)
	return false;
     return (num >=0);
}

function isValidDate(dt){
	var comp = dt.split('-');
	var d = parseInt(comp[0], 10);
	var m = parseInt(comp[1], 10);
	var y = parseInt(comp[2], 10);
	var date = new Date(y,m-1,d);
	if (date.getFullYear() == y && date.getMonth() + 1 == m && date.getDate() == d) {
	  return true;
	} 
	else {
	  return false;
	}
}

function IsInteger(num) {
     return Number(num)% 1 == 0;
}

function IsEmpty(val) {
	if(val.replace(/\s/g,'') == ''){
		return true;
	}
	return false;

}


function check_max($input){
	if($input.attr('max')){
		if( Number($input.attr('max')) >= Number($input.val())   ){
			return true;
		}
		return false;
	}
	else{
		return true;
	}
	return true;
}

function check_min($input){
	if($input.attr('max')){
		if( Number($input.attr('min')) <= Number($input.val())   ){
			return true;
		}
		return false;
	}
	else{
		return true;
	}
	return true;
}


function validation($form){
	var msg = "";
	var flag = true;
	var i = 0;
	$elements = $form.find("select:not('.optional'),input:not('.optional')");

	$elements.each(function(){
		$input = $(this);
		
		
		if(!check_max($input)){
			msg = msg + $input.parents("div.input-group:first").find("span:first").html()+" Is Wrong.<br/>";
			flag = false;
		}

		if(!check_min($input)){
			msg = msg + $input.parents("div.input-group:first").find("span:first").html()+" Is Wrong.<br/>";
			flag = false;
		}
		if($input.hasClass('numeric') && !IsNumeric($input.val())  ){
			msg = msg + $input.parents("div.input-group:first").find("span:first").html()+" Is Not Valid Number.<br/>";
			flag = false;
		}

		if($input.hasClass('positive') && !IsPositive($input.val())  ){
			msg = msg + $input.parents("div.input-group:first").find("span:first").html()+" Is Less Then 0.<br/>";
			flag = false;
		}

		if($input.hasClass('integer') && !IsInteger($input.val())){
			msg = msg + $input.parents("div.input-group:first").find("span:first").html()+" Is Fraction.<br/>";
			flag = false;
		}
		if(IsEmpty($input.val())){
			msg = msg + $input.parents("div.input-group:first").find("span:first").html()+" Is Blank.<br/>";
			flag = false;
		}

	});
	var ret = Array(true,"");
//	var ret = Array(flag,msg);
	return ret ;
}

$(document).on('click','button.btn-submit-form.btn-submit',function(){

	$form = $(this).parents("form:first");
	$body = $(this).parents("div.well");

	var target = $(this).parents("div.window:first").attr('page');
	var type = $(this).attr('save-type');
	var alink = $(this);
	var label = $(this).find("span:eq(0)").html();
	var enc = $("span#enc").html();
	var lang = $("span#ln").html();
	var formValidation = validation($form);
	console.log("Validation is : "+formValidation[0]+"\nResult : " + formValidation[1]);
	if(formValidation[0]){
		$form.hide('slide');
		if($body.find("div.loading-content").length == 0){
			$body.append(fake_content);
		}
		$body.find("div.loading-content").show('slide');
		var passing_data = $(this).attr('data');
		var s_url = "index.php?mother_call=ok&e="+enc+"&page=0000&sub="+target+"&ln="+lang+"&&gb=0&&submit_type="+type;
		  $.ajax({
		  	url: s_url,
			type: "POST",
			async:true,
			dataType: 'json',
			data: $form.serialize()+"&ab=ok",
			success:function(msg){
				var response = eval(msg);
				if(response.result){
					$form.find("div.row-data-form:not(:first)").addClass('hidden');
					$form.find("input:not('.date,re-cycle')").val("");
					$form.find("select").val("");
					$form.find("select.set-zero").val(0);
					$form.find("input.set-zero").val(0);
					$form.find(".set-html-zero").html("0.00");
					$form.find("div.alert-success").find("span:first").html(response.return_msg);
					$form.find("div.alert-danger").hide('slide');
					$form.find("div.alert-success").show('slide');
					$rc = $form.find("input.re-cycle");
					$rc.each(function(){
						$(this).val($(this).attr('rdata'));
					});
					var button_code = "";					
					var button = eval(response.return_link);

					var bul = button.length;
					for(bi = 0; bi < bul; bi++){
						var curb = button[bi];
						button_code = button_code + "<button type = 'button' class='btn btn-"+curb['type']+"' data = '"+curb['address']+"'>"+curb['label']+"</button> &nbsp;&nbsp;&nbsp; ";
					}
					
					if(bul>0){			
						$form.find('div.notification-button').html(button_code).show();
					}

				}
				else{
					$form.find("div.alert-success").hide('slide');
					$form.find("div.alert-danger").show('slide').find("span:first").html(formValidation[1]);
					$form.find("div.box").ScrollTo();
				}
				
			},
			complete:function(){
					$body.find("div.loading-content:first").hide('slide');
					$form.show('slide');
					if(reloadPage.indexOf(target)> - 1){
							inititateData();
					}

			}	
		});
	}
	else{
		$form.find("div.alert-success").hide('slide');
		$form.find("div.alert-danger").show('slide').find("span:first").html(response.return_msg);
		$form.find("div.box").ScrollTo();
	}

});

