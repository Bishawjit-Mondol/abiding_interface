function loadBank(selector){
	  var lang = $("span#ln").html();
	  $drp = $(selector);
	  $s = $("div#pre-bank_tree table:first").find("tr");

	  if(lang == '1'){
		$drp.each(function(){
			$d = $(this);
			$s.each(function(){
					$d.append("<option value = '"+$(this).find("td:eq(0)").html()+"'>"+$(this).find("td:eq(2)").html()+"</option>");
			});
		});
	    }
	  else{
		$drp.each(function(){
			$d = $(this);
			$s.each(function(){
					$d.append("<option value = '"+$(this).find("td:eq(0)").html()+"'>"+$(this).find("td:eq(1)").html()+"</option>");
			});
		});

	    }
}

