<?php

$load = sys_getloadavg();
echo date("Y-m-d H:i:s") . ";";
echo "cpu load:" . $load[0] . ";";
$free = shell_exec('free -m');
$free = (string)trim($free);
$free_arr = explode("\n", $free);
$mem = explode(" ", $free_arr[1]);
$mem = array_filter($mem);
$mem = array_merge($mem);
$memory_usage = $mem[2]/$mem[1]*100;
echo "mem percentage:" . $memory_usage . "\r\n";
?>