<style>
  body {
    background-image: url(/img/background/background10.png);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center; 
    background-attachment: fixed;
  }
    div.card {
    box-shadow: inset 0px 0px 6px 5px #00ccff;
  }
</style>
      <div id="main">
        <div class="container">
          <div class="row">
            <?php require_once(INCLUDES . 'data.php'); ?>

            <div class="col s12">
              <div class="card white-text black center padding-15">
                <h5>HALL OF FAME</h5>
                  <a style="color: white">TOP 100 PILOTS | PILOTS KILLS | CLANS</a>
                  <hr>
                <ul class="tabs darken-3 tabs-fixed-width tab-demo z-depth-1" style="background-color: transparent;"> 
                <li class="tab">
                  <a style="color: white" href="#pilots" class="active" >PILOTS</a>
                </li> 
                <li class="tab">
                  <a style="color: white" href="#pilotskills" class="">PILOTS KILLS</a>
                </li> 
                <li class="tab">
                  <a style="color: white" href="#clans" class="">CLANS</a>
                </li>
                <li class="indicator" style="left: 500px; right: 500px;"></li>
              </ul> 
                <div id="pilots" class="active" style="display: block">
                  <table> 
                    <thead> 
                      <tr style="color: white"> 
                      <th style="text-align: center;">#</th> 
                      <th>Name</th> 
                      <th>Company</th> 
                      <th>Rank</th> 
                      <th>Value</th> 
                      </tr> 
                    </thead>
                    <tbody >
                        <?php foreach ($mysqli->query('SELECT * FROM player_accounts WHERE rankId != 21 AND rank > 0 ORDER BY rank ASC LIMIT 100') as $value) { ?>
                        <tr  style="color: white;">
                          <td style="text-align: center;"><?php echo $value['rank']; ?>.</td>
                          <td><?php echo $value['pilotName']; ?></td>
                          <td><img src="/img/companies/logo_<?php echo($value['factionId'] == 1 ? 'mmo' : ($value['factionId'] == 2 ? 'eic' : 'vru')); ?>_mini.png"></td>
                          <th><img src="img/ranks/rank_<?php echo $value['rankId']; ?>.png"></th>
                          <td><?php echo $value['rankPoints']; ?></td>
                        </tr>
                      <?php } ?>
                      </tbody>
                    </table>
                </div>
                <div id="pilotskills" style="display: block">
                  <table> 
                    <thead> 
                      <tr style="color: white"> 
                      <th style="text-align: center;">#</th> 
                      <th>Name</th> 
                      <th>Company</th> 
                      <th>Rank</th> 
                      <th>Kills</th> 
                      </tr> 
                    </thead>
                    <tbody >
                        <?php foreach ($mysqli->query('SELECT * FROM player_accounts WHERE rankId != 21 AND rank > 0 ORDER BY rank ASC LIMIT 100') as $value) { ?>
                        <tr  style="color: white;">
                          <td style="text-align: center;"><?php echo $value['rank']; ?>.</td>
                          <td><?php echo $value['pilotName']; ?></td>
                          <td><img src="/img/companies/logo_<?php echo($value['factionId'] == 1 ? 'mmo' : ($value['factionId'] == 2 ? 'eic' : 'vru')); ?>_mini.png"></td>
                          <th><img src="img/ranks/rank_<?php echo $value['rankId']; ?>.png"></th>
                          <td><?php echo $value['kills']; ?></td>
                        </tr>
                      <?php } ?>
                      </tbody>
                    </table>
                </div>
                <div id="clans">
                    <table>
                      <thead>
                        <tr  style="color: white">
                          <th style="text-align: center;">#</th>
                          <th>Name</th>
                          <th style="text-align: center;">Value</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php foreach ($mysqli->query('SELECT * FROM server_clans WHERE rank > 0 ORDER BY rank ASC LIMIT 100') as $value) { ?>
                        <tr style="color: white">
                          <td style="text-align: center;"><?php echo $value['rank']; ?>.</td>
                          <td><a href="<?php echo DOMAIN; ?>clan/clan-details/<?php echo $value['id']?>">[<?php echo $value['tag']; ?>] <?php echo $value['name']; ?></a></td>
                          <td style="text-align: center;"><?php echo $value['rankPoints']; ?></td>
                        </tr>
                        <?php } ?>
                        <?php if (isset($clan) && $clan['rank'] > 100) { ?>
                          <tr style="color: white">
                            <td style="text-align: center;"><?php echo $clan['rank']; ?></td>
                            <td style="text-align: center;">[<?php echo $clan['tag']; ?>] <?php echo $clan['name']; ?></td>
                            <td style="text-align: center;"><?php echo $clan['rankPoints']; ?></td>
                          </tr>
                        <?php } ?>
                      </tbody>
                    </table>
                </div>
                <br>
              </div>
           </div>
          </div>
        </div>
      </div>

      <div id="modal" class="modal grey darken-4 white-text">
      </div>
