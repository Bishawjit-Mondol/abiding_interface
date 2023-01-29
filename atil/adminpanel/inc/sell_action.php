<?php
	$q=0;
	if($_POST[$sc.'submit']){
		if($_POST[$sc.'submit']=="Receive Payment")
		{
			$sells_id=$_POST['sells_id'];
			$paying=$_POST['paying'];
			$due=$_POST['due'];
			$date=date("Y-m-d");
			$sells_status=$_POST['sells_status'];
			if($paying<=$due)
			{
				mysql_query("START TRANSACTION");
				$q=mysql_query("INSERT INTO payments VALUES('".$sells_id."','".$date."', '".$paying."')");
				if($q&&($paying==$due)&&($sells_status!=0))
				{
					$q=mysql_query("UPDATE sells SET status='1' WHERE id='".$sells_id."'");
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
			else
			{
				$say=7;
			}
		}
		elseif($_POST[$sc.'submit']=="Give Payment")
		{
			$sells_id=$_POST['sells_id'];
			$paying=$_POST['paying'];
			$due=$_POST['due'];
			$date=date("Y-m-d");
			if($paying<=$due)
			{
				mysql_query("START TRANSACTION");
				$q=mysql_query("INSERT INTO payments VALUES('".$sells_id."','".$date."', '".(-$paying)."')");
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
			else
			{
				$say=7;
			}
		}
		elseif($_POST[$sc.'submit']=="Just Close Deal")
		{
			$sells_id=$_POST['sells_id'];
			mysql_query("START TRANSACTION");
			$q=mysql_query("UPDATE sells SET status='3' WHERE id='".$sells_id."'");
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
		elseif($_POST[$sc.'submit']=="Delivered")
		{
			$sells_id=$_POST['sells_id'];
			$fully_paid=$_POST['fully_paid'];
			mysql_query("START TRANSACTION");
			if($fully_paid==1)
			{
				$q=mysql_query("UPDATE sells SET status='1' WHERE id='".$sells_id."'");
			}
			else
			{
				$q=mysql_query("UPDATE sells SET status='2' WHERE id='".$sells_id."'");
			}
			$q2=mysql_query("SELECT text_data_id, quantity FROM sells_details WHERE sells_id='".$sells_id."' ");
			if($q2)
			{
				$num2=mysql_num_rows($q2);
				if($num2>0){
				$gt=0;
					while($data2=mysql_fetch_assoc($q2)){
						$stock=product_stock($data2['text_data_id'])-$data2['quantity'];
						$q=mysql_query("UPDATE stock SET stock='".$stock."' WHERE text_data_id='".$data2['text_data_id']."'");
						if($q)
						{
							$date=date('Y-m-d');
							$q=mysql_query("INSERT INTO stock_update VALUES('', '".$data2['text_data_id']."', '".$date."', '".(-$data2['quantity'])."','1')");
						}
					}
				}
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
		elseif(($_POST[$sc.'submit']=="Delete")&&($logeduserlevel==1))
		{
			$date=date("Y-m-d");
			$sells_id=$_POST['sells_id'];
			$sells_status=$_POST['sells_status'];
			$q=1;
			mysql_query("START TRANSACTION");
			if(($sells_status!=0)&&($sells_status!=5))
			{
				$q1=mysql_query("SELECT * FROM sells_details WHERE sells_id='".$sells_id."'");
				if($q1)
				{
					if(mysql_num_rows($q1)>0)
					{
						while(($q1d=mysql_fetch_assoc($q1))&&$q)
						{
							if(($sells_status==1)||($sells_status==2)||($sells_status==3))
							{
								$q=mysql_query("UPDATE stock SET stock=stock+'".$q1d['quantity']."' WHERE text_data_id='".$q1d['text_data_id']."'");
								if($q)
								{
									$q=mysql_query("INSERT INTO stock_update VALUES('', '".$q1d['text_data_id']."', '".$date."', '".$q1d['quantity']."','3')");
								}
							}
							elseif(($sells_status==4))
							{
								$q=mysql_query("UPDATE stock SET stock=stock-'".$q1d['quantity']."' WHERE text_data_id='".$q1d['text_data_id']."'");
								if($q)
								{
									$q=mysql_query("INSERT INTO stock_update VALUES('', '".$q1d['text_data_id']."', '".$date."', '".(-$q1d['quantity'])."','4')");
								}
							}
						}
					}
				}
			}
			if($q)
			{
				$q=mysql_query("DELETE FROM sells_details WHERE sells_id='".$sells_id."'");
				if($q)
				{
					$q=mysql_query("DELETE FROM payments WHERE sells_id='".$sells_id."'");
					if($q)
					{
						$q=mysql_query("DELETE FROM sells WHERE id='".$sells_id."'");
					}
				}
			}
			if($q)
			{
				mysql_query("COMMIT");
				echo "<h2 class='green'>Records Deleted</h2>";
			}
			else
			{
				mysql_query("ROLLBACK");
			}
			include("inc/q_check.php");
		}
	}	
	else{
       $say=null;	
	}
	include("inc/message.php");
?>