<?
	$l1 = ($lang?"ইউনিটের নাম":"Unite's Name");
	$l2 = ($lang?"যোগ করুন":"Submit");
?>
<div class="form-group">
  <div class = 'col-lg-12'>
    <div class="input-group margin-bottom-sm">
      <span class="input-group-addon"><?=$l1;?></span>
      <input class="form-control" name = 'v1' type="text" autofocus /> 
    </div>                   
  </div>     
</div>
<div class="form-group">
  <div  class="col-lg-12">
    <button type = 'button' class="btn btn-primary btn-submit-form"><?=$l2;?></button>
  </div>
</div>
