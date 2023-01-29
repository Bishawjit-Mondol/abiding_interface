<h1>Get an Appointment at <?echo $companyname;?></h1>
<div class="embossed">
<?php
  include("odcdb/database/function.php");
  connect_maindbpatient();
  $dq = new dentalQuery();
    if($_POST['new_app'])
    {
      $date = $_POST['y'].'-'.$_POST['m'].'-'.$_POST['d'];
      if($_POST['name'] && $_POST['email'] && ($_POST['cell'] || $_POST['tele']))
      {
		$got_app=$dq->unknownApp($_POST['name'] , $_POST['email'] , $_POST['cell'] , $_POST['tele'],$date,$_POST['time'],"");
        if($got_app)
        {
          $messasage="<h3 class='green'>Apointment Request Submited</h3><em>You will be notified if confirmed.</em><br/>";
          $to=file_get_contents("inc/appmail/maildestination.php");
          $subject=$_POST['name']." seeking appointment";
          $message=$_POST['name']." is seeking an appointment on ".$date.".\nThe cellnumber of ".$_POST['name']." is ".$_POST['cell']."\nand E-mail address is ".$_POST['email']." .";
          $headers="From: appointment@".$domain;
		  ini_set("SMTP", "localhost");
		  $mail=mail($to, $subject, $message, $headers);
		  if($mail)
		  {
			$messasage="<h3><b class='green'>Appointment request Sent to ".$to."</b></h3>";
		  }
		  else
		  {
			$messasage="<h3><b class='red'>Could not send Appointment request to ".$to."</b></h3>";
		  }
        }
        else
        {
          $messasage="<h3><b class='red'>Could not submit Apointment Request</b></h3>";
        }
      }
      else
      {
        $messasage="<h3><b class='red'>You must enter NAME, valid E-MAIL and ( Either Telephone Or Cellphone )</b></h3>";
      }
    }
    else
    {
      $messasage="<center><b class='blue'>Please Fill the form to get an appointment.</b></center>";
    }
        echo "<form  class='structure' width='600px' action='index.php?page=appointment' method='POST'>";
            echo $messasage;
            echo "<table align='center'>";
                echo "<tr>";
                echo "<tr>";
                echo "<tr>";
                    echo "<td>Name</td>";
                    echo "<td>";
                        echo "<input type = 'text' name = 'name' value = '".$_POST['name']."' />";
                    echo "</td>";
                echo "</tr>";

                echo "<tr>";
                    echo "<td>Email</td>";
                    echo "<td>";
                        echo "<input type = 'text' name = 'email' value = '".$_POST['email']."' />";
                    echo "</td>";
                echo "</tr>";

                echo "<tr>";
                    echo "<td>Cellphone</td>";
                    echo "<td>";
                        echo "<input type = 'text' name = 'cell' value = '". $_POST['cell']."' />";
                    echo "</td>";
                echo "</tr>";

                echo "<tr>";
                    echo "<td>Telephone</td>";
                    echo "<td>";
                        echo "<input type = 'text' name = 'tele' value = '".$_POST['tele']."' />";
                    echo "</td>";
                echo "</tr>";

                echo "<tr>";
                    echo "<td>Date</td>";
                    echo "<td>";
                        $dq->printDate(Date("d-m-y"), "d", "m", "y");
                    echo "</td>";
                echo "</tr>";
                echo "<tr>";
                    echo "<td>Time</td>";
                    echo "<td>";
                        $dq->getDropDown("app_time", "time", "time", "time", $_POST['time']);
                    echo "</td>";
                echo "</tr>";
				echo "<tr>";
					echo "<th colspan='2'><input type = 'submit' name = 'new_app' value = 'Get Appointment' /></th>";
				echo "</tr>";
            echo "</table>";
        echo "</form>";
	dbconnect();
	if($got_app)
	{
		mysql_query("INSERT INTO mail VALUES('','$date','$subject','$message')");
	}
?>
</div>
