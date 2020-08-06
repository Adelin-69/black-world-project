<?php


$mysqli = Database::GetInstance();

$mysqli->begin_transaction();



foreach($mysqli->query("SELECT * FROM player_accounts WHERE 1") as $value)
{
	$data = json_decode($value['data']);
	$data->honor = 0;
	$data->experience = 0;
	$mysqli->query("UPDATE player_accounts SET 'data' = '".json_encode($data)."' WHERE userId = '".$value['userId']."'");
}


?>