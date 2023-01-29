<div class="row"  >
	 		<div id = 'product_tree' >
		<?php
		   $query_1 = "SELECT idproduct_catagory, product_catagory_name FROM product_catagory WHERE idproduct_catagory_parent IS NULL ;";
		   $maincat = $qur->custom_select_query($query_1);
		   $tx = $ty = 0;
		   foreach($maincat as $m){
		   ?>
			  <div id = 'product-cat-<? echo$m[0];?>'  did = '<?php echo $m[0];?>' dname = '<?php echo $m[1];?>' nested_level = '0' >
			<?php find_catagory($qur,$m[0],1); ?>
			  </div>
		   <?
		   }
		?>   
		</div>			
</div>



<div id = 'pre-company_tree' style='display:none' >
		<?php
		   $query_2 = "SELECT idcompany, company_name,  company_address as details, company_phone,  company_type, company_comission , company_balance FROM company c LEFT JOIN company_details USING(idcompany) ORDER BY company_type, company_name;";
		   $company = $qur->custom_select_query($query_2);
		?>
			<table >
				  <tbody>
					  <?php
							foreach($company as $c){
					?>
							<tr id = 'pre-company-id-<?php echo $c[0];?>' class =  'pre-company-type-<?php echo $c[4];?>'>
									<td><?php echo $c[0];?></td>
									<td><?php echo $c[1];?></td>
									<td><?php echo $c[2];?></td>
									<td><?php echo $c[3];?></td>
									<td><?php echo $c[4];?></td>
									<td><?php echo $c[5];?></td>
									<td><?php echo $c[6];?></td>
							</tr>
					<?php
							}
					  ?>
				  </tbody>
			</table>		
</div>		


<div id = 'pre-employee_tree' style='display:none' >
		<?php
		   $query_2 = "SELECT iddivision, division_name FROM division d ORDER BY division_priority DESC;";
		   $company = $qur->custom_select_query($query_2);
		   foreach($company as $c){
		?>
		 
			<table id = 'division-id<?php echo $c[0]; ?>' data = '<?php echo $c[1]; ?>' border = '1px'>
				  <tbody>
					  <?php
							$staff = $qur->custom_select_query("SELECT idstaff, CONCAT(post_name, ' : ' ,  staff_name) FROM staff s LEFT JOIN post USING(idpost) WHERE iddivision = ".$c[0]." ORDER BY post_name,staff_name");
							foreach($staff as $c){
					?>
							<tr id = 'pre-employee-id-<?php echo $c[0];?>' class =  'pre-employee-type-<?php echo $c[1];?>'>
									<td><?php echo $c[0];?></td>
									<td><?php echo $c[1];?></td>
							</tr>
					<?php
							}
					  ?>
				  </tbody>
			</table>
		<? } ?>		
</div>	


<div id = 'pre-thead_tree' style='display:none' >
		<?php
		   $query_2 = "SELECT idtransaction_head_type, transaction_head_type_en, transaction_head_type_bn FROM transaction_head_type t ORDER BY priority DESC;";
		   $company = $qur->custom_select_query($query_2);
		   foreach($company as $c){
		?>
		 
			<table id = 'thead-id<?php echo $c[0]; ?>' data = '<?php if($lang == 1) { echo $c[2]; } else{ echo $c[1]; } ?>' border = '1px'>
				  <tbody>
					  <?php
							$det3 = $qur->custom_select_query("SELECT * FROM transaction_head WHERE idtransaction_head_type = ".$c[0]." ORDER BY transaction_head_name;");
							foreach($det3 as $k){
					?>
							<tr id = 'pre-thead-id-<?php echo $k[0];?>' class =  'pre-thead-type-<?php echo $c[0];?>'>
									<td><?php echo $k[0];?></td>
									<td><?php echo $k[1];?></td>
							</tr>
					<?php
							}
					  ?>
				  </tbody>
			</table>
		<? } ?>		
</div>	


<div id = 'pre-pestablishment_tree' style='display:none' >
		<?php
		   $query_3 = "SELECT idpestablishment,  pestablishment_name, pestablishment_type FROM pestablishment_type LEFT JOIN pestablishment USING(idpestablishment) ORDER BY  pestablishment_type, pestablishment_name;";
		   $pest = $qur->custom_select_query($query_3);
		?>
			<table >
				  <tbody>
					  <?php
							foreach($pest as $c){
					?>
							<tr id = 'pre-pestablishment-id-<?php echo $c[0];?>' class =  'pre-pestablishment-type-<?php echo $c[2];?>'>
									<td><?php echo $c[0];?></td>
									<td><?php echo $c[1];?></td>
									<td><?php echo $c[2];?></td>
							</tr>
					<?php
							}
					  ?>
				  </tbody>
			</table>		
</div>		







<div id = 'pre-mestablishment_tree' style='display:none'>
		<?php
		   $query_3 = "SELECT idmestablishment, mestablishment_name , mestablishment_balance, mestablishment_type FROM mestablishment ORDER BY mestablishment_type ,  mestablishment_name ;";
		   $pest = $qur->custom_select_query($query_3);
		?>
			<table >
				  <tbody>
					  <?php
							foreach($pest as $c){
					?>
							<tr id = 'pre-mestablishment-id-<?php echo $c[0];?>' class =  'pre-mestablishment-type-<?php echo $c[3];?>'>
									<td><?php echo $c[0];?></td>
									<td><?php echo $c[1];?></td>
									<td><?php echo $c[3];?></td>
									<td><?php echo $c[2];?></td>
							</tr>
					<?php
							}
					  ?>
				  </tbody>
			</table>		

</div>		
