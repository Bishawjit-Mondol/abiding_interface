<?php
	// This is for just finding the worked hour of and id ix from date d1 to d2
	$ix = req('id');
	$d1 = req_date('d1');//"2010-10-10";
	$d2 = req_date('d2');//"2020-10-10";
	$query = "SELECT d, SUM(ABS(ex-et)) FROM ( SELECT idstaff_attendance, date(date_time) as d ,unix_timestamp(date_time) as ex FROM staff_attendance s WHERE idstaff = $ix  AND type = 2 AND date(date_time) BETWEEN '$d1' AND '$d2' ) a LEFT JOIN ( SELECT idstaff_attendance, date(date_time) as d,unix_timestamp(date_time) as et FROM staff_attendance s WHERE idstaff = $ix  AND type = 1 AND date(date_time) BETWEEN '$d1' AND '$d2' ) as b USING(d) ";
	$det = $qur->custom_select_query($query);
	$query = "SELECT staff_sallary FROM staff_details s WHERE idstaff = $ix ";
	$det2 = $qur->custom_select_query($query);	
	$return_wh['worked'] = $det[0][1];
	$return_wh['salary'] = $det2[0];
    echo json_encode($return_wh);
    die();
?>
