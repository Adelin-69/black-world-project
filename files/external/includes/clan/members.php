<style>
  body {
    background-image: url(/img/background/background10.png);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center; 
    background-attachment: fixed;
  }
</style>
<div class="card white-text padding-15" style="background-color: #00141a; box-shadow: inset 0px 0px 25px 3px #004e66;">
  <h6>CLAN MEMBERS</h6>

  <div id="members" class="row">
    <?php foreach ($mysqli->query('SELECT * FROM player_accounts WHERE clanId = '.$clan['id'].'')->fetch_all(MYSQLI_ASSOC) as $value) { ?>
    <div class="col s12">
      <div id="user-<?php echo $value['userId']?>" class="card white-text padding-5" style="background-color: #00141a;">
        <div class="row">
          <div class="col s4">
            <h6><?php echo $value['pilotName']; ?></h6>
            <p>EP: <?php echo number_format(json_decode($value['data'])->experience); ?></p>
            <p>Rank: <img src="<?php echo DOMAIN; ?>img/ranks/rank_<?php echo $value['rankId']; ?>.png"> <?php echo Functions::GetRankName($value['rankId']); ?></p>
          </div>
          <div class="col s4">
            <p>Joined: <?php echo date('Y.m.d', strtotime(json_decode($clan['join_dates'])->{$value['userId']})); ?></p>
            <p>Function: <?php echo ($value['userId'] == $clan['leaderId'] ? 'Clan leader' : 'Member'); ?></p>
            <p>Position: <?php echo (Socket::Get('IsOnline', array('UserId' => $value['userId'], 'Return' => false)) ? Socket::Get('GetPosition', array('UserId' => $value['userId'])) : ($value['factionId'] == 1 ? '4-1' : ($value['factionId'] == 2 ? '4-2' : '4-3'))); ?></p>
          </div>
          <div class="col s4">
            <p>Company: <?php echo ($value['factionId'] == 1 ? '<font color="red"> MMO' : ($value['factionId'] == 2 ? '<font color="#4d79ff">EIC' : '<font color="green">VRU')); ?></p>
            <?php if ($clan['leaderId'] == $player['userId'] && $value['userId'] == $clan['leaderId']) { ?>
            <a class="delete-clan btn waves-effect waves-light s6 modal-trigger" href="#modal2" style="background-color: red; color: black;"><b>DELETE</b></a>
            <?php } else if ($clan['leaderId'] == $player['userId'] && $value['userId'] != $clan['leaderId']) { ?>
              <a data-user-id="<?php echo $value['userId']?>" class="dismiss-member btn waves-effect waves-light s6 modal-trigger" href="#modal1" style="background-color: red; color: black;"><b>DISMISS CLAN MEMBER</b></a>
            <?php } else if ($clan['leaderId'] != $player['userId'] && $value['userId'] == $player['userId']) { ?>
              <a class="leave-clan btn waves-effect waves-light s6 modal-trigger" href="#modal3" style="background-color: red; color: black;"><b>LEAVE CLAN</b></a>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>
    <?php } ?>
  </div>

  <?php
  $array = $mysqli->query('SELECT * FROM server_clan_applications WHERE clanId = '.$clan['id'].'')->fetch_all(MYSQLI_ASSOC);

  if (count($array) >= 1) {
  ?>

  <h6>APPLICATIONS</h6>

  <div id="applications" class="row">
    <?php
    foreach ($array as $value) {
      $user = $mysqli->query('SELECT * FROM player_accounts WHERE userId = '.$value['userId'].'')->fetch_assoc();
      $userData = json_decode($user['data']);
    ?>
    <div class="col s12">
      <div id="application-user-<?php echo $user['userId']?>" class="card white-text padding-5" style="background-color: #00141a;">
        <div class="row">
          <div class="col s4">
            <h6><?php echo $user['pilotName']; ?></h6>
            <p>EP: <?php echo number_format($userData->experience); ?></p>
          </div>
          <div class="col s4">
            <p>Level: <?php echo Functions::GetLevel($userData->experience); ?></p>
            <p>Company: <?php echo ($user['factionId'] == 1 ? 'MMO' : ($user['factionId'] == 2 ? 'EIC' : 'VRU')); ?></p>
          </div>
          <div class="col s4">
            <p>Date: <?php echo date('Y.m.d', strtotime($value['date'])); ?></p>
            <?php if ($clan['leaderId'] == $player['userId'] && $value['userId'] != $clan['leaderId']) { ?>
            <a data-user-id="<?php echo $user['userId']; ?>" data-user-name="<?php echo $user['pilotName']; ?>" data-user-text="<?php echo $value['text']; ?>" class="view-application btn waves-effect waves-light s6 modal-trigger" href="#modal" style="background-color: yellow; color: black;"><b>VIEW</b></a>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>
    <?php } ?>
  </div>
  <?php } ?>
</div>

<?php if ($clan['leaderId'] == $player['userId']) { ?>
<div id="modal" class="modal white-text" style="background-color: #00141a; box-shadow: inset 0px 0px 25px 3px #004e66;">
  <div class="modal-content center">
    <b style="color: red;">Message:</b><p>%user_text%</p>
  </div>
  <div class="modal-footer" style="background-color: #00141a; box-shadow: inset 0px 0px 25px 3px #004e66;">
    <a id="decline" class="modal-close waves-effect waves-light btn" style="background-color: red; color: black;"><b>Decline</b></a>
    <a id="accept" class="modal-close waves-effect waves-light btn" style="background-color: green; color: black;"><b>Accept</b></a>
  </div>
</div>

<div id="modal1" class="modal white-text" style="background-color: #00141a; box-shadow: inset 0px 0px 25px 3px #004e66;">
  <div class="modal-content center">
    <p style="font-size: 25px;">Dismiss clan member?</p>
  </div>
  <div class="modal-footer" style="background-color: #00141a; box-shadow: inset 0px 0px 25px 3px #004e66;">
    <a class="modal-close waves-effect waves-light btn" style="background-color: red; color: black;"><b>Close</b></a>
    <a id="confirm-dismiss-member" class="modal-close waves-effect waves-light btn" style="background-color: green; color: black;"><b>OK</b></a>
  </div>
</div>

<div id="modal2" class="modal white-text" style="background-color: #00141a; box-shadow: inset 0px 0px 25px 3px #004e66;">
  <div class="modal-content center">
    <p style="font-size: 25px;">Do you really want to delete this clan?</p>
  </div>
  <div class="modal-footer" style="background-color: #00141a; box-shadow: inset 0px 0px 25px 3px #004e66;">
    <a class="modal-close waves-effect waves-light btn" style="background-color: red; color: black;"><b>Close</b></a>
    <a id="confirm-delete-clan" class="modal-close waves-effect waves-light btn" style="background-color: green; color: black;"><b>OK</b></a>
  </div>
</div>

<?php } else { ?>

<div id="modal3" class="modal white-text" style="background-color: #00141a; box-shadow: inset 0px 0px 25px 3px #004e66;">
  <div class="modal-content center">
    <p style="font-size: 25px;">Do you really want to leave this clan?</p>
  </div>
  <div class="modal-footer" style="background-color: #00141a; box-shadow: inset 0px 0px 25px 3px #004e66;">
    <a class="modal-close waves-effect waves-light btn" style="background-color: red; color: black;"><b>Close</b></a>
    <a id="confirm-leave-clan" class="modal-close waves-effect waves-light btn" style="background-color: green; color: black;"><b>OK</b></a>
  </div>
</div>

<?php } ?>
