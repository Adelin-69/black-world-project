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
<?php
$equipment = $mysqli->query('SELECT skill_points, items FROM player_equipment WHERE userId = '.$player['userId'].'')->fetch_assoc();
$skillPoints = json_decode($equipment['skill_points']);
$skillTree = json_decode($equipment['items'])->skillTree;
$requiredLogdisks = Functions::GetRequiredLogdisks((array_sum((array)$skillPoints) + $skillTree->researchPoints) + 1);

$skills = Functions::GetSkills($skillPoints);
?>
      <div id="main">
        <div class="container">
          <div class="row">
            <?php require_once(INCLUDES . 'data.php'); ?>

            <div class="col s12">
              <div class="card white-text center padding-15">
                <h5>EQUIPMENT</h5>
                <div id="equipment_container"></div>
                </div>
              </div>
           </div>
          </div>
        </div>
      </div>