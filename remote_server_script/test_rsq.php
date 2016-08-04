<?php
    require "thread.php";
    //require 'class.PHPWebSocket.php';
    include '../includes/config.php';
    include '../includes/connection.php';
    require '../api/api_function.php';

    function vpn_jobs($db) {

        $arr="";
        $sql="SELECT * FROM `job_queue` WHERE `is_complete_action`=2 AND `is_seen`=0";
        $res=$db->query($sql);
        if(!$res){
            throw new Exception("Bleh");
        }
        while($result=$res->fetch_assoc()){
            //print_r($result);
            if($result['action']=="gateway_change"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"gateway_change_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="bidirection_change"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"bidirection_change_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="internet_change"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"internet_change_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="route_change"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"route_change_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="group_change"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"group_change_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="add_server_clone"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"add_server_clone_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, "", $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="add_client_clone"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"add_client_clone_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, "", $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="edit_email"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"edit_email_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="edit_display"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"edit_display_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="request_real_ip"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"request_real_ip_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="change_tunnel_client"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"change_tunnel_client_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="change_tunnel_server"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"change_tunnel_server_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="change_location"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"change_location_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="real_ip_status"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"real_ip_status_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="add_new_tunnel"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"add_tunnels_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, "", $result['job_id'], $result['token'], json_encode($arr));
            }
            if($result['action']=="delete_tunnel"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"delete_tunnel_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));

            }
            //31.03.16 new
            if($result['action']=="create_new_acl"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"create_new_acl_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));

            }
            if($result['action']=="delete_acl"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"delete_acl_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));

            }
            if($result['action']=="clear_acl_values"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"clear_acl_values_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));

            }
            if($result['action']=="create_acl_clone"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"create_acl_clone_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));

            }
            if($result['action']=="save_acl_values"){
                $update_data=unserialize($result['new_data']);
                $arr=array("status"=>1, "type"=>"save_acl_values_result", "message_type"=>"reply", "data"=>$update_data);
                job_done($db, $result['tunnel_id'], $result['job_id'], $result['token'], json_encode($arr));

            }
        }
    }

    function job_done($db, $tunnel_id, $id, $token, $json){
        $db->query("UPDATE `job_queue` SET `is_seen`=1 WHERE `job_id`=".$id);
        $json=json_decode($json, 1);
        if($tunnel_id!=""){
            $comp_job=sql_job_check($db, $tunnel_id);
        }
        $json["free_field"]=$comp_job;
        //All worker work goes here
        $messagetosend =  array('toclient' => $token,
            'data' => json_encode($json));
        $context = new ZMQContext();
        //You can establish this connection only once if you want but then you need to propertly handle disconnected events and reconnect on them.
        //So until you are not requied to do so - I stronly advice not to make such thing.... It will give benefit only if there will be over 50 connections per second on this socet. Until then just establish it from script.
        $socket = $context->getSocket(ZMQ::SOCKET_PUSH, 'pushsock');
        $socket->connect("tcp://localhost:8880");
        $socket->send(json_encode($messagetosend));
    }

    function sql_job_check($db, $tunnel_id){
        $sql_job_check=$db->query("SELECT * FROM `job_queue` WHERE `is_seen`=0 AND `tunnel_id`=".$tunnel_id);
        if($sql_job_check->num_rows>0){
            return "no";
        }else{
            return "yes";
        }
    }
$db = new mysqli($config['DB_HOST'], $config['DB_USER'], $config['DB_PASS'], $config['DB_NAME']);
vpn_jobs($db);
/*
function status_responder()
{
    set_time_limit(0);

    $address = '192.81.220.57';

    $port = 7575;
    $word = "";

    $sock = socket_create(AF_INET, SOCK_STREAM, 0);
    $bind = socket_bind($sock, $address, $port);

    echo socket_listen($sock);
    while (true) {
        $client = socket_accept($sock);
        $input = socket_read($client, 2024);
    }
}
$thrd = new Thread('status_responder');
$thrd->start();

echo "running now....";
    while (true){

        $db = new mysqli($config['DB_HOST'], $config['DB_USER'], $config['DB_PASS'], $config['DB_NAME']);
        $sql_job_check=$db->query("SELECT * FROM `job_queue` WHERE `is_complete_action`=2 AND `is_seen`=0");
        if($sql_job_check->num_rows>0){
            $thread = new Thread('vpn_jobs');
            $thread->start($db);
        }
        sleep(2);
    }
*/
?>