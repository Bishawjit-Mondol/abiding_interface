<?php

$db = 'abidingg_atil';

$db_check = 'abidingg_sitev';
$db_check_p = '8U533fVkMaAF';

$db_user = 'abidingg_sitea';
$db_user_p = '6LwTL[AVVkXh';

// $db_user = 'root';
// $db_user_p = '';


$sc = $_SESSION['sc'];
$submit = $_POST['login'];

$enclogeduserid = $_SESSION['id'];
$enclogeduserpass = $_SESSION['pass'];
$logeduser = $_SESSION['user'];
$logeduserlevel = $_SESSION['level'];
if ($enclogeduserid && $enclogeduserpass) {
	$con = mysql_connect("localhost", $db_check, $db_check_p);
	mysql_select_db($db);
	$q = mysql_query("SELECT * FROM user WHERE enuser='" . $enclogeduserid . "' AND pass='" . $enclogeduserpass . "'");
	if (mysql_num_rows($q) > 0) {
		$qd = mysql_fetch_assoc($q);
		$validid = $qd['enuser'];
		$validpass = $qd['pass'];
		$validuser = $qd['user'];
		$validlevel = $qd['level'];
		mysql_close($con);
		if (($validid == $enclogeduserid) && ($validpass == $enclogeduserpass) && ($validlevel > 0)) {
			include("inc/db.php");
			connect_database($db_user, $db_user_p, $db);
		} elseif (($validid == $enclogeduserid) && ($validpass == $enclogeduserpass) && ($validlevel < 1)) {
			$logerror = 4;
			include("inc/loginform.php");
			die();
		} else {
			$logerror = 1;
			include("inc/loginform.php");
		}
	}
} elseif ($submit) {
	$userid = mysql_escape_string($_POST['id']);
	$userpass = mysql_escape_string($_POST['pass']);
	if ($userid && $userpass) {
		$encuserid = md5($userid);
		$encuserpass = md5($userpass);
		$con = mysql_connect("localhost", $db_check, $db_check_p);
		mysql_select_db($db);
		$q = mysql_query("SELECT * FROM user WHERE enuser='" . $encuserid . "' AND pass='" . $encuserpass . "'");
		if (mysql_num_rows($q) > 0) {
			$qd = mysql_fetch_assoc($q);
			$validid = $qd['enuser'];
			$validpass = $qd['pass'];
			$validuser = $qd['user'];
			$validlevel = $qd['level'];
			mysql_close($con);
			if (($validid == $encuserid) && ($validpass == $encuserpass) && ($validlevel > 0)) {
				$_SESSION['id'] = $validid;
				$_SESSION['pass'] = $validpass;
				$_SESSION['user'] = $validuser;
				$_SESSION['level'] = $validlevel;
				$enclogeduserid = $_SESSION['id'];
				$enclogeduserpass = $_SESSION['pass'];
				$logeduser = $_SESSION['user'];
				$logeduserlevel = $_SESSION['level'];
				include("inc/db.php");
				connect_database($db_user, $db_user_p, $db);
			} elseif (($validid == $encuserid) && ($validpass == $encuserpass) && ($validlevel < 1)) {
				$logerror = 4;
				include("inc/loginform.php");
			} else {
				$logerror = 1;
				include("inc/loginform.php");
			}
		} else {
			$logerror = 3;
			include("inc/loginform.php");
		}
	} else {
		$logerror = 2;
		include("inc/loginform.php");
	}
} else {
	$logerror = 1;
	include("inc/loginform.php");
}
