<?
	$c1 = req('c1') > 0 ?  req('c1') : 0 ;
	$c2 = req('c2')> 0 ?  req('c2') : 0;
	
	$n = $c2/5;
?>
			<div class="bs-example table-responsive ">
			  <table class="table table-striped table-hover report-table">
					<tbody>						
			<? for($i=0; $i<$n;$i++){ ?>
							<tr>
							  <td><? print_barcode($c1, 30, 1 , $qur); ?></td>
							  <td><? print_barcode($c1, 30, 1 , $qur); ?></td>
							  <td><? print_barcode($c1, 30, 1 , $qur); ?></td>
							  <td><? print_barcode($c1, 30, 1 , $qur); ?></td>
							  <td><? print_barcode($c1, 30, 1 , $qur); ?></td>
							</tr>
			<? } ?>
				      </tbody>
				</table>
				<br/>
				<div class="form-group">
						<div class = 'col-lg-6'>
								<div class="input-group margin-bottom-sm">
								  <span class="input-group-addon input-group-addon-2x input-label print-report"><i class = 'fa fa-print'></i> Print Report. Per Page : </span>
								  <input type = 'number' class = 'form-control' min = '5' max='50'  value = '20' />
								</div>                  
							</div>     

						</div>
				</div>
				<br/>
