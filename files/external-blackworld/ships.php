<style>
  body {
    background-image: url(/img/background/background10.png);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center; 
    background-attachment: fixed;
  }
    div.card {
    background-color: #00141a; 
    box-shadow: inset 0px 0px 25px 3px #004e66;
  }
</style>
      <div id="main">
        <div class="container">
          <div class="row">
            <?php require_once(INCLUDES . 'data.php'); ?>

            <div class="col s12">
              <div class="card white-text center padding-15">
                <h5>SHIPS</h5>
                <hr> 
                  <div class="ships">
                  <?php
                  $equipment = $mysqli->query('SELECT * FROM player_equipment WHERE userId = '.$player['userId'].'')->fetch_assoc();
                  $ships = json_decode($equipment['items'])->ships;

                  foreach ($ships as $shipId) {
                    $ship = $mysqli->query('SELECT * FROM server_ships WHERE shipID = '.$shipId.'')->fetch_assoc();
                    $currentShip = $mysqli->query('SELECT * FROM server_ships WHERE shipID = '.$player['shipId'].'')->fetch_assoc();
                    $lootId = $currentShip['baseShipId'] != $shipId ? $ship['lootID'] : ($player['shipId'] == 153 ? 'ship_goliath_design_razer' : $currentShip['lootID']);
                    $lootId = str_replace('_', '/', $lootId);
                  ?>
                  <div id="<?php echo $ship['lootID']; ?>" class="ship<?php echo $currentShip['baseShipId'] == $shipId ? ' active' : ''; ?>">
                    <img src="<?php echo DOMAIN; ?>do_img/global/items/<?php echo $lootId; ?>_100x100.png">
                  </div>
                  <?php } ?>
              </div> 
                            </div>
                        </div>
                    </div>
                  </div>

                </div>
              </div>
           </div>
          </div>
        </div>
      </div>
