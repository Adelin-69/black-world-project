 <style>
    .card {
    background-color: #00141a; 
    box-shadow: inset 0px 0px 25px 3px #004e66;
  }
 </style>
 <div class="col s12">
  <div id="data" class="card white-text">
    <div class="row center no-margin">
      <div class="col s3">
        <img src="do_img/global/items/uridium.png" title="Uridium"> : <span id="uridium"><?php echo number_format($data->uridium, 0, ',', '.'); ?></span>
      </div>
      <div class="col s3">
        <img src="do_img/global/items/credits.png" title="Credits"> : <span id="credits"><?php echo number_format($data->credits, 0, ',', '.'); ?></span>
      </div>
      <div class="col s3">
        <img src="do_img/global/items/honor.png" title="Honor"> : <span><?php echo number_format($data->honor, 0, ',', '.'); ?></span>
      </div>
      <div class="col s3">
        <img src="do_img/global/items/experience.png" title="Experience"> : <span><?php echo number_format($data->experience, 0, ',', '.'); ?></span>
      </div>
    </div>
  </div>
</div>
