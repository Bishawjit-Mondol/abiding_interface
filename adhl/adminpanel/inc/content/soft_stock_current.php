<h1>Stock</h1>
<?php
	if($_POST['edit']&&$_POST['text_data_id'])
	{
		$text_data_id=$_POST['text_data_id'];
				$q2=mysql_query("SELECT 
										text_data.id, 
										text_data.heading,
										price.p_price,
										stock.stock
										FROM text_data
										LEFT JOIN price ON (price.text_data_id=text_data.id)
										LEFT JOIN stock ON (stock.text_data_id=text_data.id)
										WHERE text_data.id='".$text_data_id."'
									");
		$data=mysql_fetch_assoc($q2);
		?>
			<table class="structured">
			  <tr>
				<td>
				<form method="POST">
					<input type='hidden' name='text_data_id' value='<?=$text_data_id?>'>
					<input type='hidden' name='old_stock' value='<?=$data['stock']?>'>
					<input type='hidden' name='p_price' value='<?=$data['p_price']?>'>
					<input type='hidden' name='heading' value='<?=$data['heading']?>'>
					<table class="formaligner">
						<tr>
							<td><b class='blue'><?=$data['heading']?></b></td><th><?=$data['stock']?> units available</th>
						</tr>
						<tr>
							<br/>
							<td><input type="number" name="stock"></td>
							<th>
								<input type="submit" name="<?php echo $sc;?>submit" value="Add" onClick="showloading();"/>
								<input type="submit" name="<?php echo $sc;?>submit" value="Remove" onClick="showloading();"/>
							<th>
						</tr>
					</table>
				</form>
				</td>
			  </tr>
			</table>
	<?
	}
	else
	{
	    if($_POST[$sc.'submit']&&$_POST['text_data_id']&&$_POST['stock']){
			$date=date("Y-m-d");
			$p_price=$_POST['p_price'];
			$heading=$_POST['heading'];
			mysql_query("START TRANSACTION");
			if($_POST[$sc.'submit']=="Add")
			{
				$stock=$_POST['old_stock']+$_POST['stock'];
				$stock_update=$_POST['stock'];
			}
			if($_POST[$sc.'submit']=="Remove")
			{
				$stock=$_POST['old_stock']-$_POST['stock'];
				$stock_update=(-$_POST['stock']);
			}
			$paying=$stock_update*$p_price;
			$q=mysql_query("UPDATE stock SET stock='".$stock."' WHERE text_data_id='".$_POST['text_data_id']."'");
			if($q)
			{
				$q=mysql_query("INSERT INTO stock_update VALUES('', '".$_POST['text_data_id']."', '".$date."', '".$stock_update."','0')");
				if($q)
				{
					$q=mysql_query("INSERT INTO sells VALUES('','".$date."','Manual Stock Update of ".$heading."','0','5')");
					$sells_id=mysql_insert_id();
					if($q&&$paying)
					{
						$q=mysql_query("INSERT INTO payments VALUES('".$sells_id."','".$date."', '".$paying."')");
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
		include("inc/message.php");
		echo "<form method='post' class='embossed'>";
			echo "Category : ";
				echo "<select name='category_id'>";
					echo "<option value='0'>All</option>";
					$qcat1=mysql_query("SELECT id FROM page WHERE pagetype_id='3'");
					if(mysql_num_rows($qcat1)>0)
					{
						while($d=mysql_fetch_assoc($qcat1))
						{
								$qcat=mysql_query("SELECT id, category FROM category WHERE page_id='".$d['id']."'");
								while($datacat=mysql_fetch_assoc($qcat))
								{
									echo "<option value='".$datacat['id']."'";
										if($datacat['id']==$_POST['category_id']) echo "selected";
									echo ">".$datacat['category']."</option>";
								}
						}
					}
				echo "</select>";
				echo "<input type='submit' name='show' value='Show'/>";
		echo "</form>";
		

		if($_POST['category_id'])
		{
			$q1=mysql_query("SELECT text_data_id FROM category_vs_text_data WHERE category_id='".$_POST['category_id']."'");
			$c=0;
			if(mysql_num_rows($q1)>0)
			{
				while($d=mysql_fetch_assoc($q1))
				{
					if($c==0)
					{
						$string=" text_data.id='".$d['text_data_id']."' ";
						$c=1;
					}
					else
					{
						$string=$string." OR text_data.id='".$d['text_data_id']."' ";
					}
				}
			}
		}
		else
		{
			$q1=mysql_query("SELECT id FROM page WHERE pagetype_id='3'");
			$c=0;
			if(mysql_num_rows($q1)>0)
			{
				while($d=mysql_fetch_assoc($q1))
				{
					if($c==0)
					{
						$string=" text_data.page_id='".$d['id']."' ";
						$c=1;
					}
					else
					{
						$string=$string." OR text_data.page_id='".$d['id']."' ";
					}
				}
			}
		}		
		$q2=mysql_query("SELECT 
											text_data.id, 
											text_data.heading,
											page.page,
											stock.stock,
											price.price,
											price.p_price
											FROM text_data
											LEFT JOIN stock ON (stock.text_data_id=text_data.id)
											LEFT JOIN page ON (page.id=text_data.page_id)
											LEFT JOIN price ON (price.text_data_id=text_data.id)
											WHERE ".$string."
											ORDER BY text_data.priority
										");
		if($q2)
		{
			$num=mysql_num_rows($q2);
			if($num>0){
				echo "<h3>".$num." Product Listed</h3>";
				echo "<table align='center' class='rb'>";
				echo "<tr><th>Product</th><th>Stock</th><th>Single<br/>Sell Price</th><th>Total<br/>Sell Price</th><th>Single<br/>Purchase<br/>Price</th><th>Total<br/>Purchase<br/>Price</th><th>Estimated<br/>Profit</th><th class='notforprint'>Action</th></tr>";
				while($data=mysql_fetch_assoc($q2)){
					$t=$data['stock']*$data['price'];
					$t_p=$data['stock']*$data['p_price'];
					$gt=$gt+$t;
					$gt_p=$gt_p+$t_p;
					echo "<tr>
								<td class='l'><a target='_blank' href='../index.php?page=".$data['page']."&&data_id=".$data['id']."'>"
												.$data['heading'].
											"</a></td>
								<td>".$data['stock']."</td>
								<td>".bfn($data['price'])."</td>
								<th class='r'>".bfn($t)."</th>
								<td>".bfn($data['p_price'])."</td>
								<th class='r'>".bfn($t_p)."</th>
								<th class='r'>".bfn($t-$t_p)."</th>
								<th class='notforprint'>
									<form method='post'>
										<input type='hidden' name='text_data_id' value='".$data['id']."'>
										<input type='submit' name='edit' value='Edit'  onClick='showloading();'/>
									</form></th>
							</tr>";
				}
				echo "<tr><th colspan='3' class='l'>Grand Total</th><th class='r'>".bfn($gt)."</th><td></td><th class='r'>".bfn($gt_p)."</th><th class='r'>".bfn($gt-$gt_p)."</th></tr>";
				echo "</table>";
			}
			else{
				echo "<h1>No Products Listed</h1>";
			}
		}
	}
?>