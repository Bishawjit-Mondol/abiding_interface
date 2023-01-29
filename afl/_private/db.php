<?php
	function dbconnect()
	{
		mysql_connect("localhost","abidingg_sitev","8U533fVkMaAF") || die(mysql_error());
		mysql_select_db("abidingg_afl") || die(mysql_error());
		mysql_query("SET NAMES utf8");
	}
	
	function get_fixedtext($id)
	{
		$q=mysql_query("SELECT fixedtext FROM fixedtext WHERE id='$id' ");
		$a=mysql_fetch_array($q);
		return $a[0];
	}
?>