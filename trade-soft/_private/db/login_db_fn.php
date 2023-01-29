<?php

 function login_check($userid,$userpass,$h, $u, $p, $d){
    $encuserpass=md5(mysql_escape_string($userpass));
    $con = mysql_connect($h,$u,$p);
    
    if(mysql_select_db($d)){
		$userid = md5(mysql_escape_string($userid));
		$qstring=sprintf("SELECT iduser,password,level,css,a.name,code FROM (SELECT iduser,password,level,css,name,idreport FROM ___users WHERE password='%s' AND md5(login)='%s' AND status = 1) as  a LEFT JOIN ___report USING(idreport)",$encuserpass,$userid);
		$q=mysql_query($qstring);   
		if(mysql_num_rows($q)>0){
			mysql_close($con);			
			return $q;
		}
		else{
			mysql_close($con);
			return 0;   
		}
                unset($dn,$dp,$du);
	}
	else{
		echo "<h3 align = 'center' >Couldnot connect with database server</h3>";
	}
        
}
  
  
  function login_check_session($userid,$userpass,$h, $u, $p, $d)
  {
    
    $con = mysql_connect($h,$u,$p);
    mysql_select_db($d);
    
    $qstring=sprintf("SELECT css FROM ___users WHERE password='%s' AND md5(login)='%s' AND status = 1",$userpass,md5($userid));
    $q=mysql_query($qstring);   
    if(mysql_num_rows($q)>0)
    {
      mysql_close($con);
      return $q;
    }
    else
    {
      mysql_close($con);
      return 0;   
    }
  }
  
?>
