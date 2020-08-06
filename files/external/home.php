<!DOCTYPE html>
<html>
<head>
<style>
  body {
    background-image: url(/img/background/background10.png);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center; 
    background-attachment: fixed;
  }
  h6, p {
    color: white;
  }
  .card {
    background-color: #00141a; 
    box-shadow: inset 0px 0px 25px 5px #004e66;
  }
  .time {
    color: #ffffff; 
    font-size: 15px;
  }
  .online {
    color: green;
  }
</style>
</head>
<body>
     <div id="main">
        <div class="container">
          <div class="row">
            <?php require_once(INCLUDES . 'data.php'); ?>
            <div class="center"><span style="color: green; font-size: 15x;"><b>PLAYERS ONLINE : <a style="color: green"><?php echo Socket::Get('OnlineCount', array('Return' => 0)); ?></a></b></span></div>
            <div class="col s12" style="width: 50%;"> 
              <div class="card white-text" style="box-shadow: inset 0px 0px 25px 5px #004e66;"> 
                <div class="row"> 
                  <div class="col s12"> 
                    <div class="padding-15"> 
                      <img src="/img/avatar2.png"> 
                      <div class="inline-right">
                        <h6><?php echo $player['pilotName']; ?></h6>
                        <p>Clan: <?php echo ($player['clanId'] == 0 ? 'Free Agent' : $mysqli->query('SELECT name FROM server_clans WHERE id = '.$player['clanId'].'')->fetch_assoc()['name']);?></p>
                        <p>Rank: <img src="<?php echo DOMAIN; ?>img/ranks/rank_<?php echo $player['rankId']; ?>.png"> <?php echo Functions::GetRankName($player['rankId']); ?></p>
                        <p>ID: <?php echo $player['userId']; ?></p>
                        <p>Premium: <span class="material-icons" style="color: green;">done_outline</span></p> 
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
 <div class="col s12" style="width: 50%"> 
  <div class="card white-text" style="box-shadow: inset 0px 0px 25px 5px #004e66;"> 
    <div class="row">
      <div class="col s12"> 
        <div class="padding-15"> 
          <h5 style="text-align: center;">
            <span style="color: white; font-size: 29px;"><b>EVENT'S TIME</b></span></h5> 
              <hr> 
                <p>
                  <div class="time center"><b><r><?php date_default_timezone_set("Europe/Rome"); echo "Server time: " . date("H:i"); ?></b></r></div>
                    <br> - From Monday to Friday : <b style="color: yellow">SPACEBALL</b>
                    <br> - Sunday : <b style="color: yellow">2 HITAC'S</b>
                    <br> - Saturday : <b style="color: yellow">DOUBLE REWARD'S</b>
                </p>
        </div> 
      </div> 
    </div> 
  </div> 
</div>
          <div class="col s6">
            <div class="card" style="box-shadow: inset 0px 0px 25px 5px #004e66;">
            <div class="padding-15"> 
              <h5 style="background-color: transparent; text-align: center;">
                <a  href="<?php echo DOMAIN; ?>halloffame" style="color: white"><i class="material-icons">emoji_events</i> HALL OF FAME</a>
              </h5> 
              <ul class="tabs darken-3 tabs-fixed-width tab-demo z-depth-1" style="background-color: transparent;"> 
                <li class="tab">
                  <a style="color: white" href="#pilots" class="active" >PILOTS</a>
                </li> 
                <li class="tab">
                  <a style="color: white" href="#clans" class="">CLANS</a>
                </li> 
                <li class="indicator" style="left: 300px; right: 300px;"></li>
              </ul> 
                <div id="pilots" class="active" style="display: block"> 
                  <table> 
                    <thead> 
                      <tr style="color: white"> 
                      <th style="text-align: center;">#</th> 
                      <th style="text-align: center;">Name</th> 
                      <th style="text-align: center;">Company</th> 
                      <th style="text-align: center;">Rank</th> 
                      <th style="text-align: center;">Value</th> 
                      </tr> 
                    </thead>
                    <tbody >
                        <?php foreach ($mysqli->query('SELECT * FROM player_accounts WHERE rankId != 21 AND rank > 0 ORDER BY rank ASC LIMIT 9') as $value) { ?>
                        <tr  style="color: white">
                          <td style="text-align: center;"><?php echo $value['rank']; ?>.</td>
                          <td style="text-align: center;"><?php echo $value['pilotName']; ?></td>
                          <td style="text-align: center;"><img src="/img/companies/logo_<?php echo($value['factionId'] == 1 ? 'mmo' : ($value['factionId'] == 2 ? 'eic' : 'vru')); ?>_mini.png"></td>
                          <th style="text-align: center;"><img src="img/ranks/rank_<?php echo $value['rankId']; ?>.png"></th>
                          <td style="text-align: center;"><?php echo $value['rankPoints']; ?></td>
                        </tr>
                      <?php } ?>
                      <?php if ($player['rank'] > 9) { ?>
                      <tr style="color: white;">
                          <td style="text-align: center;"><?php echo $player['rank']; ?>.</td>
                          <td style="text-align: center;"><?php echo $player['pilotName']; ?></td>
                          <td style="text-align: center;"><img src="/img/companies/logo_<?php echo($player['factionId'] == 1 ? 'mmo' : ($player['factionId'] == 2 ? 'eic' : 'vru')); ?>_mini.png"></td>
                          <th style="text-align: center;"><img src="img/ranks/rank_<?php echo $player['rankId']; ?>.png"></th>
                          <td style="text-align: center;"><?php echo $player['rankPoints']; ?></td>
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
                        <?php foreach ($mysqli->query('SELECT * FROM server_clans WHERE rank > 0 ORDER BY rank ASC LIMIT 9') as $value) { ?>
                        <tr style="color: white">
                          <td style="text-align: center;"><?php echo $value['rank']; ?>.</td>
                          <td><a href="<?php echo DOMAIN; ?>clan/clan-details/<?php echo $value['id']?>">[<?php echo $value['tag']; ?>] <?php echo $value['name']; ?></a></td>
                          <td style="text-align: center;"><?php echo $value['rankPoints']; ?></td>
                        </tr>
                        <?php } ?>
                        <?php if (isset($clan) && $clan['rank'] > 9) { ?>
                          <tr style="color: white">
                            <td style="text-align: center;"><?php echo $clan['rank']; ?></td>
                            <td style="text-align: center;">[<?php echo $clan['tag']; ?>] <?php echo $clan['name']; ?></td>
                            <td style="text-align: center;"><?php echo $clan['rankPoints']; ?></td>
                          </tr>
                        <?php } ?>
                      </tbody>
                    </table>
                  </div>
                </div>
               </div>
              </div>
              <div class="col s6"> 
                <div class="card white-text" style="box-shadow: inset 0px 0px 25px 5px #004e66;"> 
                   <div class="padding-15"> 
                    <h5 style="text-align: center;">
                     <span style="color: white; font-size: 29px;"><b>IMPORTANT THING'S</b></span>
                    </h5> 
                        <hr>
                       <p>
                        <b> - Server Link's:</b>
                        <a href="https://discord.gg/eTNPM9E"><img src="do_img/global/items/discord-logo.png"></a>|
                        <a href="https://www.youtube.com/channel/UCcNcpjZXSZabDLxwb5XkENA/" target="_blank"><img src="do_img/global/items/youtube-logo.png"></a>
                        |
                        <a href="https://elitepvpers.com/" target="_blank"><img src="do_img/global/items/elitepvpers-logo.png"></a>
                        |
                        <a href="#" target="_blank"><img src="do_img/global/items/facebook-logo.png"></a>
                        <hr>
                        <h5 style="text-align: center; color: red;"><br><b>ABOUT DONATION'S</b></h5></b>
                        <h6> - Just if you want to <b style="color: green">HELP</b> the server.</h6>
                        <h6> - Player's who will donate, will get <b style="color: red">NOTHING!</b> Because this server is not <b style="color: red;">PAY TO WIN</b>.</h6>
                        <h6> - All money will be spent on stuff for server.</h6>
                        <hr>
                        <br>
                        <h5 class="center">Contact me on <b style="color: lightblue">DISCORD</b>: Adelin#1861</h5>
                       </p> 
                     </div>
                   </div>
                 </div>

</body>
</html>
