<?
	$label_1 =  ($lang == 1 ? " সম্পূর্ণ নাম " : "Full Name");
	$label_2 =  ($lang == 1 ? " লগ ইন নাম " : "Login Name"); 
	$label_3 =  ($lang == 1 ? " আগের পাসওয়ার্ড " : "Old Password");
	$label_4 =  ($lang == 1 ? " নতুন পাসওয়ার্ড " : "New Password"); 
	$label_5 =  ($lang == 1 ? " লেভেল " : "Level");
	
	//echo $idstaff.' : '.md5(trim('a'));
	$det = $qur->custom_select_query("SELECT * FROM ___users WHERE iduser=$idstaff;");
?>

                <form class="bs-example form-horizontal" >
                    <fieldset>
                       <legend><?=$page_title;?></legend>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_1;?></span>
								  <input class="form-control" name = 'v1' value='<? echo $det[0][1];?>' type="text" /> 
								</div>                  
							</div>
						</div>
						<div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
								  <input class="form-control" name = 'v2' value='<? echo $det[0][2];?>' type="text" /> 
								</div>                  
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_3;?></span>
								  <input class="form-control" name = 'v3' type="password" /> 
								</div>                   
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_4;?></span>
								  <input class="form-control" name = 'v4' type="password" /> 
								  
								</div>                   
							</div>  
					   </div>
                        <div class="form-group">
                            <div class="col-lg-6">
                             <button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i><?php echo ($lang == 1 ? "নিশ্চিত করুন " : "Confirm"); ?> </button>
                            </div>
                        </div>
						
                    </fieldset>
                </form>
            
