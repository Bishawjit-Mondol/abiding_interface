<h1>Move Article</h1>
<?php
    if($_POST[$sc.'submit'])
	{
		if($_POST['page_id']&&$_POST['text_data_id']){
		    $page_id=$_POST['page_id'];
			$text_data_id=$_POST['text_data_id'];
			mysql_query("START TRANSACTION");
			$q=mysql_query("UPDATE a SET page_id='".$page_id."' WHERE text_data_id='$text_data_id'");
			if($q)
			{
				$q=mysql_query("UPDATE img SET page_id='".$page_id."' WHERE text_data_id='$text_data_id'");
				if($q)
				{
					$q=mysql_query("UPDATE download SET page_id='".$page_id."' WHERE text_data_id='$text_data_id'");
					if($q)
					{
						$q=mysql_query("UPDATE text_data SET page_id='".$page_id."' WHERE id='$text_data_id'");
					}
				}
			}
			if($q){
				mysql_query("COMMIT");
			}
			else{
				mysql_query("ROLLBACK");
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
?>
	<table class="structured">
		<tr>
			<td colspan="2">
				<h4>Please select the article and the destination page then click Move</h4>
				<form method="POST">
					<table class="formaligner" align="center">
						<tr>
							<td>
								Article (Page):
							</td>
							<td>
								<select name="text_data_id">
								<option></option>
									<?php
										$q=mysql_query("SELECT id FROM pagetype WHERE transferable='1'");
										while($data=mysql_fetch_assoc($q)){
											$q1=mysql_query("SELECT id, visual FROM page WHERE pagetype_id='".$data['id']."'");
											while($data1=mysql_fetch_assoc($q1)){
												$q2=mysql_query("SELECT id, heading FROM text_data WHERE page_id='".$data1['id']."'");
												while($data2=mysql_fetch_assoc($q2))
												{
													echo "<option value='".$data2['id']."'>".$data2['heading']." ( ".$data1['visual']." )</option>";
												}
											}
										}
									?>		 
								</select>
							</td>
						</tr>
						<tr>
							<td>
								Move to Page :
							</td>
							<td>
								<select name="page_id">
								<option></option>
									<?php
										$q=mysql_query("SELECT id FROM pagetype WHERE transferable='1'");
										while($data=mysql_fetch_assoc($q)){
											$q1=mysql_query("SELECT id, visual FROM page WHERE pagetype_id='".$data['id']."'");
											while($data1=mysql_fetch_assoc($q1)){
												echo "<option value='".$data1['id']."'>".rep_br_sp($data1['visual'])."</option>";
											}
										}
									?>		 
								</select>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="submit" name="<?php echo $sc;?>submit" value="Move" onClick="showloading();"/>
							</th>
						</tr>
					</table>
			</td>
		</tr>
	</table>