<?php
    include '../includes/config.php';
    include '../includes/connection.php';

    $res = $db->query("SELECT * FROM `tunnels_data` WHERE `is_deleted`=1");
    if($res->num_rows>0){
        $db->query("DELETE FROM `tunnels_data` WHERE `is_deleted`=1");
    }
?>