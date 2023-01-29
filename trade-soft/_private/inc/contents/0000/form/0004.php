<?
	$label_1 =  ($lang == 1 ? "ইউনিটের নাম" : "Unite Name"); 

	$label_2 =  ($lang == 1 ? "যোগ করুন" : "Add");

?>

                <form class="bs-example form-horizontal">
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
                            <div  class="col-lg-4">
					
					<button type="button" class="btn btn-primary btn-submit-form btn-submit" save-type = "1" ><i class="fa fa-thumbs-up"></i><?php echo $label_2 ; ?></button>
					 </div>	
                        </div>



                    </fieldset>
                </form>
            
