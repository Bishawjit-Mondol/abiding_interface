<form  method="POST" class='embossed'>
	<img src="images/blank1by1.gif" class='customwidth' width="500px"/>
	<br/><h2>Add New User</h2>
	<br/><b class='blue'>Enter Following Information Correctly</b><br/>
    <table align="center" border='0px'>
        <tr>
            <td>User's Full Name : </td>
            <td><input type="text" name ="ufn" value = "<?php echo req('ufn'); ?>"/> </td>    
        </tr>
        <tr>
			<td>User's Login ID : </td>
            <td><input type="text" name ="uli" value = "<?php echo req('uli'); ?>"/> </td>    
        </tr>
        <tr>
			<td>User's Password : </td>
            <td><input type="password" name ="ulp" /> </td>    
        </tr>
        <tr>
			<td>Re-type password : </td>
            <td><input type="password" name ="ulpr" /></td>    
        </tr>
        <tr>
			<td>User Catagory : </td>
            <td>
				<select name = 'uct'>
					<option></option>
					<?php
						if(req('uct')==1){
							echo "<option selected value = '1'>Administrator</option>";
						}
						else{
							echo "<option value = '1' >Administrator</option>";
						}
						/*
						if(req('uct')==2){
							echo "<option selected value = '2' >Health Officer</option>";
						}
						else{
							echo "<option value = '2' >Health Officer</option>";
						}
						*/
						
						if(req('uct')==3){
							echo "<option selected value = '3' >Data Entry Operator</option>";
						}
						else{
							echo "<option value = '3' >Data Entry Operator</option>";
						}
					?>
				</select>
			</td>    
        </tr>
        
    </table>
    
    <br/><input type="submit" name ="ab" value ="Save"/>
    
</form>

