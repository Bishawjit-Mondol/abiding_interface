<?

    $label_1 =  ($lang == 1 ? "তারিখ " : "Date");
	
	$label_2 =  ($lang == 1 ? "গ্রহীতা " : "Reciver"); 
	$label_3 =  ($lang == 1 ? "লোনদেনের বাবদ " : "Transaction Head");   

	$label_4 =  ($lang == 1 ? "মন্তব্য " : "Comments");   
	$label_5 =  ($lang == 1 ? "মূল্যছাড় " : "Discount");   
	$label_6 =  ($lang == 1 ? "মোট" : "Total");   

	
	$id = req('id');
	
	if($id){
		$query = "CALL ___view_transaction(1);";
		
		$det = $qur->custom_select_query($query);

		if( $det[0][4] > 0  ){
			$label_2 =  ($lang == 1 ? "পরিশোধকারী " : "Payment By");
	        $page_subtitle = ($lang ?   "মানি রিসিপ্ট নং  ".cb($inp,$id) : "Money Recipt No ".$id );
	        $page_title =  ($lang ?   "মানি রিসিপ্ট" : "মানি রিসিপ্ট" );
		}
		else{
			$label_2 =  ($lang == 1 ? "গ্রহনকারী " : "Recived By");
	        $page_subtitle = ($lang ? "ভাউচার নং  ".cb($inp,$id) : "Vouchar Recipt No ".$id );
    	    $page_title =  ($lang ?   "ভাউচার" : "Vouchar" );			
		}			
	}
	
?>
<?
    if(!req('type')){

        echo "<div class = 'page_head' id = 'page_head".req('sub')."' style='display:none'>$page_title</div>";
    }
?>

<div class="col-lg-6">
    <div class="panel panel-primary">
        <div class="panel-heading" id = "head<?=$_REQUEST['sub'];?>">
            <span class = 'page-title'><?=$page_title;?></span>
        </div>
        <div class="panel-body">
            <div class="well">
            	<? if($id){ ?>
                <form class="bs-example form-horizontal link<?=$_REQUEST['sub'];?>" id = "form<?=$_REQUEST['sub'];?>">
                    <fieldset>
                        <legend><?=$page_subtitle;?></legend>
                
	                        <div class="form-group">

								<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><?=$label_1;?> : <?=dateconvert($det[0][3]);?></span>
									  
									</div>                   
								</div>     
								
								<div class = 'col-lg-6'>
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'glyphicon glyphicon-user' ></i> <?=$label_2;?> : <?=$det[0][2];?></span>
									  
									</div>                   
								</div>     
							</div>
							
	                        <div class="form-group pur-data-form" >
 
	                            <div  class="col-lg-4">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'glyphicon glyphicon-shopping-cart'></i></span>
									  <input type = 'text' readonly value = '<?=$det[$i][8];?>' class = 'form-control' />
									</div>                   
	                            </div>

                            	<div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-archive'></i></span>
						               <input type = 'text' name = 'pur_quantity_<?=$i;?>' readonly value = '<?=$det[$i][10];?>'  class = 'form-control' />  									
									</div>                   
	                            </div>

	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-suitcase' ></i> <?=$det[$i][11];?></span>
									</div>                   
	                            </div>

                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><i class = 'fa fa-money'></i></span>
						               <input type = 'text' name = 'pur_cost_<?=$i;?>' value = '<?=$det[$i][9];?>' readonly  class = 'form-control' />  									
									</div>                   
                            </div>

                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon">৳</span>
						               <input type = 'text'  readonly value = <?=sprintf("%.2f",$det[$i][10]*$det[$i][9]);?>  class = 'form-control' />  									
									</div>                   
                            </div>


	                        </div>
	                        
	                        <div class="form-group">


	                            <div  class="col-lg-10">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"><?=($lang? ' মন্তব্য' :' Comments');?></span>
						               <input type = 'text' readonly value = '<?=$det[0][3];?>'  class = 'form-control' />  									
									</div>                   
	                            </div>
	                            
	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon">৳</span>
									  <? $subtotal = $det[0][5] + $det[0][7] - $det[0][12]; ?>
						               <input type = 'text'  readonly value = <?=sprintf("%.2f", $subtotal );?>  class = 'form-control' />  									

						            </div>                   
	                            </div>
	                            
	                        </div>
	                        
	                        <div class="form-group">
	                        		                        	
	                            <div  class="col-lg-9">
									<div class="input-group margin-bottom-sm">
									  <span class="input-group-addon"> &nbsp; <?=($lang? ' সর্ব মোট' :'  Total');?></span>
									  <span class="input-group-addon">:</span>
	  				                  <span class="input-group-addon"><?=($lang? ' মোট' :'  Sub Total');?> - <?=($lang? ' মূল্যহৃাস' :'  Discount');?>  + <?=($lang? ' পরিবহন' :'  Transport');?> </span>
									  <span class="input-group-addon"><?=$subtotal;?> - <?=$det[0][7];?> + <?=$det[0][12];?></span>
	  				                </div>                   
	                            </div>
	                            <div  class="col-lg-1">
									<div class="input-group margin-bottom-sm">
	  				    			  <span class="input-group-addon"> = </span>
									</div>                   
	                            </div>
	                            <div  class="col-lg-2">
									<div class="input-group margin-bottom-sm">
	  				    			  <span class="input-group-addon"> <?=$det[0][5];?> </span>             			
									</div>                   
	                            </div>

	                        </div>
                    </fieldset>
                </form>
                
                <? }else{ ?>
					<div class='alert alert-danger' >
						<?=($lang?"অাপনি বিল রিফ্রেশ করতে পারবেন না": "You can not refresh bill.");?>
					</div>
                <? } ?>
                
            </div>
        </div>
    </div>
</div>
