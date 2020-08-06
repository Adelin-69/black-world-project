<?php

$mysqli = Database::GetInstance();

if(isset($_POST["title"]) && !(empty($_POST["title"])))
{
  $title = $_POST["title"];
  if(Socket::Get('IsOnline', array('UserId' => $player['userId'], 'Return' => false)))
  {
    Socket::Send('ChangeTitle', array('UserId' => $player['userId'], 'Title' => $title));
  }else
  {
    $mysqli->query("UPDATE player_accounts SET title = '".$title."' WHERE userId = ".$player['userId']);
  }
  $msg = "Title changed succesfully!";
}

?>


<html>
<style>
  body {
    background-image: url(/img/background/background10.png);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center; 
    background-attachment: fixed;
  }
  div.card {
    font-weight: bold;
    background-color: #00141a; 
    box-shadow: inset 0px 0px 25px 3px #004e66;
  }
</style>
      <div id="main">
        <div class="container">
          <div class="row">
            <div class="col s12">
              <div class="card white-text padding-15">
                <h5>SETTINGS</h5>
                  <div class="row">
                    <div class="col s12 l6">
                      <form id="change_pilot_name" method="post">
                        <div class="col s12">
                          <div class="row">
                            <div class="input-field col s9">
                              <i class="material-icons prefix">person</i>
                              <input class="white-text" type="text" name="pilotName" id="pilotName" value="<?php echo Functions::s($player['pilotName']); ?>" maxlength="20" autocomplete="off" required>
                              <label for="pilotName" style="color: white"y>Pilot Name</label>
                              <span class="helper-text white-text" data-error="Enter a valid pilot name!">Enter your new pilot name.</span>
                            </div>
                            <div class="input-field col s3">
                              <button class="btn green waves-effect waves-light col s12">CHANGE</button>
                            </div>
                          </div>
                        </div>
                      </form>
                      <div class="input-field col s12">
                        <div class="switch">
                          <label style="color: #fff; font-size: 16px;">
                            2D
                            <input type="checkbox" name="version" <?php echo $player['version'] ? 'checked' : ''; ?>>
                            <span class="lever"></span>
                            3D
                          </label>
                        </div>
                      </div>
                      <div>Change Your Title</div>
                        <div>
                           <form action="/settings" method="POST">
                           <select id="title" name="title">
                           <option value="title_3">Cringe</option>
                           <option value="title_4">Youtube Legend</option>
                           <option value="title_5">AU! AU! AU!</option>
                           <option value="title_7">Legend</option>
                           <option value="title_8">Newbie</option>
                           <option value="title_9">Most Wanted</option>
                           <option value="title_10">V.I.P</option>
                           <option value="title_12">Most Hated</option>
                           <option value="title_15">Spring Fighter MMO</option>
                           <option value="title_16">Spring Fighter VRU</option>
                           <option value="title_17">Spring Fighter EIC</option>
                           <option value="title_18">The Reaper</option>
                           <option value="title_19">Boss of Bosses</option>
                           <option value="title_20">Godfather</option>
                           <option value="title_21">Supernova</option>
                           <option value="title_22">Butcher</option>
                           <option value="title_23">30 second battle</option>
                           <option value="title_51">Most Wanted</option>
                           <option value="title_205">Boss of Bosses</option>
                           <option value="title_304">Godfather</option>
                           <option value="title_308">Expert</option>
                           <option value="title_309">Legend</option>
                           </select>
                            <div class="input-field col s3">
                              <button class="btn green waves-effect waves-light col s12">CHANGE</button>
                            </div>
                         </form>
                       </div>
                       <?php if(isset($msg)) echo $msg;?>
                    </div>
                  </div>
              </div>
           </div>
          </div>
        </div>
      </div>
</html>