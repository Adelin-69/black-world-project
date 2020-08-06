<?php


$mysqli = Database::GetInstance();

$mysqli->begin_transaction();



foreach($mysqli->query("SELECT * FROM player_accounts WHERE 1") as $value)
{
	$premium = json_decode($value['premium']);
	$premium = 1;
	$mysqli->query("UPDATE player_accounts SET 'premium' = '".json_decode($premium)."' WHERE userId = '".$value['userId']."'");
}


?>