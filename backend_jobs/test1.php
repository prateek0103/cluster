<?php
    require "thread.php";


        $config = array(
            'DB_HOST'=>'192.81.220.57',
            'DB_USER'=>'demovpn',
            'DB_PASS'=>'demo@vpn@456',
            'DB_NAME'=>'demovpn'
        );

        $db = mysql_connect($config['DB_HOST'], $config['DB_USER'], $config['DB_PASS'], $config['DB_NAME']) or die(mysql_error());
        mysql_select_db($config['DB_NAME'], $db) or die(mysql_error());

    function vpn_jobs($threaob) {
        exec("wget http://ipinfo.io/ip -qO -", $result);
        $server_ip=$result[0];

        /*$config = array(
            'DB_HOST'=>'192.81.220.57',
            'DB_USER'=>'demovpn',
            'DB_PASS'=>'demo@vpn@456',
            'DB_NAME'=>'demovpn'
        );

        $db = mysql_connect($config['DB_HOST'], $config['DB_USER'], $config['DB_PASS'], $config['DB_NAME']);
        mysql_select_db($config['DB_NAME'], $db);*/

        //connection();

        $sql=mysql_query("SELECT `id`, `remote_group` FROM `remote_server_list` WHERE `remote_ip`='".$server_ip."'");
        if(mysql_num_rows($sql)>0){
            $res=mysql_fetch_array($sql);
            $sql_job=mysql_query("SELECT * FROM `job_queue` WHERE `is_complete_action`=0 AND `group`='".$res['remote_group']."' LIMIT 1");

            $res_job=mysql_fetch_assoc($sql_job);

            if(mysql_query("UPDATE `job_queue` SET `remote_server_id`=".$res['id'].", `is_complete_action`=1 WHERE `job_id`=".$res_job['job_id'])){

                $arr_val=unserialize($res_job['new_data']);
               /* echo $res_job['action']."<br>";
                print_r($arr_val);die;*/
                if($res_job['action']=="gateway_change"){
                    if(mysql_query("UPDATE `tunnels_data` SET `gateway_mode`=".$arr_val["value"]." WHERE `tunnel_id`=".$arr_val["id"])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="bidirection_change"){
                    if(mysql_query("UPDATE `tunnels_data` SET `bidirectional_mode`=".$arr_val["value"]." WHERE `tunnel_id`=".$arr_val["id"])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="internet_change"){
                    if(mysql_query("UPDATE `tunnels_data` SET `internet`=".$arr_val["value"]." WHERE `tunnel_id`=".$arr_val["id"])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="route_change"){
                    if(mysql_query("UPDATE `tunnels_data` SET `route`=".$arr_val["value"]." WHERE `tunnel_id`=".$arr_val["id"])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="group_change"){
                    if(mysql_query("UPDATE `tunnels_data` SET `group_id`=".$arr_val["value"]." WHERE `tunnel_id`=".$arr_val["id"])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="add_server_clone"){
                    mysql_query("INSERT INTO `tunnels_data`(`type`,`username`,`password`,`group`,`cloud_ip`,`local_ip`,`real_ip`,`controller_id`,`cloud_id`,`user_token`,`status`,`traffic`,`bidirectional_mode`,`gateway_mode`,`email`,`group_id`,`display_name`,`last_updated`,`no_of_revision`, `location`, `is_complete_action`, `is_updated`, `tunnel_type`) VALUES(
                      ".$arr_val['type'].",
                      '".$arr_val['uname']."','".$arr_val['upass']."',
                      '".$arr_val['group']."',
                      '".$arr_val['cloud_ip']."',
                      '".$arr_val['local_ip']."',
                      '".$arr_val['real_ip']."',
                      ".$arr_val['controller_id'].",
                      ".$arr_val['cloud_id'].",
                      ".$arr_val['token'].",
                      ".$arr_val['status'].",
                      ".$arr_val['traffic'].",
                      ".$arr_val['bidirectional_mode'].",
                      ".$arr_val['gateway_mode'].",
                      '".$arr_val['email']."',
                      ".$arr_val['group_id'].",
                      '".$arr_val['display_name']."',
                      now(),
                      0,
                      '".$arr_val['location']."', 0, 0, 'server'
                      )");
                    $last_id = mysql_insert_id();

                    mysql_query("UPDATE `server_subnets` SET `used_ips`=1 WHERE `subnet`='".$arr_val['cloud_ip']."'");
                    mysql_query("UPDATE `real_ip_list` SET `in_use`=1 WHERE `real_ip`='".$arr_val['real_ip']."'");
                    $arr_val['tunnel_id']=$last_id;
                    if(isset($last_id)){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="add_client_clone"){
                    mysql_query("INSERT INTO `tunnels_data`(`type`,`email`,`internet_tunnel`,`cloud_id`,`user_token`,`status`,`servers_ACL`,`last_login`,`traffic`,`bidirectional_mode`,`group_id`,`display_name`,`cloud_ip`,`is_deleted`,`last_updated`,`no_of_revision`, `location`, `is_complete_action`, `is_updated`, `tunnel_type`) VALUES(
                    ".$arr_val['type'].",
                    '".$arr_val['email']."',
                    ".$arr_val['internet_tunnel'].",
                    ".$arr_val['cloud_id'].",
                    ".$arr_val['token'].",
                    ".$arr_val['status'].",
                    '".$arr_val['servers_ACL']."',
                    now(),
                    ".$arr_val['traffic'].",
                    ".$arr_val['bidirectional_mode'].",
                    ".$arr_val['group_id'].",
                    '".$arr_val['display_name']."',
                    '".$arr_val['cloud_ip']."',
                    0,
                    now(),
                    0,
                    '".$arr_val['location']."', 0, 0, 'client'
                    )");
                    $last_id = mysql_insert_id();
                    mysql_query("UPDATE `client_subnets` SET `used_ips`=1 WHERE `subnet`='".$arr_val['cloud_ip']."'");
                    $arr_val['tunnel_id']=$last_id;
                    if(isset($last_id)){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="edit_email"){
                    if(mysql_query("UPDATE `tunnels_data` SET `email`='".$arr_val['value']."' WHERE `tunnel_id`=".$arr_val['id'])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="edit_display"){
                    if(mysql_query("UPDATE `tunnels_data` SET `display_name`='".$arr_val['value']."' WHERE `tunnel_id`=".$arr_val['id'])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="request_real_ip"){
                    if(mysql_query("UPDATE `tunnels_data` SET `real_ip`='".$arr_val['real_ip']."' WHERE `tunnel_id`=".$arr_val['id'])){
                        if(mysql_query("UPDATE `real_ip_list` SET `in_use`=1 WHERE `real_ip`='".$arr_val['real_ip']."'")){
                            job_comp_stat($arr_val, $res_job['job_id']);
                        }
                    }
                }else if($res_job['action']=="change_tunnel_client"){
                    // $sql_cloud_ip=mysql_query("SELECT `cloud_ip` FROM `tunnels_data` WHERE `tunnel_id`=".$arr_val['id']);
                    // $row_cloud_ip=mysql_fetch_array($sql_cloud_ip);
                    // $sql_real_ip=mysql_query("SELECT `real_ip` FROM `tunnels_data` WHERE `tunnel_id`=".$arr_val['id']);
                    // $row_real_ip=mysql_fetch_array($sql_real_ip);
                    $sql_client_subnet=mysql_query("SELECT `subnet` FROM `client_subnets` WHERE `used_ips`=0");
                    $row_client_subnet=mysql_fetch_array($sql_client_subnet);
                    /*if(mysql_query("UPDATE `real_ip_list` SET `in_use`=0 WHERE `real_ip`='".$row_real_ip['real_ip']."'")){
                        if(mysql_query("UPDATE `server_subnets` SET `used_ips`=0 WHERE `subnet`='".$row_cloud_ip['subnet']."'")){*/
                    if(mysql_query("UPDATE `tunnels_data` SET `tunnel_type`='client', `cloud_ip`='".$row_client_subnet['subnet']."', `real_ip`='' WHERE `tunnel_id`=".$arr_val['id'])){
                        if(mysql_query("UPDATE `client_subnets` SET `used_ips`=1 WHERE `subnet`='".$row_client_subnet['subnet']."'")){
                            job_comp_stat($arr_val, $res_job['job_id']);
                        }
                    }
                    //     }
                    // }
                }else if($res_job['action']=="change_tunnel_server"){
                    /*$sql_cloud_ip=mysql_query("SELECT `cloud_ip` FROM `tunnels_data` WHERE `tunnel_id`=".$arr_val['id']);
                    $row_cloud_ip=mysql_fetch_array($sql_cloud_ip);*/
                    $sql_server_subnet=mysql_query("SELECT `subnet` FROM `server_subnets` WHERE `used_ips`=0");
                    $row_server_subnet=mysql_fetch_array($sql_server_subnet);
                    //if(mysql_query("UPDATE `client_subnets` SET `used_ips`=0 WHERE `subnet`='".$row_cloud_ip['cloud_ip']."'")){
                    if(mysql_query("UPDATE `tunnels_data` SET `tunnel_type`='server', `cloud_ip`='".$row_server_subnet['subnet']."', `real_ip`='' WHERE `tunnel_id`=".$arr_val['id'])){
                        if(mysql_query("UPDATE `server_subnets` SET `used_ips`=1 WHERE `subnet`='".$row_server_subnet['subnet']."'")){
                            job_comp_stat($arr_val, $res_job['job_id']);
                        }
                    }
                    //}
                }else if($res_job['action']=="change_location"){
                    if(mysql_query("UPDATE `tunnels_data` SET `location`='".$arr_val['value']."' WHERE `tunnel_id`=".$arr_val['id'])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="real_ip_status"){
                    if(mysql_query("UPDATE `real_ip_list` SET `is_active`=".$arr_val['value']." WHERE `real_ip`='".$arr_val['ip']."'")){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="add_new_tunnel"){
                    $value=$arr_val;
                    //print_r($value);
                    if($value[0]['tunnel_type']=="server"){
                        $sql="INSERT INTO `tunnels_data` (`type`, `username`, `password`, `cloud_id`, `user_token`, `email`, `bidirectional_mode`, `gateway_mode`,`display_name`,`cloud_ip`, `is_complete_action`, `is_updated`, `tunnel_type`, `group_id`)
                                     VALUES ('0', '".$value[0]['uname']."',
                                     '".$value[0]['upass']."', ".$value[0]['cloud_id'].",
                                     '".$value[0]['token']."',
                                     '".$value[0]['email']."',
                                     '".$value[0]['bidirectional_mode']."',
                                     '".$value[0]['gateway_mode']."',
                                     '".$value[0]['display']."',
                                     '".$value[0]['cloud_ip']."',
                                     0, 0, 'server', ".$value[0]['group_id'].")";
                    }else if($value[0]['tunnel_type']=="client"){
                        $sql="INSERT INTO `tunnels_data` (`cloud_id`, `user_token`, `email`, `bidirectional_mode`, `display_name`, `cloud_ip`, `is_complete_action`, `is_updated`, `tunnel_type`, `group_id`)
                                     VALUES (".$value[0]['cloud_id'].",
                                     '".$value[0]['token']."',
                                     '".$value[0]['email']."',
                                     '".$value[0]['bidirectional_mode']."',
                                     '".$value[0]['display']."',
                                     '".$value[0]['cloud_ip']."',
                                     0, 0, 'client', ".$value[0]['group_id'].")";
                    }
                    if(mysql_query($sql)){
                        if($value['tunnel_type']="server"){
                            mysql_query("UPDATE `server_subnets` SET `used_ips`=1 WHERE `subnet`='".$value[0]['cloud_ip']."'");
                        }else{
                            mysql_query("UPDATE `client_subnets` SET `used_ips`=1 WHERE `subnet`='".$value[0]['cloud_ip']."'");
                        }
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }else {
                        echo mysql_error();
                    }
                }else if($res_job['action']=="delete_tunnel"){
                    if(mysql_query("UPDATE `tunnels_data` SET `is_deleted`=1 WHERE `tunnel_id`=".$arr_val['data']['id'])){
                        /*if($arr_val['data']['type']=="server"){
                            mysql_query("UPDATE `server_subnets` SET `used_ips`=0 WHERE `subnet`='".$row['cloud_ip']."'");
                            mysql_query("UPDATE `real_ip_list` SET `in_use`=0 WHERE `real_ip`='".$row['real_ip']."'");
                        }else if($arr_val['data']['type']=="client"){
                            mysql_query("UPDATE `client_subnets` SET `used_ips`=0 WHERE `subnet`='".$row['cloud_ip']."'");
                        }*/job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }
            }
        }
        $threaob->kill();
    }

    function job_comp_stat($data, $job_id){
        mysql_query("UPDATE `job_queue` SET `is_complete_action`=2, `old_data`='".serialize($data)."' WHERE `job_id`=".$job_id);
    }

    while (true){

        $sqlCheck=mysql_query("SELECT * FROM `job_queue` WHERE `is_complete_action`=0");
        if(mysql_num_rows($sqlCheck)>0){
            $thread = new Thread('vpn_jobs');
            $thread->start($thread);
            sleep(5);
        }
    }

