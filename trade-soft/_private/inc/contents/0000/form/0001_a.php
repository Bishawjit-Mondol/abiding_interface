<?
	$l1 = ($lang?"ইউনিটের নাম":"Unite's Name");
	$l2 = ($lang?"যোগ করুন":"Submit");
?>
<div class="row">
  <div class="col-lg-6">
    <div class="box-primary">
      <div id = "head<?=$_REQUEST['sub'];?>">
	<h3></h3>
      </div>
      <div>
	<form>
	    <div class="form-group">
	      <div class = 'col-lg-12'>
		<div class="input-group margin-bottom-sm">
		  <span class="input-group-addon"><?=$l1;?></span>
		  <input class="form-control" name = 'v1' type="text" /> 
		</div>                   
	      </div>     
	    </div>
	    <div class="form-group">
	      <div  class="col-lg-12">
		<button type = 'button' class="btn btn-primary btn-submit-form"><?=$l2;?></button>
	      </div>
	    </div>
	</form>
      </div>
    </div>
  </div>
</div>

