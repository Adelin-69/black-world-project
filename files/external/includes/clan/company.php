<style>
  body {
    background-image: url(/img/background/background10.png);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center; 
    background-attachment: fixed;
  }
  #company-select {
  padding: 25px;
  margin-top: 25px;
}

.company {
  width: 250px;
  margin-top: 25px;
}

.mmo, .eic, .vru {
  transition: all 0.1s ease;
}

.mmo:hover, .eic:hover, .vru:hover {
  cursor: pointer;
}

.mmo:hover {
  box-shadow: 0px 0px 50px 20px #6c3d23;
}

.eic:hover {
  box-shadow: 0px 0px 50px 20px #5a7a9c;
}

.vru:hover {
  box-shadow: 0px 0px 50px 20px #409349;
}

@media screen and (max-width: 1280px) {
  .company {
    width: 250px;
  }
}

</style>
<div id="company-select" class="card center" style="background-color: transparent;">
  <div class="row">
    <?php if ($player['factionId'] != 1) { ?>
    <div class="col s6">
      <h6 style="color: #cc6600"><b>Mars Mining Operations</b></h6>
      <img data-faction-name="Mars Mining Operations" class="company mmo modal-trigger" href="#modal" src="<?php echo DOMAIN; ?>img/companies/selection/mmo.jpg">
    </div>
    <?php } ?>
    <?php if ($player['factionId'] != 2) { ?>
    <div class="col s6">
      <h6 style="color: #1a8cff"><b>Earth Industries Corporation</b></h6>
      <img data-faction-name="Earth Industries Corporation" class="company eic modal-trigger" href="#modal" src="<?php echo DOMAIN; ?>img/companies/selection/eic.jpg">
    </div>
    <?php } ?>
    <?php if ($player['factionId'] != 3) { ?>
    <div class="col s6">
      <h6 style="color: green"><b>Venus Resources Unlimited</b></h6>
      <img data-faction-name="Venus Resources Unlimited" class="company vru modal-trigger" href="#modal" src="<?php echo DOMAIN; ?>img/companies/selection/vru.jpg">
    </div>
    <?php } ?>
  </div>
</div>

<div id="modal" class="modal grey darken-4 white-text">
  <div class="modal-content center">
    <h6>%faction_name%</h6>
    <p>Do you really want to switch companies? You will need to pay 500.000 Uridium for this change.</p>
  </div>
  <div class="modal-footer grey darken-4">
    <a class="modal-close waves-effect waves-light btn grey darken-2">Close</a>
    <a id="confirm-company-change" class="modal-close waves-effect waves-light btn grey darken-3">OK</a>
  </div>
</div>
