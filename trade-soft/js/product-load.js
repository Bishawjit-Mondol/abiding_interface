	function printProductData($element,$drp,pre){
	    $e = $element.children("div");
	    if($e.length>0){
	      $e.each(function(){
	       var space = Number($(this).attr('nested_level'));
	       var label = $(this).attr('dname');

	       $drp.append("<optgroup label = '"+label+"'>");
			printProductData($(this),$drp,label);
	       $drp.append("</optgroup>");
	      })
	    }
	    else{
	      
	      
	      $tr = $element.find("table tr");
	      $tr.each(function(){
			  var space = Number($(this).parents("table:eq(0)").attr("nested_level"))+1;
			  var label = $(this).find("td:eq(1)").html();
			  for(i=0; i<space; i++){
				  label="&nbsp;&nbsp;"+  label;
				}

				$drp.append("<option value = '"+$(this).find("td:eq(0)").html()+"'>"+pre+ " "+label+"</option");
	      });
	    }
	  }

	function loadSelectorProduct(v){

		var	  from = null;


		$d = v;
		$d.empty();
		$d.append("<option></option>");

		from = $d.attr('did');
		if(from==null){
		    $sel = $("div#product_tree").children("div");
			$sel.each(function(){
			     $d.append("<optgroup label = '"+$(this).attr('dname')+"'>");
				 printProductData($(this),$d,null);
			     $d.append("</optgroup>");
			});
		}

		else if(from.length==0){

			from = null
		    $sel = $("div#product_tree").children("div");
			$sel.each(function(){
			     $d.append("<optgroup label = '"+$(this).attr('dname')+"'>");
				 printProductData($(this),$d,null);
			     $d.append("</optgroup>");
			});
		}

		else{

		    $sel = $("div#product_tree").find("div#product-cat-"+from+":first");
			$sel.each(function(){
			     $d.append("<optgroup label = '"+$(this).attr('dname')+"'>");
				 printProductData($(this),$d,null);
			     $d.append("</optgroup>");
			});
		}
		var v = $(this).attr('selected-value');
		$d.val(v);

	 
	}

	function loadProduct(selector){

	var	  from = null;

	  $drp = $(selector);

	  $drp.each(function(){
	
		
		$d = $(this);
		if($d.find("option").length <= 0){
			$d.empty();
			$d.append("<option></option>");

			from = $d.attr('did');
			if(from.length==0){
				from = null
			}

			if(from==null){
			    $sel = $("div#product_tree").children("div");
				$sel.each(function(){
				     $d.append("<optgroup label = '"+$(this).attr('dname')+"'>");
					 printProductData($(this),$d,null);
				     $d.append("</optgroup>");
				});
			}
			else{
			    $sel = $("div#product_tree").find("div#product-cat-"+from+":first");
				$sel.each(function(){
				     $d.append("<optgroup label = '"+$(this).attr('dname')+"'>");
					 printProductData($(this),$d,null);
				     $d.append("</optgroup>");
				});
			}
			var v = $(this).attr('selected-value');

			$d.val(v);
		}
		else{
			console.log("not loading product");
		}
	    });

	}

