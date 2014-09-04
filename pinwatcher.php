<?php

// -- CUSTOMIZE HERE --
define('USER', 'raphaelyancey');
define('PIN_PATH', '.');
// --------------------

$i = 0;

function filter_originals($value, $key)
{
	global $i;

	$url = $value['images']['237x']['url']; // gets thumbnail URL
	$url_original = str_replace('237x', 'originals', $url); // switch to original size URL
	$filename = pathinfo($url_original, PATHINFO_FILENAME); // extracting the filename

	$board = strtolower(substr($value['board']['name'], 0, 2)); // extracting the board in which it's been pinned

	$saved_filename = PIN_PATH.'/'.$board.'-'.$filename.'.jpg'; // new file format: [bo]ard-[original filename].jpg

	if(!file_exists($saved_filename))
	{
		echo "\t".'[-] Saving new pin ('.$value['id'].') ... ';

		// saving the pin
		$image = file_get_contents($url_original);
		file_put_contents($saved_filename, $image);

		echo 'complete.'."\n";
		$i++;
	}
}

echo '[+] Fetching the last pins from '.USER.'\'s Pinterest profile...';
$page = file_get_contents('https://api.pinterest.com/v3/pidgets/users/'.USER.'/pins/');
echo 'done.'."\n";

$json = json_decode($page, true);
$json = $json['data']['pins']; // this is the interesting scope
array_walk($json, 'filter_originals');

if($i > 0)
	echo '[+] Saved '.$i.' pin(s)';
else
	echo '[+] No new pins.';

echo "\n";

?>