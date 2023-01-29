	function loadTransactionHead(selector){
	  var lang = $("span#ln").html();


	  $drp = $(selector);


	  $drp.each(function(){
		$d = $(this);
		var did = $(this).attr('did');
		$t = null;
		if(did>0){
			$t = $("div#pre-thead_tree table#thead-id"+did);			
		}
		else{
			$t = $("div#pre-thead_tree table");			

		}

		$t.each(function(){
			$row = $(this).find("tr");
			$d.append("<optgroup label = '"+$(this).attr('data')+"'>");
			$row.each(function(){
				$d.append("<option value = '"+$(this).find("td:eq(0)").html()+"'>"+$(this).find("td:eq(1)").html()+"</option>");
			});
			$d.append("</optgroup>");			
		});



/*
			$s = $("div#pre-employee_tree table:first tr");
			$d.append("<option value = ''></option>");
			$d.append("<optgroup label = '"+l1+"'>");
				$s.each(function(){
					$d.append("<option value = '"+$(this).find("td:eq(0)").html()+"'>"+$(this).find("td:eq(2)").html()+"</option>");
				});
			$d.append("</optgroup>");
*/




		var v = $(this).attr('selected-value');
		$d.val(v);


	    });

	}

