<?php
   if(getPostDate('date'))
   {
       $date=getPostDate('date');
   }
   elseif(value_pgd('date'))
   {
       $date=value_pgd('date');
   }
   else
   {
       $date=date("Y-m-d");
   } 
   echo "<form method='post' class='embossed'>";
     echo "Select date &nbsp;&nbsp;&nbsp;"; 
     input_date('date',$date);
     echo "&nbsp;&nbsp;&nbsp;<input type='submit' name='view' value='View'>";
   echo "</form>";
   echo "<br/><h2>Report of <b class='blue'>".dateconvert($date). "</b></h2>";
?>