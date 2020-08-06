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
      <div id="main">
        <div class="container">
          <div class="row">
            <div class="col s12">
              <div class="card center" style="background-color: transparent; margin-top: 25px;">
                <div class="row">
                  <div class="col s4">
                    <h6 style="color: #cc6600"><b>Mars Mining Operations</b></h6>
                    <img class="company mmo" src="<?php echo DOMAIN; ?>img/companies/selection/mmo.jpg">
                  </div>
                  <div class="col s4">
                    <h6 style="color: #1a8cff"><b>Earth Industries Corporation</b></h6>
                    <img class="company eic" src="<?php echo DOMAIN; ?>img/companies/selection/eic.jpg">
                  </div>
                  <div class="col s4">
                    <h6 style="color: green"><b>Venus Resources Unlimited</b></h6>
                    <img class="company vru" src="<?php echo DOMAIN; ?>img/companies/selection/vru.jpg">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
