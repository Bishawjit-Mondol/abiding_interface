<?php 
    $label_1 =  ($lang == 1 ? "অনুবাদ 0 " : "idtransaction_head"); 
    $label_2 =  ($lang == 1 ? "ট্রান্সেকসন হেড নাম " : "Transaction Head Name"); 
    $label_3 =  ($lang == 1 ? "ট্রান্সেকসন হেড ধরন " : "Transaction Head Type"); 
    $label_s = ($lang?"যোগ করুন":"Add");

?>


		<form class="bs-example form-horizontal link">
                    <fieldset>
                        <legend><?=$page_title;?></legend>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon  input-group-addon-2x"><?=$label_2;?></span>
								  <input class="form-control" name = 'v2' type="text" /> 
								</div>                   
							</div>     
						</div>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon  input-group-addon-2x"><?=$label_3;?></span>
					               
							<select name = 'v3'   class = ' form-control' > 
										<option></option>
										<?php $det = $qur->custom_select_query( "SELECT idtransaction_head_type, transaction_head_type_en, transaction_head_type_bn FROM transaction_head_type ORDER BY priority ASC;");  ?>
										<?php foreach($det as $d){ ?>
											<option value = "<?php echo $d[0];?>" ><?php echo $d[1];?></option>
										<?php } ?>	
							</select>

								</div>                   
							</div>     
						</div>

			            <div class="form-group">
                            <div  class="col-lg-6">
				<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i><?php echo ($lang == 1 ? "  যোগ করুন " : " Save");?></button>
                            </div>
            			</div>
                    </fieldset>
                </form>
            
