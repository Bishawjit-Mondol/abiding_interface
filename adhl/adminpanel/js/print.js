function printpage()
{
	$("#topmenubg").hide();
	$("#ttd").hide();
	$("#ending").hide();
	$(".embossed").hide();
	$(".notforprint").hide();
	$("input").hide();
	window.print();
	$("#topmenubg").show();
	$("#ttd").show();
	$("#ending").show();
	$(".embossed").show();
	$(".notforprint").show();
	$("input").show();
}