<?php
    if($_POST[$sc.'submit'])
	{
		$company=mysql_real_escape_string($_POST['company']);
		$home_heading=mysql_real_escape_string($_POST['home_heading']);
		$home_intro=mysql_real_escape_string($_POST['home_intro']);
		if($company){
			$q=update_fixedtext(1,$company);
			if($q){
				$q=update_fixedtext(2,$home_heading);
				if($q){
					$q=update_fixedtext(3,$home_intro);
				}
			}
			include("inc/q_check.php");
		}
		else{
			$say=1;
		}
	}
	else{
		$say=null;	
	}
	include("inc/message.php");
	$company=get_fixedtext(1);
	$home_heading=get_fixedtext(2);
	$home_intro=get_fixedtext(3);
	$domain=get_fixedtext(4);
	$slogan=get_fixedtext(6);
?>
<table class="structured">	
		<tr>
		  <td colspan="2">
				    <form method="POST">
				    <table class="formaligner" align="center">
						<tr>
							<td>
								Title
							</td>
							<td>
								<input type="text" name="company" value="<?php echo stripslashes($company);?>"/>
							</td>
						</tr>
						<tr>
							<td>
								Heading
							</td>
							<td>
								<textarea name="home_heading" cols="20px"><?php echo stripslashes($home_heading);?></textarea>
							</td>
						</tr>
							<tr>
							<td>
								Article
							</td>
							<td>
								<textarea name="home_intro" rows="10px" cols="40px"><?php echo stripslashes($home_intro);?></textarea>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="submit" name="<?php echo $sc;?>submit" value="Save Changes" onClick="showloading();"/>
							</th>
						</tr>
					</table>
					</form>
		  </td>
		</tr>
	</table>