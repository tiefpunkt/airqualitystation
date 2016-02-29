<?php

require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/config.php';

$client = new InfluxDB\Client($host, $port, $user, $password);

$database = $client->selectDB($db_name);


if($_SERVER['REQUEST_METHOD'] == 'POST') {
	$raw = file_get_contents("php://input");
	$data = json_decode($raw, true);
	
	if ($data === null) {
		die("Invalid data\n");
	}

	//var_dump($data);
	$points = array(
    		new InfluxDB\Point(
			'sensor_values_002', // name of the measurement
			null, // the measurement value
			['MAC' => $data['MAC'], 'firmware' => $data['software_version']], // optional tags
			[
				'pm10' => floatval($data['sensors']['ppd42ns']['P1']['concentration']), 
				'pm25' => floatval($data['sensors']['ppd42ns']['P2']['concentration']),
				'pm10_avg' => floatval($data['sensors']['ppd42ns']['P1']['concentration_avg']),
                                'pm25_avg' => floatval($data['sensors']['ppd42ns']['P2']['concentration_avg']),
				'temperature' => floatval($data['sensors']['dht22']['temperature']),
				'humidity' => floatval($data['sensors']['dht22']['humidity']),
				'uptime' => intval($data['uptime'])
			] // optional additional fields
		));
	$result = $database->writePoints($points, InfluxDB\Database::PRECISION_SECONDS);
	echo $result;
} else {
	die("Invalid request\n");
}
