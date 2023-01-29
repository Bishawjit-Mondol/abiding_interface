<?php
  
  $username= isset($_POST['username']) ?  htmlentities($_POST['username']) : "";
  $userpass= isset($_POST['userpass']) ? htmlentities($_POST['userpass']) : ""; 
  
  if( isset($_GET['e']) && $_GET['e']){  
    $encptid= isset($_GET['e'])?$_GET['e']:null;
    $pass=$_SESSION["user".$encptid."pass"];
    $username=$_SESSION["user".$encptid."username"];
    include("_private/db/login_db_fn.php");
    
    $checking=login_check_session($username,$pass,$h,$lu,$lp,$dn);
    if($checking!=0){  
      $checkingdata=mysql_fetch_array($checking);
      $csschoice=$checkingdata[0]; 
      $idstaff=$_SESSION["user".$encptid."idstaff"];
      $usertype=$_SESSION["user".$encptid."usertype"];  
      $css_table = $_SESSION["user".$encptid."code"];
      include("_private/db/db.php");
      $qur = new dbconnection($h,$du,$dp,$dn);
      
      unset($dn,$dp,$du);
      include("_private/db/html.php");
      $inp = new html_interface();
      $qur->store_activity($idstaff);
    }
    else{
      $first_login = true;
      $loginmessage="Sign In";
      include("_private/inc/loginform.php");
    }
  }
  elseif(isset($username) && isset($userpass) && isset($_POST['submit'])){
  
    $tried_login = true;
    include("_private/db/login_db_fn.php");
    $checking=login_check($username,$_POST['userpass'],$h, $lu, $lp, $dn);
    if($checking!=0){ 
      $checkingdata = mysql_fetch_array($checking);
      $idstaff = $checkingdata[0];
      $pass = $checkingdata[1];
      $usertype = $checkingdata[2];
      $csschoice = $checkingdata[3];
      $username = $_POST['username'];
      $name = $checkingdata[4];

      $encptid=md5($idstaff);
       
      $_SESSION["user".$encptid."idstaff"]=$idstaff;
      $_SESSION["user".$encptid."pass"]=$pass;
      $_SESSION["user".$encptid."usertype"]=$usertype;
      $_SESSION["user".$encptid."username"]=$username;
      $_SESSION["user".$encptid."name"]=$name;
      $_SESSION["user".$encptid."code"]=$checkingdata[5];
      
      
      date_default_timezone_set('Asia/Dhaka');
      $date = date_create();
      $_SESSION["user".$encptid."login"]=$date->format('d M Y h:i:s');
	  
      include("_private/db/db.php");
      
      $qur = new dbconnection($h,$du,$dp,$dn);
      unset($dn,$dp,$du);
      include("_private/db/html.php");
      $inp = new html_interface();


    }
    else{
      
      $loginmessage="Wrong Id Or Password";
      include("loginform.php");
    }
  }
  elseif((!isset($username) || !isset($userpass)) && isset($_POST['submit'])){
     $loginmessage="Please Give All Fields";
     include("loginform.php");
  }  
  elseif($_GET['logout']){
     $loginmessage="Loged Out";
     include("loginform.php");
  }
  else{
     $loginmessage="Sign In";
     include("loginform.php");
  }
?>
