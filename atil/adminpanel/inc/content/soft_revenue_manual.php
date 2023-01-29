<h1>New Manual Revenue</h1>
<?php
    if($_POST[$sc.'submit']){
		$paying=$_POST['paying'];
		$customer=$_POST['customer'];
		$discount=0;
		$status=5;
		$date=date("Y-m-d");
		mysql_query("START TRANSACTION");
			$q=mysql_query("INSERT INTO sells VALUES('','".$date."','".$customer."','".$discount."','".$status."')");
			$sells_id=mysql_insert_id();
			if($q&&$paying)
			{
				$q=mysql_query("INSERT INTO payments VALUES('".$sells_id."','".$date."', '".$paying."')");
			}
		if($q)
		{
			mysql_query("COMMIT");
		}
		else
		{
			mysql_query("ROLLBACK");
		}
		include("inc/q_check.php");
	}
	else{
       $say=null;	
	}
	include("inc/message.php");
?>
				<table class="structured">
					<tr>
						<td colspan="2">
								<form method="POST" enctype="multipart/form-data">
								<table class="formaligner" align="center">
									<tr>
										<td>
											Receiving Amount of :  
										</td>
										<td>
											:
										</td>
										<td>
											<input type="text" name="paying" value='<?=$_POST['paying']?>'/>
										</td>
									</tr>
									<tr>
										<td>
											Transaction Purpose
										</td>
										<td>
											:
										</td>
										<td>
											<textarea name="customer" rows="2" cols="40"><?php echo stripslashes($_POST['customer']);?></textarea>
										</td>
									</tr>
									<tr>
									  <th colspan="3">
										<input type="submit" name="<?php echo $sc;?>submit" value="Save" onClick="showloading();"/>
									  </th>
									</tr>
								</table>
								</form>  
						</td>
					</tr>
				</table>