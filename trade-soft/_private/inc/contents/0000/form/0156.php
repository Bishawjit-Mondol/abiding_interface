
<?php
    $labela_1 =  ($lang == 1 ? "অনুবাদ 0 " : "idstaff"); 
    $labela_2 =  ($lang == 1 ? "কর্মকর্তা / কর্মচারীর নাম " : "Employee Name"); 
    $labela_3 =  ($lang == 1 ? "প্রারম্ভিক ব্যালেন্স " : "Opening Balance"); 
    $labela_4 =  ($lang == 1 ? "পদবী " : "Designation"); 
    $labela_4a =  ($lang == 1 ? "বিভাগ " : "Division"); 
    $labela_5 =  ($lang == 1 ? "কর্মকর্তা / কর্মচারী যোগ করুন" : "Add Employee"); 
    
    $label_3 =  ($lang == 1 ? "মন্তব্য " : "Remarks"); 
    $label_4 =  ($lang == 1 ? "নিবন্ধনের তারিখ" : "Registartion Date"); 
    $label_5 =  ($lang == 1 ? "কমিশনের হার " : "Incentive Rate"); 
    $label_6 =  ($lang == 1 ? "মোবাইল নম্বর" : "Cell Phone"); 
    $label_7 =  ($lang == 1 ? "বেতন" : "Salary"); 
    $label_8 =  ($lang == 1 ? "যোগদানের তারিখ" : "Joning Date"); 
	
	$label_9 =   ($lang == 1 ? "পিতা " : "Father's Name"); 
    $label_10 =  ($lang == 1 ? "জন্ম তারিখ" : "DOB"); 
    $label_11 =  ($lang == 1 ? "শিক্ষাগত যোগ্যতা" : "Educational Qualification"); 
    $label_12 =  ($lang == 1 ? "স্থায়ী ঠিকানা " : "Permanent Address"); 
    $label_13 =  ($lang == 1 ? "জাতীয় পরিচয় পত্রের নম্বর" : "NID"); 
    $label_14 =  ($lang == 1 ? "রেফারেন্স" : "Reference"); 
	
	$id = req('id');
	$staff = $qur->custom_select_query("SELECT idstaff, staff_name, staff_balance, staff_ob, staff_comments, staff_reg_date, staff_comission, staff_mobile, staff_sallary, father_name, dob, education, permantnt_address, nid, reference, post_name, division_name, staff_joining_date
		FROM ( SELECT * FROM staff WHERE idstaff=$id) as a LEFT JOIN staff_details USING(idstaff) LEFT JOIN post USING(idpost) LEFT JOIN division USING(iddivision);");
	?>


<form class="bs-example form-horizontal" >
    <fieldset>
    <legend><?php echo $page_title;?></legend>	
        
      
        <div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <?php echo $label_4; ?> </span>
						<input readonly type="text"  name = 'd2' value = '<? echo date('d-m-Y',strtotime($staff[0][5])); ?>' class="form-control date " />
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
                    <input readonly type="text" name = 'v2' value = '<? echo $staff[0][1]; ?>'   class="form-control "  />
                </div>
            </div>
        </div>

    
        <div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i ></i> <?php echo $labela_4; ?> </span>
						<input readonly type="text" name = 'v3' value = '<? echo $staff[0][15]; ?>'  class="form-control"  />
                </div>
            </div>
        </div>
		<div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i ></i> <?php echo $labela_4a; ?> </span>
						<input readonly type="text" name = 'v3' value = '<? echo $staff[0][16]; ?>'  class="form-control"  />
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
                    <input readonly type="text" name = 'v3' value = '<? echo $staff[0][3]; ?>'  class="form-control  numeric"  />
                </div>
            </div>
        </div>

        
        <div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i> <?php echo $label_5; ?> </span>
						<input readonly type="text" name = 'd3' value = '<? echo $staff[0][6]; ?>'  class="form-control positive numeric"  />
                </div>
            </div>
        </div>

      
        <div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <?php echo $label_8; ?> </span>
						<input readonly type="text"  name = 'd6' value = '<? echo date('d-m-Y',strtotime($staff[0][17])); ?>' class="form-control date " />
                </div>
            </div>
        </div>

     
        <div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i> <?php echo $label_7; ?> </span>
						<input readonly type="text" name = 'd5' value = '<? echo $staff[0][8]; ?>' class="form-control positive numeric"  />
                </div>
            </div>
        </div>
		
		
		<div class="form-group">
            <div class = 'col-lg-6'>
                <div class="input-group margin-bottom-sm">
                    <span class="add-on input-group-addon input-group-addon-2x">
                        <i class=""></i> <?php echo $label_9; ?> </span>
						<input readonly type="text" name = 'v9' value = '<? echo $staff[0][9]; ?>' class="form-control"  />
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
                    <input readonly type="text"  name = 'v10' value = '<? echo date('d-m-Y',strtotime($staff[0][10])); ?>' class="form-control date " />
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
                    <input readonly type="text" name = 'v11' value = '<? echo $staff[0][11]; ?>' class="form-control"  />
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
                    <input readonly type="text" name = 'v12' value = '<? echo $staff[0][12]; ?>' class="form-control"  />
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
                    <input readonly type="text" name = 'v13' value = '<? echo $staff[0][13]; ?>' class="form-control"  />
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
                    <input readonly type="text" name = 'd4' value = '<? echo $staff[0][7]; ?>'  class="form-control "  />
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
                    <input readonly type="text" name = 'v14' value = '<? echo $staff[0][14]; ?>'  class="form-control "  />
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
                    <input readonly type="text" name = 'd1' value = '<? echo $staff[0][4]; ?>' class="form-control"  />
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