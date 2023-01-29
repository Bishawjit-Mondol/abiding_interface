$(document).on('click','#search-btn',function(){
	var lang = $("span#ln").html();
	var back = "";
	if(lang=='1'){
		back = "ফিরে যান";
	}
	else{
		back = "Back";
	}
	console.log("SEARCHING : "+$(this).val());

	var contain = $("#search_query").val();
	$alink = $("li.treeview").find("a.page-loader");
	//
	$("li.treeview").removeClass("active");
	$alink.each(function(){
		if( $(this).find("span:containsIgnoreCase("+contain+")").length > 0){
			
		}
	})


});

