<?php
	$label_2 =  ($lang == 1 ? "কোম্পানির নাম" : "Company"); 
	$label_3 =  ($lang == 1 ? "শোরুম / গুদাম " : "Showroom");
	$label_1 =  ($lang == 1 ? " রিপোর্ট দেখুন" : "  Show Report");
	$label_4 =  ($lang == 1 ? "চালান তারিখ" : "Chalan Date");

?>

                <form class="bs-example form-horizontal">
                    <fieldset>
                       <legend><?php echo ($lang? "নতুন  ":"New ");  echo req('cat_name'); echo ($lang? " চালান":" Chalan "); ?> </legend>
						<div class="form-group">
							<div class = 'col-lg-3'>
								<div class="input-group margin-bottom-sm">
				                       		<span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> 
				                       		<?php echo $label_4;?> </span><input type="text"  name="ch_date"  class="form-control date" />       
		          		           		</div>									
							</div>
							<div class = 'col-lg-3'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon  input-label"><i class="fa fa-user"></i> <?=$label_2;?></span>
								  <select name = 'c1' class = 'form-control client' /></select>
								</div>                  
							</div>
							     
							<div class = 'col-lg-3'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon  input-label"><i class="fa fa-building-o"></i> <?=$label_3;?></span>
								  <select name = 'c2' class = 'form-control showroom godown' /></select>
								</div>                  
							</div>
					    
							<div class = 'col-lg-3'>
								<div class="input-group margin-bottom-sm">
										<button type="button" class="btn btn-primary btn-show-report box-report link<?php echo req('sub'); ?>"  data = "" ><i class="fa fa-files-o"></i><?php echo $label_1;?></button>
								</div>                  
							</div>     

					   </div>
<input type = 'hidden' name = 'cat_id' value = '<? echo req('cat_id'); ?>' />


                    </fieldset>
                </form>
            
