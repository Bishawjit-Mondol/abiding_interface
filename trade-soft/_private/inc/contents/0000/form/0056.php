<?
	$l1 = ($lang?"ক্রেতার নাম":"Customer Name");
	$det  = $qur->custom_select_query("SELECT idcompany, company_name FROM company c;");
?>


                <form class="bs-example form-horizontal link">
                    <fieldset>
                        <legend><?=$page_title;?></legend>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x"><?=$l1;?></span>
								  <? $inp->d2_array_drop_down( "v2", $det, null, "form-0056-v2", "form-control" );?>
								</div>                   
							</div>  
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								<button type = 'button' class=' form-control btn btn-info' id = 'form-0056-v2-ch'>Show</button>                								  
        						</div>
							</div>  
							
						</div>

                    </fieldset>
                </form>
            
			<div id = 'view-0056'>
				<div id = 'view-0056-content'>
				</div>
				<button type = 'button' class='btn btn-info' id = 'view-0056-hider'>Hide</button>
        	</div>    
			<br/>
			<div id = 'content-0056'>
        	</div>    
        






