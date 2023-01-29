<section class="col-lg-12 connectedSortable">
<div class="row switch-hook">
          <div class="col-lg-6">	 
            <div class="well well-lg" style="overflow:auto">
		
               <div id="reportrange">
               <form class="form-horizontal">
                 <fieldset>
                  <div class="control-group">
                    <div class="controls">
                     <div class="input-prepend input-group">
                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <?php echo ($lang ? "রিপোর্টের সীমা " : "Report Range "); ?> : </span><input type="text" id = 'reportrange' class="form-control" /> 
                     </div>
                    </div>
                  </div>
                 </fieldset>
               </form>


               </div>
            </div>
	  </div>
          <div class="col-lg-6">	 
            <div class="well well-lg" style="overflow: auto">
               <form class="form-horizontal">
                 <fieldset>
                  <div class="control-group">
                    <div class="controls">
                     <div class="input-prepend input-group">
                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i> <?php echo ($lang ? "নতুন এন্ট্রির তারিখ " : "Entry Date "); ?> : </span><input type="text"  name="entryday" id="entryday" class="form-control" value="<?=Date('d-m-Y');?>" /> 
                     </div>
                    </div>
                  </div>
                 </fieldset>
               </form>

            </div>
	  </div>
</div>
<?php if(0){ ?>

                    <!-- Small boxes (Stat box) -->
                    <div class="row switch-hook">
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3>
				      <span>65</span>
                                    </h3>
                                    <p>
                                        Sales
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                </div>
                                <span>
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </span>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3>
                                        <span>65</span>
                                    </h3>
                                    <p>
                                        Stock
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-archive"></i>
                                </div>
                                <span>
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </span>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3>
                                        <span>0.00</span>
                                    </h3>
                                    <p>
                                        Cash & Bank
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-money"></i>
                                </div>
                                <span>
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </span>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3>
                                        <span>65</span>
                                    </h3>
                                    <p>
                                        Profit & Loss
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-pie-graph"></i>
                                </div>
                                <span>
                                    More info <i class="fa fa-arrow-circle-right"></i>
                                </span>
                            </div>
                        </div><!-- ./col -->
                    </div><!-- /.row -->

                    
<? } ?>                    
                    <div class="row">
			<? include '_private/inc/content.php' ?>
                    </div><!-- /.row (main row) -->

</section>
