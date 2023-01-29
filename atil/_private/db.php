<?php
	function dbconnect()
	{
		mysql_connect("localhost","abidingg_sitev","8U533fVkMaAF") || die(mysql_error());
		mysql_select_db("abidingg_atil") || die(mysql_error());
		mysql_query("SET NAMES utf8");
	}
		
	function dateconvert_wt($date){
				if($date=="0000-00-00"||(!$date))
					return "";
				elseif($date==date("Y-m-d"))
					return "Today";
				else
					return $newDate = date("d M Y (D)", strtotime($date));
	}
	
		function dateconvert($date){
				if($date=="0000-00-00"||(!$date))
					return "";
				elseif($date==date("Y-m-d"))
					return "Today - ".date("d M Y (D)", strtotime($date));
				else
					return date("d M Y (D)", strtotime($date));
	}
	
	function rep_br_sp($string){
		return str_ireplace("<br/>"," ",$string);
	}
	
	function get_fixedtext($id)
	{
		$q=mysql_query("SELECT fixedtext FROM fixedtext WHERE id='$id' ");
		$a=mysql_fetch_array($q);
		return $a[0];
	}
	
	function get_page_text_data($page_id)
	{
		$q=mysql_query("SELECT * FROM text_data WHERE page_id='".$page_id."' AND hidden='0' ORDER BY priority DESC");
		return $q;
	}
	
	function get_text_data($id)
	{
		$q=mysql_query("SELECT * FROM text_data WHERE id='".$id."' AND hidden='0' ");
		return $q;
	}
	
	function get_page_info($page)
	{
		$q=mysql_query("SELECT id, visual, pagetype_id FROM page WHERE page='".mysql_real_escape_string($page)."'");
		$a=mysql_fetch_assoc($q);
		return $a;
	}
	
	function get_page_type($pagetype_id)
	{
		$q=mysql_query("SELECT pagetype FROM pagetype WHERE id='".$pagetype_id."'");
		$a=mysql_fetch_assoc($q);
		return $a['pagetype'];
	}
	
	function main_data_by_id($id,$table)
	{
		$q=mysql_query("SELECT $table FROM $table WHERE id='".mysql_real_escape_string($id)."'");
		$data=mysql_fetch_array($q);
		return $data[0];
	}

	function all_data($table,$order='id',$type='DESC')
	{
		return $q=mysql_query("SELECT * FROM ".$table." ORDER BY ".$order." ".$type."");
	}
	
	function all_main_data($table)
	{
		return $q=mysql_query("SELECT id, ".$table." FROM ".$table." ORDER BY priority DESC");
	}

	function all_data_by_id($id,$table){
		return $q=mysql_query("SELECT * FROM $table WHERE id='$id'");
	}
	
	function get_dated($page_id,$text_data_id){
		$q=mysql_query("SELECT dated FROM dated WHERE page_id='".$page_id."' AND text_data_id='".$text_data_id."'");
		$a=mysql_fetch_assoc($q);
		$dated=dateconvert_wt($a['dated']);
		return $dated;
	}
	
	function get_dated_text_data_id($page_id){
		$q=mysql_query("SELECT text_data_id, dated FROM dated WHERE page_id='".$page_id."' ORDER BY dated DESC");
		return $q;
	}	
	
	function get_dated_text_data_id_2($page_id){
		$q=mysql_query("SELECT text_data_id, dated FROM dated WHERE page_id='".$page_id."' ORDER BY dated DESC LIMIT 1");
		return $q;
	}	
	
	function imgtype_by_id($imgtype_id)
	{
		$q=mysql_query("SELECT imgtype FROM imgtype WHERE id='$imgtype_id'");
		$ar=mysql_fetch_array($q);
		return $ar[0]; 
	}
	
	function display_slide_show()
	{
		echo "<div id='coin-slider'> ";
			$q=mysql_query("SELECT id, caption, imgtype_id, link FROM img WHERE page_id='0' AND text_data_id='0' ORDER BY priority DESC");
			while($data=mysql_fetch_assoc($q))
			{
				if($data['link'])
				{
					echo "<a href='".$data['link']."'>";
				}
				echo "<img src='images/db/".$data['id'].imgtype_by_id($data['imgtype_id'])."' alt='".$data['caption']."'/>";
				if($data['link'])
				{
					echo "</a>";
				}
			}
		echo "</div>";
	}

	function display_multi_image($page_id,$text_data_id)
	{
		$q=mysql_query("SELECT id, caption, imgtype_id, link, border FROM img WHERE page_id='".$page_id."' AND text_data_id='".$text_data_id."'  ORDER BY priority DESC");
		$num=mysql_num_rows($q);
		if($num>0)
		{
			echo "<div class='imgcontainer'>";
			while($data=mysql_fetch_assoc($q))
			{
				if($data['link'])
				{
					echo "<a href='".$data['link']."' target='_blank'>";
				}
				else 
				{
					echo "<a href='index.php?page=largeview&&img_id=".$data['id']."&&data_id=".$text_data_id."&&backpage=".$_GET['page']."'>";
				}
				echo "<img src='images/db/".$data['id'].imgtype_by_id($data['imgtype_id'])."' alt='".$data['caption']."'";
				if($data['border'])
				{
					echo "class='bordered'";
				}
				echo "/>";
				if($data['caption'])
				{
					echo "<b>".nl2br($data['caption'])."</b>";
				}
				echo "</a>";
			}
			echo "</div>";
		}
	}
	
	function downloadtype_by_id($downloadtype_id)
	{
		$q=mysql_query("SELECT downloadtype FROM downloadtype WHERE id='$downloadtype_id'");
		$ar=mysql_fetch_array($q);
		return $ar[0];
	}
	
	function display_multi_link($page_id,$text_data_id){
		$q=mysql_query("SELECT a, visual, comment FROM a WHERE page_id='".$page_id."' AND text_data_id='".$text_data_id."'");
		if(mysql_num_rows($q)>0)
		{
			echo "<div class='linkcontainer'>";
			while($data=mysql_fetch_assoc($q))
			{
				echo "<a href='".$data['a']."' target='_blank'>".$data['visual']."</a>";
				if($data['comment'])
				{
					echo nl2br($data['comment']);
				}
				echo "<br/>";
			}
			echo "</div>";
		}
		
		$q=mysql_query("SELECT id, downloadtype_id, title, description FROM download WHERE page_id='".$page_id."' AND text_data_id='".$text_data_id."'");
		if(mysql_num_rows($q)>0)
		{
			echo "<div class='linkcontainer'>";
			while($data=mysql_fetch_assoc($q))
			{
				$downloadtype_id=$data['downloadtype_id'];
				$downloadtype=downloadtype_by_id($downloadtype_id);
				$url="download/db/".$data['id'].$downloadtype;
				echo "<a href='".$url."' target='_blank'>Download ".$data['title']."</a>";
				if($data['description'])
				{
					echo nl2br($data['description']);
				}
				echo "<br/>";
			}
			echo "</div>";
		}
	}
	
	function display_preview_image($page_id,$text_data_id)
	{
		$q=mysql_query("SELECT id, caption, imgtype_id FROM img WHERE page_id='".$page_id."' AND text_data_id='".$text_data_id."'  ORDER BY priority DESC LIMIT 1");
		if(mysql_num_rows($q)>0)
		{
			while($data=mysql_fetch_assoc($q))
			{
				echo "<img src='images/db/".$data['id'].imgtype_by_id($data['imgtype_id'])."' alt='".$data['caption']."'/>";
			}
		}
		else
		{
			echo "<b class='black'>No preview images available</b>";
		}
	}
	
	function display_multi_image_slides($page_id,$text_data_id)
	{
		$q=mysql_query("SELECT id, caption, imgtype_id, link, border FROM img WHERE page_id='".$page_id."' AND text_data_id='".$text_data_id."'   ORDER BY priority DESC");
		$num=mysql_num_rows($q);
		if($num>0)
		{
			if($num>1)
			{
				echo "<div class='slidecontainer'>";
				$count=0;
			}
			else
			{
				echo "<div class='singlebigimg'>";
			}
			while($data=mysql_fetch_assoc($q))
			{
				$url[$count]="images/db/".$data['id'].imgtype_by_id($data['imgtype_id']);
				$img_id[$count]=$data['id'];
				if($num>1)
				{
					echo "<div id='sud".$count."'>";
				}
				if($data['link'])
				{
					echo "<a href='".$data['link']."' target='_blank'>";
				}
				else
				{
					echo "<a href='index.php?page=largeview&&img_id=".$img_id[$count]."&&data_id=".$text_data_id."&&backpage=".$_GET['page']."'>";
				}
				echo "<img src='".$url[$count]."' alt='".$data['caption']."'";
				if($data['border'])
				{
					echo "class='bordered'";
				}
				echo "/>";
				echo "</a>";
				/*
				if($data['caption'])
				{
					echo "<b>";
						echo "<big class='green'>";
							for($i=0;$i<20;$i++)
							{
								echo $data['caption'][$i];
							}
						echo "</big>";
						if(strlen($data['caption'])>=20)
						{
							echo "...<small>(Click to expand)</small></b>";
						}
					echo "</b>";
				}
				*/
				if($num>1)
				{
					echo "<small>";
					if($count>=1) echo "<a onClick='showit(".($count-1).")' class='previous'>Prev</a>";
					if(($count>=1)&&($count<($num-1))) echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
					if($count<($num-1))echo "<a onClick='showit(".($count+1).")' class='next'>Next</a>";
					echo "</small>";
					echo "</div>";
					$count++;
				}
			}
			echo "</div>";
			if($num>1)
			{
				echo "<br/><img src='images/blank1by1.gif'  alt='Blank' onload='hideAllButZero(".$count.")' class='customwidth' width='0px'>";
			}
		}
		if($num>1)
		{	
			echo "<div class='buttoncontainer'>";
			if($num>5)
			{
				echo "<center><marquee class='pg' direction='left' height='100px' width='650px' scrollamount='3'  scrolldelay='50' ONMOUSEOVER='this.stop();' ONMOUSEOUT='this.start();'>";
			}
			$count=0;
			echo "<table border='0px' align='center'><tr>";
			while($url[$count])
			{
				echo "<td><a onmouseover='showit(".$count.")' href='index.php?page=largeview&&img_id=".$img_id[$count]."&&data_id=".$text_data_id."&&backpage=".$_GET['page']."'><img src='".$url[$count]."' class='bordered'/></a></td>";
				$count++;
			}
			echo "</tr></table>";
			if($num>5) 
			{
				echo "</marquee></center>";
			}
			echo "</div>";
		}
	}
	
	
	function display_sliding($img_id,$count)
	{
		$q=mysql_query("SELECT caption, imgtype_id, link FROM img WHERE id='$img_id'");
		$ar=mysql_fetch_assoc($q);
		$caption=nl2br($ar['caption']);
		$imgtype_id=$ar['imgtype_id'];
		$imgtype=imgtype_by_id($imgtype_id);
		$link=$ar['link'];
		if($link) echo "<a href='".$link."' target='_blank'>";
			echo "<div class='slide' id='slide".$count."' onmouseover='expand_slide(".$count.")' onmouseout='reset_slides()' >";
				echo "<img src='images/db/".$img_id.$imgtype."' alt='".$caption."'/>";
				echo "<div class='slidecaption'>";
				for($i=0;$i<300;$i++)
				{
					echo $caption[$i];
				}
				echo " ... </div>";
			echo "</div>";
		if($link) echo "</a>";
	}
	
	function display_featured($text_data_id,$count){
		$q=mysql_query("SELECT id, imgtype_id FROM img WHERE text_data_id='".$text_data_id."'  ORDER BY priority DESC LIMIT 1");
		$ar=mysql_fetch_assoc($q);
		$img_id=$ar['id'];
		$imgtype_id=$ar['imgtype_id'];
		$imgtype=imgtype_by_id($imgtype_id);
		$q2=mysql_query("SELECT  
										text_data.heading,
										SUBSTR(text_data.content,1,380) as content,
										page.page
										FROM text_data
										LEFT JOIN page ON (text_data.page_id=page.id)
										WHERE text_data.id='".$text_data_id."'
										");
		$ar2=mysql_fetch_assoc($q2);
		$heading=$ar2['heading'];
		$content=$ar2['content'];
		$page=$ar2['page'];
		echo "<a href='index.php?page=".$page."&&data_id=".$text_data_id."'>";
			echo "<div class='slide' id='slide".$count."' onmouseover='expand_slide(".$count.")' onmouseout='reset_slides()' >";
				echo "<img src='images/db/".$img_id.$imgtype."' alt='".$heading."'/>";
				echo "<div class='slidecaption'>";
					echo "<h3>".$heading."</h3>";
					echo $content;
				echo " ... </div>";
			echo "</div>";
		echo "</a>";
	}
	
	function display_heading_table_td($heading_table_id, $x,$y){
		$q=mysql_query("SELECT heading_table_td, th, position_id FROM heading_table_td WHERE heading_table_id='".$heading_table_id."' AND x='".$x."' AND y='".$y."'");
		if(mysql_num_rows($q)==1)
		{
			$data=mysql_fetch_assoc($q);
			$th=$data['th'];
			$heading_table_td=nl2br($data['heading_table_td']);
			$position_id=$data['position_id'];
			$position=main_data_by_id($position_id,'position');
			if($th==1)
			{
				echo "<th align='".$position."'>".$heading_table_td."</th>";
			}
			else
			{
				echo "<td align='".$position."'>".$heading_table_td."</td>";
			}
		}
		else
		{
			echo "<td align='center'>-</td>";
		}
		
	}
	
	function display_multi_heading_table($page_id,$text_data_id){
		$q=mysql_query("SELECT * FROM heading_table WHERE page_id='".$page_id."' AND text_data_id='".$text_data_id."'");
		if(mysql_num_rows($q)>0)
		{
			while($data=mysql_fetch_assoc($q))
			{
				$heading_table_id=$data['id'];
				$heading_table=$data['heading_table'];
				$position_id=$data['position_id'];
				$x_num=$data['x_num'];
				$y_num=$data['y_num'];
				$position=main_data_by_id($position_id,'position');
				echo "<br/>"."<table class='".$position."' title='".$heading_table."'>";
					echo "<tr><th colspan='".$x_num."' class='heading'>".$heading_table."</th></tr>";
					for($y=1;$y<=$y_num;$y++)
					{
						echo "<tr>";
						for($x=1;$x<=$x_num;$x++)
						{
							display_heading_table_td($heading_table_id, $x,$y);
						}
						echo "</tr>";
					}
				echo "</table>";
			}
		}
	}
	
	function display_multi_li($heading_list_id){
		$q=mysql_query("SELECT li FROM heading_list_li WHERE heading_list_id='".$heading_list_id."'");
		if(mysql_num_rows($q)>0)
		{
			while($data=mysql_fetch_assoc($q))
			{
				echo "<li>".$data['li']."</li>";
			}
		}
	}
	
	function display_multi_heading_list($page_id,$text_data_id){
		$q=mysql_query("SELECT * FROM heading_list WHERE page_id='".$page_id."' AND text_data_id='".$text_data_id."'");
		if(mysql_num_rows($q)>0)
		{
			echo "<div class='listcontainer'>";
			while($data=mysql_fetch_assoc($q))
			{
				$heading_list_id=$data['id'];
				$heading_list=$data['heading_list'];
				$ordered=$data['ordered'];
					echo "<h3>".$heading_list."</h3>";
					if($ordered==1) echo "<ol>"; else echo "<ul>";
					display_multi_li($heading_list_id);
					if($ordered==1) echo "</ol>"; else echo "</ul>";
			}
			echo "</div>";
		}
	}
	
	function display_single_image()
	{
		$img_id=$_GET['img_id'];
		$q=mysql_query("SELECT caption, imgtype_id, border FROM img WHERE id='".$img_id."' LIMIT 1");
		if(mysql_num_rows($q)>0)
		{
			while($data=mysql_fetch_assoc($q))
			{	
				echo "<div class='embossed'>";
				echo "<center>";
				$data_id=$_GET['data_id'];
				$backpage=$_GET['backpage'];
				$q2=get_text_data($data_id);
				while($data2=mysql_fetch_assoc($q2))
				{
					$text_data_id=$data2['id']; 	
					$heading=$data2['heading']; 	
					$content=$data2['content']; 
					$content=$data2['content']; 			
				}
				echo "<a href='index.php?page=".$backpage."&&data_id=".$data_id."'><h2>";
				echo $heading;
				if(strlen($data['caption'])>20) echo " ...";
				echo "</h2></a><br/>";
				echo "<a href='index.php?page=".$backpage."&&data_id=".$data_id."'><img src='images/db/".$img_id.imgtype_by_id($data['imgtype_id'])."' alt='".$data['caption']."' width='700px' ";
					if($data['border']) echo "class='bordered'";
				echo "/></a>";
				//echo "<p>".nl2br($data['caption'])."</p>";
				echo "<p>".nl2br($content)."</p>";
				echo "<a href='index.php?page=".$backpage."&&data_id=".$data_id."' class='bluebutton'>Source page</a>";
				echo "<center>";
				echo "</div>";
			}
		}
	}
	
	function people_email($text_data_id)
	{
		$q=mysql_query("SELECT email FROM people_email WHERE text_data_id='$text_data_id'");
		$ar=mysql_fetch_array($q);
		return $ar[0]; 
	}
	
	function display_product_scroll()
	{
		$q1=mysql_query("SELECT id, page FROM page WHERE pagetype_id='6'");
		$num_product_pages=mysql_num_rows($q1);
		if($num_product_pages>0)
		{
			echo "<center><marquee class='pg' behavior='alternate' direction='left' height='100px' width='800px' scrollamount='1'  scrolldelay='50' ONMOUSEOVER='this.stop();' ONMOUSEOUT='this.start();'>";
			echo "<table border='0px' align='center'><tr>";
			while($data1=mysql_fetch_assoc($q1))
			{
				$pro_page_id=$data1['id'];
				$pro_page=$data1['page'];
				$q2=mysql_query("SELECT id FROM text_data WHERE page_id='".$pro_page_id."'  AND hidden='0'");
				$num_products=mysql_num_rows($q2);
				if($num_products>0)
				{
					while($data2=mysql_fetch_assoc($q2))
					{
						$text_data_id=$data2['id'];
						$q=mysql_query("SELECT id, imgtype_id FROM img WHERE page_id='".$pro_page_id."' AND text_data_id='".$text_data_id."' LIMIT 3");
						$num=mysql_num_rows($q);
						if($num>0)
						{
							while($data=mysql_fetch_assoc($q))
							{
								echo "<td><a href='index.php?page=".$pro_page."&&data_id=".$text_data_id."'><img src='images/db/".$data['id'].imgtype_by_id($data['imgtype_id'])."' class='bordered' height='90px'/></a></td>";
							}
						}
					}
				}
			}
			echo "</tr></table>";
			echo "</marquee></center>";
		}
	}
	
	function get_page_by_id($page_id)
	{
		$q=mysql_query("SELECT page FROM page WHERE id='".$page_id."'");
		$a=mysql_fetch_assoc($q);
		return $a['page'];
	}
	
	function display_img_largeview_link($img_id)
	{
		$q=mysql_query("SELECT caption, imgtype_id, text_data_id FROM img WHERE id='".$img_id."'");
		if(mysql_num_rows($q)>0)
		{
			while($data=mysql_fetch_assoc($q))
			{	
				$data_id=$data['text_data_id'];
				$q2=mysql_query("SELECT page_id FROM text_data WHERE id='".$data_id."' AND hidden='0' ");
				$data2=mysql_fetch_assoc($q2);
				$backpage=get_page_by_id($data2['page_id']);
				echo "<a href='index.php?page=largeview&&img_id=".$img_id."&&data_id=".$data_id."&&backpage=".$backpage."'>";
					echo "<h4>";
						for($i=0;$i<20;$i++) echo $data['caption'][$i];
						if(strlen(caption)>=20) echo "...";
					echo "</h4>";
					echo "<br/>";
					echo "<img src='images/db/".$img_id.imgtype_by_id($data['imgtype_id'])."' alt='".$data['caption']."'/>";
				echo "</a>";
			}
		}
	}
	
	function get_pagination($perpage,$start,$pageurl,$qc)
	{
		$num_articles=mysql_num_rows($qc);
		if($num_articles>$perpage)
		{
			$num_articles;
			$next_start=$start+$perpage;
			$pre_start=$start-$perpage;
			$pagination="<div class='pagination'>";
			if(($start!=0)&&($start<($num_articles-$perpage)))
			{
				$pagination=$pagination."<a href='".$pageurl."&&start=".$pre_start."' class='previous'>Previous</a>";
				$count=1;
				for($i=0;$i<$num_articles;$i=$i+$perpage)
				{
					if($i==$start)
						$pagination=$pagination."<a href='".$pageurl."&&start=".$i."' class='dull'>".$count."</a>";
					else
						$pagination=$pagination."<a href='".$pageurl."&&start=".$i."'>".$count."</a>";
					$count++;
				}
				$pagination=$pagination."<a href='".$pageurl."&&start=".$next_start."' class='next'>Next</a>";
			}
			elseif(($start==0)&&($start<($num_articles-$perpage)))
			{
				$count=1;
				for($i=0;$i<$num_articles;$i=$i+$perpage)
				{
					if($i==$start)
						$pagination=$pagination."<a href='".$pageurl."&&start=".$i."' class='dull'>".$count."</a>";
					else
						$pagination=$pagination."<a href='".$pageurl."&&start=".$i."'>".$count."</a>";
					$count++;
				}
				$pagination=$pagination."<a href='".$pageurl."&&start=".$next_start."' class='next'>Next</a>";
			}
			else
			{
				$pagination=$pagination."<a href='".$pageurl."&&start=".$pre_start."' class='previous'>Previous</a>";
				$count=1;
				for($i=0;$i<$num_articles;$i=$i+$perpage)
				{
					if($i==$start)
						$pagination=$pagination."<a href='".$pageurl."&&start=".$i."' class='dull'>".$count."</a>";
					else
						$pagination=$pagination."<a href='".$pageurl."&&start=".$i."'>".$count."</a>";
					$count++;
				}
			}
			$pagination=$pagination."</div>";
		}
		return $pagination;
	}
	
	function get_price($text_data_id)
	{
		$q=mysql_query("SELECT * FROM price WHERE text_data_id='$text_data_id'");
		$ar=mysql_fetch_assoc($q);
		
		$q2=mysql_query("SELECT stock FROM stock WHERE text_data_id='$text_data_id'");
		$ar2=mysql_fetch_assoc($q2);
		
		$price="<i class='blue'>Price : </i>";
		if($ar['negotiable']==2)
		{
			$price=$price."Contact For Price";
		}
		elseif($ar['negotiable']==1)
		{
			$price=$price."<i class='red'>".bfn($ar['price'],0)." Taka Only</i>";
			$price=$price." (Negotiable)";
		}
		else
		{
			$price=$price."<i class='red'>".bfn($ar['price'],0)." Taka Only</i>";
		}
		if($ar['note'])
		{
			$price=$price."<br/><small class='blue'>".$ar['note']."</small>";
		}
		if($ar2['stock']>0)
		{
			$price=$price."<br/><b>Available at our store</b>";
		}
		else
		{
			$price=$price."<br/><b>Out of stock.<br/>Will be available soon</b>";
		}
		return $price;
	}
	
	function get_only_price($text_data_id)
	{
		$q=mysql_query("SELECT * FROM price WHERE text_data_id='$text_data_id'");
		$ar=mysql_fetch_assoc($q);
		return $ar['price'];
	}
	
	function bfn($num,$d=2){
	    $neg = false;
	    if($num<0){
			$neg = true;
		}
	    $num = abs($num);
		$num=sprintf("%.".$d."f",$num);
		$num_a=explode('.',$num);
		$num_h=$num_a[0];

		$num_f=$num_a[1];	
		$num_s="";
		if($num_h){
			$m=3;
			for($i=(strlen($num_h)-1);$i>-1;$i--){
				$num_s=$num_h[$i].$num_s;
				if(($i==(strlen($num_h)-$m)) && $i!=0 ){
						$num_s=",".$num_s;
						$m=$m+2;
				}
			}
		}
		else
		{
			$num_s=$num_s."0";
		}
		if($d==0)
		{
			return $num_s;
		}
		$num_s=$num_s.".";
		$num_s=$num_s.$num_f;
		if($neg){
			$num_s="(-) ".$num_s;
		}
		return $num_s;
	}	
?>