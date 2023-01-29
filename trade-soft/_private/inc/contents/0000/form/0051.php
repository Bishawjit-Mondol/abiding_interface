<?
	$label_1 = ($lang ? "সরবরাহকারীর নাম" : "Supplier Name" ); 
	$det  = $qur->custom_select_query("SELECT idcompany, company_name FROM company c;");
?>

<div class="col-lg-12">
    <div class="panel panel-primary">
        <div class="panel-heading" id = "head<?=$_REQUEST['sub'];?>">
            <span class = 'page-title'><?=$page_title;?></span>
        </div>
        <div class="panel-body">
           
            <div class="well">
                <form class="bs-example form-horizontal link<?=$_REQUEST['sub'];?>" id = "form<?=$_REQUEST['sub'];?>">
                    <fieldset>
                        <legend><?=$page_title;?></legend>
                        <div class="form-group">
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x"><?=$label_1;?></span>
								  <? $inp->d2_array_drop_down( "v2", $det, null, "form-0051-v2", "form-control" );?>
								</div>                   
							</div>  
							<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								<button type = 'button' class=' form-control btn btn-info' id = 'form-0051-v2-ch'>Show</button>                								  
        						</div>
							</div>  
							
						</div>

                    </fieldset>
                </form>
            </div>
			<div id = 'view-0051'>
				<div id = 'view-0051-content'>
				</div>
				
        	</div>    
			<br/>
			<div id = 'content-0051'>
        	</div>    
        </div>
    </div>
</div>







