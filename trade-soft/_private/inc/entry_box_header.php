<? $col_size = $col_size > 0 ? $col_size : 6; ?>
                    
		      <div class="col-lg-<?=$col_size;?>" id = 'window-<?=$_REQUEST['sub'];?>'>                            
                            <div class="box box-solid box-primary">
                                <div class="box-header" id = "head<?=$_REQUEST['sub'];?>">
                                    <h3 class="box-title" style='display:none' > <i class="fa" id = 'head-icon-<?=$_REQUEST['sub'];?>' ></i> <?=$page_title;?></h3>
                                      <div class="box-tools pull-right">
					<button class="btn btn-primary btn-sm data-reload" data-widget="reload"><i class="fa fa-refresh"></i></button>
                                        <button class="btn btn-primary btn-sm data-collapse" data-widget="collapse"><i class="fa fa-compress"></i></button>
                                        <button class="btn btn-primary btn-sm data-remove" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body">
                                            <div class="well">
                        
				<form class="bs-example form-horizontal link<?=$_REQUEST['sub'];?>" id = "form<?=$_REQUEST['sub'];?>" >

				  <fieldset>
				    <legend><?=$page_title;?></legend>
			<div style='display:none' id = 'knob-holder-<?=$_REQUEST['sub'];?>' >
				                                                <input type="text" class="knob"  id = "form-knob-<?=$_REQUEST['sub'];?>" value="0" data-skin="tron"  data-thickness="0.2" data-width="90" data-height="90" data-fgColor="#3c8dbc" data-readonly="true"/>
                                            
                        </div>

			<div class="alert alert-success alert-dismissable" style = 'display:none'>
								<i class="fa fa-check"></i>
								
								<span></span>
								
			</div>
			<div class="alert alert-danger alert-dismissable"  style = 'display:none'>
								<i class="fa fa-ban"></i>
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								<span></span>
								
			</div>
			<div class="alert alert-info alert-dismissable"  style = 'display:none'>
								<i class="fa fa-info"></i>
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								<span></span>
								
			</div>                                
			<div class="notification-button" ></div>
					
