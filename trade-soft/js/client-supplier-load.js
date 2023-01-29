/*

$("div#pre-company_tree table:first")

Documentation of Company Table
0 - idcompany, 
1 -company_name,  
2 -details, 
3 -company_phone,  
4 -company_type, 
5 -company_comission , 
6 -company_balance 

*/

function loadClients(selector){
	$drp = $(selector);
	$drp.each(function(){

		$d = $(this);
		$d.append("<option value = ''></option>");
		$cl = $("div#pre-company_tree table:first").find("tr.pre-company-type-1");
	    $drp.append("<optgroup label = 'Clients'>");
			$cl.each(function(){
				var com_id = $(this).find("td:eq(0)").html();
				var com_name = $(this).find("td:eq(1)").html();
			    $d.append("<option value = '" + com_id+ "'>" + com_name +  " ( ID : " +(Number(com_id)+1000) + " ) </option>");
			});
	    $drp.append("</optgroup");
		var v = $(this).attr('selected-value');
		$d.val(v);
		

	});

}
function loadSupplier(selector){
	$drp = $(selector);
	$drp.each(function(){
		$d = $(this);
		$d.append("<option value = ''></option>");
		$cl = $("div#pre-company_tree table:first").find("tr.pre-company-type-2");
	    $drp.append("<optgroup label = 'Suppliers'>");
			$cl.each(function(){
				var com_id = $(this).find("td:eq(0)").html();
				var com_name = $(this).find("td:eq(1)").html();
			    $d.append("<option value = '" + com_id+ "'>" + com_name +  " ( ID : " +(Number(com_id)+1000) + " ) </option>");
			});
	    $drp.append("</optgroup");
		var v = $(this).attr('selected-value');
		$d.val(v);


	});
	$val = $(this).attr('selected');
}


