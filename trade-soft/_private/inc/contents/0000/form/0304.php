
<?php
	
    $label_2 =  ($lang == 1 ? "কর্মকর্তা নির্বাচন করুন " : "Select Employee"); 
    $labela_1 =  ($lang == 1 ? "অনুবাদ 0 " : "idstaff"); 
    $labela_2 =  ($lang == 1 ? "কর্মকর্তা / কর্মচারীর নাম " : "Employee Name"); 
    $labela_3 =  ($lang == 1 ? "প্রারম্ভিক ব্যালেন্স " : "Opening Balance"); 
    $labela_4 =  ($lang == 1 ? "পদবী " : "Designation"); 
    $labela_5 =  ($lang == 1 ? "কর্মকর্তা / কর্মচারী যোগ করুন" : "Add Employee"); 
    
    $label_3 =  ($lang == 1 ? "মন্তব্য " : "Remarks"); 
    $label_4 =  ($lang == 1 ? "নিবন্ধনের তারিখ" : "Registartion Date"); 
    $label_5 =  ($lang == 1 ? "কমিশনের হার " : "Incentive Rate"); 
    $label_6 =  ($lang == 1 ? "মোবাইল নম্বর" : "Cell Phone"); 
    $label_7 =  ($lang == 1 ? " বেতন" : "Salary"); 
    $label_8 =  ($lang == 1 ? "যোগদানের তারিখ" : "Joning Date"); 
	
	$label_9 =   ($lang == 1 ? "পিতা " : "Father's Name"); 
    $label_10 =  ($lang == 1 ? "জন্ম তারিখ" : "DOB"); 
    $label_11 =  ($lang == 1 ? "শিক্ষাগত যোগ্যতা" : "Educational Qualification"); 
    $label_12 =  ($lang == 1 ? "স্থায়ী ঠিকানা " : "Permanent Address"); 
    $label_13 =  ($lang == 1 ? "জাতীয় পরিচয় পত্রের নম্বর" : "NID"); 
    $label_14 =  ($lang == 1 ? "রেফারেন্স" : "Reference"); 
	
	?>
<!--  -------------------------------------------------------------------------------------------------------------------- -->
<!--  লেবেলের ভাষান্তর করা শেষ -->
<!--  -------------------------------------------------------------------------------------------------------------------- --> 



<form class="bs-example form-horizontal" >
    <fieldset>
    <legend><?php echo $page_title;?></legend>	
        
        
        <div class="form-group">
			<div class = 'col-lg-6'>
				<div class="input-group margin-bottom-sm">
					<span class="input-group-addon input-group-addon-2x input-label"><i class="fa fa-user"></i> <?=$label_2;?></span>
						<select name = 'c1' class = 'form-control employee '>
							<option></option>
						</select>
				</div>                  
			</div>
		</div>
			
        <div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                        <?php echo $label_4; ?>
                    </span>
                    <input type="text"  name = 'd2'  class="form-control date " />
                </div>
            </div>
        </div>

        
        <div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i>
                        <?php echo $labela_2; ?>
                    </span>
                    <input type="text" name = 'v2' value = '<?php echo req('v2'); ?>'   class="form-control "  />
                </div>
            </div>
        </div>

     
        <div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i ></i>
                        <?php echo $labela_4; ?>
                    </span>
                    <?php $det = $qur->custom_select_query("SELECT idpost,iddivision,division_name,post_name FROM post LEFT JOIN division USING(iddivision) ORDER BY division_priority DESC, division_name, post_name;"); ?>
                    <select   name = 'v4'  class="form-control  numeric integer"  >
										<option></option>
										<?php 
											echo "<optgroup label = '".$det[0][2]."'>";

											$pd = $det[0][1];
											$i = 0;
										foreach($det as $d){
											if($pd == $d[1]){
												echo "<option value = '".$d[0]."' >".$d[3]."</option>";
											}
											else{
												echo "</optgroup>";
												echo "<optgroup label = '".$d[2]."'>";
												$pd = $d[1];
												echo "<option value = '".$d[0]."' >".$d[3]."</option>";
											}
										}
	

										?>
										</optgroup>
                    </select>
                </div>
            </div>
        </div>

		
        <div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i>
                        <?php echo $labela_3; ?>
                    </span>
                    <input readonly type="text" name = 'v3' value = '<?php echo req('v3'); ?>'   class="form-control optional"  />
                </div>
            </div>
        </div>

        
        <div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i>
                        <?php echo $label_5; ?>
                    </span>
                    <input type="text" name = 'd3' value = '<?php echo req('d3'); ?>'   class="form-control positive numeric"  />
                </div>
            </div>
        </div>

      
        <div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                        <?php echo $label_8; ?>
                    </span>
                    <input type="text"  name = 'd6'  class="form-control date " />
                </div>
            </div>
        </div>

     
        <div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i>
                        <?php echo $label_7; ?>
                    </span>
                    <input readonly type="text" name = 'd5'  class="form-control optional"  />
                </div>
            </div>
        </div>
		
	
		<div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i>
                        <?php echo $label_9; ?>
                    </span>
                    <input type="text" name = 'v9'  class="form-control"  />
                </div>
            </div>
        </div>
		
		<div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                        <?php echo $label_10; ?>
                    </span>
                    <input type="text"  name = 'v10'  class="form-control date " />
                </div>
            </div>
        </div>
		
		<div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i>
                        <?php echo $label_11; ?>
                    </span>
                    <input type="text" name = 'v11'  class="form-control"  />
                </div>
            </div>
        </div>
		<div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i>
                        <?php echo $label_12; ?>
                    </span>
                    <input type="text" name = 'v12'  class="form-control"  />
                </div>
            </div>
        </div>
		
		<div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i>
                        <?php echo $label_13; ?>
                    </span>
                    <input type="text" name = 'v13'  class="form-control"  />
                </div>
            </div>
        </div>
		
		
        <div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i>
                        <?php echo $label_6; ?>
                    </span>
                    <input type="text" name = 'd4'   class="form-control "  />
                </div>
            </div>
        </div>
		<div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i>
                        <?php echo $label_14; ?>
                    </span>
                    <input type="text" name = 'v14'   class="form-control "  />
                </div>
            </div>
        </div>
        
        <div class="form-group">
            <div class = 'col-lg-12'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i>
                        <?php echo $label_3; ?>
                    </span>
                    <input type="text" name = 'd1' value = '<?php echo req('d1'); ?>'   class="form-control"  />
                </div>
            </div>
        </div>

                            
        <div class="form-group">
            <div class = 'col-lg-12'>
                
				<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i> <?php echo ($lang ? "সংরক্ষন" : "Save"); ?> </button>
                
            </div>
        </div>

    </fieldset>    
</form>