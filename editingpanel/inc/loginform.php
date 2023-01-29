		<link rel="stylesheet" type="text/css" href="css/login.css">
	</head>
<?php
  if($_GET[logout]==1)
    $errormessage="<h2 class='green'>Loged out successfully</h2>";
  elseif($logerror==1)
    $errormessage="<h2 class='blue'>Please Login</h2>";
  elseif($logerror==2)
    $errormessage="<h2 class='green'>Please Fill all fields.</h2>";
  elseif($logerror==3)
    $errormessage="<h2 class='red'>Wrong ID or Password.</h2>";
?>
	<body>
		<center>
			<br/>
				
			<h1><i>Website Editing Panel</i></h1>
			<div id="loginform">
				<form method="POST">
					<?php echo $errormessage; ?>
					<table align="center" border="0px">
						<tr><td>User ID:</td><th><input type="text" name="id"/></th></tr>
						<tr><td>Password:</td><th><input type="password" name="pass"/></th></tr>
						<tr><td colspan="2" class="centerized"><input type="submit" name="login" value="Login"/></td></tr>
					</table>
				</form>
			</div>
			<br/>
			<br/>
			<small>This site is developed by <a href="http://uniquewebers.com/" target="_blank">Unique Webers</a></small>
	</center>
  </body>
</html>
<?php
	die();
?>