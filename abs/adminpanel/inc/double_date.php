<?php
   if(getPostDate('date1') && getPostDate('date2'))
   {
       $date1=getPostDate('date1');
       $date2=getPostDate('date2');
   }
   elseif(value_pgd('date1') && value_pgd('date2'))
   {
       $date1=value_pgd('date1');
       $date2=value_pgd('date2');
   }
   else
   {
      $date2=date("Y-m-d");
	  $date1 = strtotime ( '-30 day' , strtotime ($date2) ) ;
	  $date1 = date ( 'Y-m-d' , $date1 );
   } 

   echo "<form method='post' class='embossed'>";
     echo "Report from &nbsp;&nbsp;&nbsp;"; 
     input_date('date1',$date1);
     echo "&nbsp;&nbsp;&nbsp; to &nbsp;&nbsp;&nbsp;";
     input_date('date2',$date2);
     echo "&nbsp;&nbsp;&nbsp;<input type='submit' name='view' value='View'>";
   echo "</form>";
   echo "<br/><h2>Report from <b class='blue'>".dateconvert($date1). "</b> to  <b class='blue'>".dateconvert($date2). "</b></h2>";
