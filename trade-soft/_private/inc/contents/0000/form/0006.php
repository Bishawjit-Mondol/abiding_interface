<?
	$label_1 =  ($lang == 1 ? "বিভাগের নাম" : "Division Name");
	$label_2 =  ($lang == 1 ? "বিভাগের প্রাধান্যতা " : "Division Priority"); 
	$label_3 =  ($lang == 1 ? "যোগ করুন" : "Add");

?>

                <form class="bs-example form-horizontal link">
                    <fieldset>
                       <legend><?=$page_title;?></legend>
					  
                        <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label"><?=$label_1;?></span>
								  <input class="form-control" name = 'v1' type="text" /> 
								</div>                  
							</div>     
					   </div>
					   <div class="form-group">
							<div class = 'col-lg-12'>
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon input-group-addon-2x input-label"><?=$label_2;?></span>
									<select name="v2" class = 'form-control optional'>
										<option></option>
									<?
									for($i=0;$i<=100;$i++)
									{
										echo "<option value=".$i.">".$i."</option>";
									}
									?>
									</select>
								</div>                   
							</div>     
						</div>
                        <div class="form-group">
                            <div class="col-lg-12">
                                <button type="button" class="btn btn-primary btn-submit-form"><i class="fa fa-save"></i> Save</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            