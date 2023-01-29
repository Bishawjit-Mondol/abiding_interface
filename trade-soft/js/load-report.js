$(document).on('click','button.btn-show-report', function(){

  $div = $(this).parents("div.window:first");
  $form = $div.find("form:first");
  var target = $div.attr('page');
  var passing_data = $(this).attr('data'); 
  var button = $(this);
  if(passing_data){
    var pdata = passing_data;
    }
  else{
    var pdata = "";
    }
  var fdata = $form.serialize()+pdata+"&ab=ok";
  var d1 = $("#report_date1").html();
  var d2 = $("#report_date2").html();
  var lang = $("#ln").html();
  var enc = $("#enc").html();

  var s_url = "index.php?mother_call=ok&type=ok&e="+enc+"&page=0000&sub="+target+"&ln="+lang+"&ab=ok"+"&d1="+d1+"&d2="+d2;
  if($div.find("div.report").length == 0){
				$div.find("div.well:first").append("<br/><div class = 'report' style='display:none' ><h3><i class='fa fa-desktop'></i> </i>Communicating With Server . . .</h3><h4><i class='fa fa-gears fa-spin'></i> Please Wait... </h4> </div>");
    }
  else{
		$div.find("div.report:first").hide('slide').html("<h3><i class='fa fa-desktop'></i> </i>Communicating With Server . . .</h3><h4><i class='fa fa-gears fa-spin'></i> Please Wait... </h4> ");
    }
   $div.find("div.report:first").show('slide');


	  $.ajax({
	  	url: s_url,
		type: "POST",
		async:true,
		data: fdata,
		success:function(msg){
            $div.find("div.report:first").hide('slide');
			$div.find("div.report:first").html(msg);
            $div.find("div.report:first").show('slide');			
		},
		error:function(){
		}
		,complete:function(){
			
		}
		
	  });


});


