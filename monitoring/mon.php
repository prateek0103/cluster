<?php
include '/var/www/html/demovpn-new/app/includes/config.php';
include '/var/www/html/demovpn-new/app/includes/connection.php';
require '/var/www/html/demovpn-new/app/api/api_function.php';
include('Net'.DIRECTORY_SEPARATOR.'SSH2.php');

$srv = shell_exec("status serverphp_runner");
if(strpos($srv, 'stop/waiting') !== false) {
    shell_exec("start serverphp_runner");
}
/*
$strig = shell_exec("status socket_trigger_runner");
if(strpos($strig, 'stop/waiting') !== false) {
    shell_exec("start socket_trigger_runner");
}*/
$strig = shell_exec("status deduct_cash_runner");
if(strpos($strig, 'stop/waiting') !== false) {
    shell_exec("start deduct_cash_runner");
}

$strig2 = shell_exec("status process_complete_runner");
if(strpos($strig2, 'stop/waiting') !== false) {
    shell_exec("start process_complete_runner");
}

$db = new mysqli($config['DB_HOST'], $config['DB_USER'], $config['DB_PASS'], $config['DB_NAME']);
$servers = $db->query('SELECT `id`, `remote_ip` FROM `remote_server_list` WHERE `is_monitored` = 1');

while($server=$servers->fetch_assoc())
{
    $utime = date("Y-m-d H:i:s");
    $statusmsg = "";
    $ip = trim($server['remote_ip']);
    try {
        $ssh = new Net_SSH2($ip);
        if (!$ssh->login('root', 'demovpn!@#')) {
            $db->query("UPDATE `remote_server_list` SET `current_status`= 'Login Failed' WHERE `id` = " . $server['id']);
            continue;
        }
    }
    catch (Exception $e)
    {
        $db->query("UPDATE `remote_server_list` SET `current_status`= 'NOT ACCESIBLE' WHERE `id` = " . $server['id']);
        continue;
    }
    $running = true;
    $r = $ssh->exec("status test_runner");
    if (strpos($r, 'Unknown job') !== false) {
        $running = false;
        $statusmsg .= "no test_runner found! <br/>";
    }
    else if(strpos($r, 'stop/waiting') !== false) {
        $sr = $ssh->exec("start test_runner");
        if(strpos($sr, 'start/running') === false)
        {
            $statusmsg .= "Could not start test_runner <br/>";
            $running = false;
        }
    }
    if($running)
    {
        $statusmsg .= "test_runner OK <br/>";
    }
    $running = true;
    $mon = $ssh->exec("status resourcesmon_runner");
    if (strpos($mon, 'Unknown job') !== false) {
        $running = false;
        $statusmsg .= "no resourcesmon_runner found! <br/>";
    }
    else if(strpos($mon, 'stop/waiting') !== false) {
        $mr = $ssh->exec("start resourcesmon_runner");
        if(strpos($mr, 'start/running') === false)
        {
            $statusmsg .= "Could not start resourcesmon_runner <br/>";
            $running = false;
        }
    }
    if($running)
    {
        $statusmsg .= "resourcesmon_runner OK <br/>";
    }
    $rs = $ssh->exec("php /var/www/html/backendjobs/resmon.php");
    $db->query("UPDATE `remote_server_list` SET `last_alive`='" . $utime . "',`ressnap`='" . $rs . "',`current_status`= '" . $statusmsg . "' WHERE `id` = " . $server['id']);
}
?>