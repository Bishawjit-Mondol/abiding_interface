<?
	$l1 = ($lang?"ইউনিটের নাম":"Unite's Name");
	$l2 = ($lang?"যোগ করুন":"Submit");
?>
<div class="col-lg-6">
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




                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
