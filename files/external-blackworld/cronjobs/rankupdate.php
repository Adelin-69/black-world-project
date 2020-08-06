<?php
$mysqli = Database::GetInstance();

$mysqli->begin_transaction();

try {

  foreach ($mysqli->query('SELECT * FROM player_accounts WHERE rankId != 21 AND warPoints > 0 ORDER BY warPoints DESC') as $key => $value) {
    if ($mysqli->query('SELECT id FROM server_bans WHERE userId = '.$value['userId'].' AND typeId = 1 AND ended = 0')->num_rows <= 0) {
      $mysqli->query('UPDATE player_accounts SET warRank = '.($key + 1).' WHERE userId = '.$value['userId'].'');
    }
  }

  foreach ($mysqli->query('SELECT * FROM player_accounts WHERE rankId != 21') as $value) {
    if ($mysqli->query('SELECT id FROM server_bans WHERE userId = '.$value['userId'].' AND typeId = 1 AND ended = 0')->num_rows <= 0) {
      $data = json_decode($value['data']);
      $destructions = json_decode($value['destructions']);
      $wP = $value["kills"];
      $rankPoints = 0;
      $rankPoints += $wP*1512;
      if ($rankPoints < 0) {
        $rankPoints = 0;
      }

      $rankPoints = round($rankPoints);

      $mysqli->query('UPDATE player_accounts SET rankPoints = '.$rankPoints.' WHERE userId = '.$value['userId'].'');
    }
  }

  foreach ($mysqli->query('SELECT * FROM server_bans WHERE typeId = 1 AND ended = 0') as $value) {
    $mysqli->query('UPDATE player_accounts SET rankId = 1, rank = 0, rankPoints = 0, warRank = 0, warPoints = 0 WHERE userId = '.$value['userId'].'');
  }

  foreach ($mysqli->query('SELECT * FROM player_accounts WHERE rankId != 21 ORDER BY rankPoints DESC') as $key => $value) {
    if ($mysqli->query('SELECT id FROM server_bans WHERE userId = '.$value['userId'].' AND typeId = 1 AND ended = 0')->num_rows <= 0) {
      $mysqli->query('UPDATE player_accounts SET rank = '.($key + 1).' WHERE userId = '.$value['userId'].'');
    }
  }

  foreach ($mysqli->query('SELECT id FROM server_clans') as $value) {
    $rankPoints = 0;

    $sumRankpoints = $mysqli->query('SELECT SUM(rankPoints) as rankPoints, COUNT(userId) as userCount FROM player_accounts WHERE clanId = '.$value['id'].'')->fetch_assoc();

    $rankPoints = round($sumRankpoints['rankPoints']);

    $mysqli->query('UPDATE server_clans SET rankPoints = '.$rankPoints.' WHERE id = '.$value['id'].'');
  }

  foreach ($mysqli->query('SELECT * FROM server_clans ORDER BY rankPoints DESC') as $key => $value) {
    $mysqli->query('UPDATE server_clans SET rank = '.($key + 1).' WHERE id = '.$value['id'].'');
  }

  for ($i = 1; $i <= 3; $i++) {
    $rank = array(1 => 25,
            2 => 20,
            3 => 17.29,
            4 => 14.29,
            5 => 12.29,
            6 => 10,
            7 => 9,
            8 => 8,
            9 => 7,
            10 => 6,
            11 => 5,
            12 => 4.5,
            13 => 4,
            14 => 3.5,
            15 => 3,
            16 => 2.5,
            17 => 2,
            18 => 1.5,
            19 => 0.15,
            20 => 0.01
          );

    $addition = 0;
    $userscount = ($mysqli->query('SELECT userId FROM player_accounts WHERE rankPoints >= 10 AND factionId = '.$i.' AND rankId != 21')->num_rows) - 1;
    $predictcount = 0;
    $userslist = ($mysqli->query('SELECT userId FROM player_accounts WHERE rankPoints >= 10 AND factionId = '.$i.' AND rankId != 21 ORDER BY rankPoints DESC')->fetch_all(MYSQLI_ASSOC));

    $rank = array_reverse($rank, true);

    if (isset($userslist[0])) {
      $mysqli->query('UPDATE player_accounts SET rankId = 22 WHERE userId = '.$userslist[0]['userId'].'');
      unset($userslist[0]);
    }

    foreach ($rank as $key => $value) {
      $predict = $userscount / 100 * $value;

      if ($predictcount < $userscount) {
        $predictcount += ceil($predict);
        $tmp = 0;

        foreach ($userslist as $key2 => $value2) {
            if ($tmp < $predict) {
              $mysqli->query('UPDATE player_accounts SET rankId = '.$key.' WHERE userId = '.$userslist[$key2]['userId'].'');

              unset($userslist[$key2]);
              $tmp += 1;
            }
        }
      }

      $addition += $value;
    }
  }

  $mysqli->commit();
} catch (Exception $e) {
  $mysqli->rollback();
}

$mysqli->close();
?>
