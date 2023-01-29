<h1>Purchase Search</h1>
<div class='embossed'>
	<form method='POST'>
		<input type='text' value='<?=$_POST['searchword']?>' name='searchword' placeholder='Purchase ID or Supplier information'/>
		<input type='submit' value='Search' name='search'/>
	</form>
</div>
<?php
if($_POST['searchword'])
{	
	$searchword=$_POST['searchword'];
	echo "<h1>Search result for <b class='green'>".$searchword."</b></h1>";
		$searchword= trim($searchword);
		if(strlen($searchword)>0)
		{
			$searchword_exploded=explode(" ",$searchword);
			for($i=0; $searchword_exploded[$i]; $i++)
			{
				if($i==0)
				{
					$qstring=$qstring."SELECT * FROM sells WHERE  id LIKE '%".$searchword_exploded[$i]."%' OR customer LIKE '%".$searchword_exploded[$i]."%' ";
				}
				else
				{
					$qstring=$qstring." OR id LIKE '%".$searchword_exploded[$i]."%' OR customer LIKE '%".$searchword_exploded[$i]."%' ";
				}
			}
			$qstring=$qstring." AND status=4";
			$q=mysql_query($qstring);
			include("inc/sell_display.php");
		}
}
?>
