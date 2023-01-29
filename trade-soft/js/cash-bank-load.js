	function loadMestablishment(selector){
	  var lang = $("span#ln").html();
	  var l1, l2, l3;
	  if(lang == '1'){
		l1 = "ক্যােশ";
		l2 = "ব্যংক";
	    }
	  else{
		l1 = "Cash";
		l2 = "Bank";

	    }

	  $drp = $(selector);
	  $c = $("div#pre-mestablishment_tree table:first").find("tr.pre-mestablishment-type-1");
	  $b = $("div#pre-mestablishment_tree table:first").find("tr.pre-mestablishment-type-2");


	  $drp.each(function(){
		$d = $(this);
		if($d.hasClass('my-cash')){		
			$d.append("<option value = ''></option>");
			$d.append("<optgroup label = '"+l1+"'>");
				$c.each(function(){
					$d.append("<option value = '"+$(this).find("td:eq(0)").html()+"'>"+$(this).find("td:eq(1)").html()+"</option>");
				});
			$d.append("</optgroup>");
		}
		if($d.hasClass('my-bank')){
			$d.append("<option value = ''></option>");
			$d.append("<optgroup label = '"+l2+"'></optgroup>");
				$b.each(function(){
					$d.append("<option value = '"+$(this).find("td:eq(0)").html()+"'>"+$(this).find("td:eq(1)").html()+"</option>");
				});

			$d.append("</optgroup>");
		}

		var v = $(this).attr('selected-value');
		$d.val(v);

	    });

	}

