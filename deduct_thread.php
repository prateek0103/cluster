<?php
require_once 'includes/config.php';
require_once 'includes/connection.php';
$sql=$db->query("select * from `customers_data` where `is_active`=1");
$i = 0;
while($row = $sql->fetch_assoc()){
    $last_checked=0;
    $deducted_cash=0;
    $server_cost=0;
    $client_cost=0;
    $now=time();
    $cash=0;
    $cent=0;

    $token=$row['token'];
    $last_checked=$row['last_checked'];
    $net=($now - $last_checked)/1000;
    $cash=$row['Cash_amount'];
    $cent=$cash * 100;
    if($row['Cash_amount']>0){
        $sql1=$db->query("select * from `tunnels_data` where `user_token`='".$token."' AND `is_deleted`=0");
        while($row1 = $sql1->fetch_assoc()){
            //echo $deducted_cash."<br>";
            if($row1['tunnel_type']=="server"){

                $real_chk=$db->query("SELECT `is_active` FROM `real_ip_list` WHERE `real_ip`='".$row1['real_ip']."'");
                $real_chk_row=$real_chk->fetch_assoc();

                if(isset($row1['real_ip']) && $real_chk_row['is_active']==1){
                    $sql_server=$db->query("SELECT SUM(`tunnel` + `gateway` + `bidirection` + `realip`) total FROM `package_data` WHERE `plan_id`=".$row1['plan_id']);
                    $row_server=$sql_server->fetch_assoc();
                    $server_cost=$server_cost + ($row_server['total'] * 100);
                }else {
                    $sql_server=$db->query("SELECT SUM(`tunnel` + `gateway` + `bidirection`) total FROM `package_data` WHERE `plan_id`=".$row1['plan_id']);
                    $row_server=$sql_server->fetch_assoc();
                    $server_cost=$server_cost + ($row_server['total'] * 100);
                }
                if($deducted_cash>0){
                    $deducted_cash=$deducted_cash + $server_cost;
                }else{
                    $deducted_cash=$server_cost;
                }
            }else if($row1['tunnel_type']=="client"){
                $sql_client=$db->query("SELECT SUM(`tunnel` + `bidirection`) total FROM `package_data` WHERE `plan_id`=".$row1['plan_id']);
                $row_client=$sql_client->fetch_assoc();
                $client_cost=$client_cost + ($row_client['total'] * 100);
                if($deducted_cash>0){
                    $deducted_cash=$deducted_cash + $client_cost;
                }else{
                    $deducted_cash=$client_cost;
                }
            }
        }
        $deducted_cash=($deducted_cash / 2592000);
        //echo $deducted_cash=floatval($deducted_cash);
        $cent=$cent - ($deducted_cash  * $net);
        $cash=($cent /100);
        $db->query("update `customers_data` set `Cash_amount`=".$cash.", `last_checked`=".$now." where `token`='$token'");
        $db->query("update `purchase_log` set `deduct`= '$deducted_cash' where `user_token`='$token'");
        $message=array("status"=>1, "type"=>"deduct_cash_result", "message_type"=>"reply", "data"=>$cash);
        //send_reply($token, $Server, $message);
        echo $deducted_cash;
        echo "<br>";
        echo "//////<br>";
        echo $cash;
        echo "<br>";
    }
    $i++;
}

?>
