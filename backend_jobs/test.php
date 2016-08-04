<?php
    require "thread.php";


        $config = array(
            'DB_HOST'=>'192.81.220.57',
            'DB_USER'=>'demovpn',
            'DB_PASS'=>'demo@vpn@456',
            'DB_NAME'=>'demovpn'
        );

	function vpn_jobs($threaob) {
        exec("ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'", $result);
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
                print_r($arr_val);*/
                if($res_job['action']=="gateway_change"){
                    if(mysql_query("UPDATE `tunnels_data` SET `gateway_mode`=".$arr_val["value"]." WHERE `tunnel_id`=".$arr_val["id"])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }if($res_job['action']=="status_change"){
                    if(mysql_query("UPDATE `tunnels_data` SET `status`=".$arr_val["value"]." WHERE `tunnel_id`=".$arr_val["id"])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="bidirection_change"){
                    if(mysql_query("UPDATE `tunnels_data` SET `bidirectional_mode`=".$arr_val["value"]." WHERE `tunnel_id`=".$arr_val["id"])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }else{
                        mysql_error();
                    }
                }else if($res_job['action']=="internet_change"){
                    if(mysql_query("UPDATE `tunnels_data` SET `internet`=".$arr_val["value"]." WHERE `tunnel_id`=".$arr_val["id"])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="route_change"){
                    if(mysql_query("UPDATE `tunnels_data` SET `route`=".$arr_val["value"]." WHERE `tunnel_id`=".$arr_val["id"])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="plan_change"){
                    if(mysql_query("UPDATE `tunnels_data` SET `plan_id`=".$arr_val["value"]." WHERE `tunnel_id`=".$arr_val["id"])){
                        $qry=mysql_query("SELECT `tunnel_type` FROM `tunnels_data` WHERE `tunnel_id`=".$arr_val["id"]);
                        $res=mysql_fetch_assoc($qry);
                        if($res['tunnel_type']=="server"){
                            $p_qry=mysql_query("SELECT SUM(`tunnel` + `gateway` + `bidirection` + `realip`) total FROM `package_data` WHERE `plan_id`=".$arr_val["value"]);
                        } elseif ($res['tunnel_type']=="client") {
                            $p_qry=mysql_query("SELECT SUM(`tunnel` + `bidirection` + `realip`) total FROM `package_data` WHERE `plan_id`=".$arr_val["value"]);
                        }
                        $p_res=mysql_fetch_assoc($p_qry);
                        $arr_val["p_cost"]=$p_res['total'];
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="group_change"){
                    if(mysql_query("UPDATE `tunnels_data` SET `group_id`=".$arr_val["value"]." WHERE `tunnel_id`=".$arr_val["id"])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="add_server_clone"){
                    $qry=mysql_query("INSERT INTO `tunnels_data`(`type`,`username`,`password`,`group`,`cloud_ip`,`local_ip`,`controller_id`,`cloud_id`,`user_token`,`status`,`traffic`,`bidirectional_mode`,`gateway_mode`,`email`,`group_id`,`display_name`,`last_updated`,`no_of_revision`, `location`, `is_complete_action`, `is_updated`, `tunnel_type`, `plan_id`) VALUES(
                      ".$arr_val[0]['type'].",
                      '".$arr_val[0]['uname']."','".$arr_val[0]['upass']."',
                      '".$arr_val[0]['group']."',
                      '".$arr_val[0]['cloud_ip']."',
                      '".$arr_val[0]['local_ip']."',
                      ".$arr_val[0]['controller_id'].",
                      ".$arr_val[0]['cloud_id'].",
                      '".$arr_val[0]['user_token']."',
                      ".$arr_val[0]['status'].",
                      ".$arr_val[0]['traffic'].",
                      ".$arr_val[0]['bidirectional_mode'].",
                      ".$arr_val[0]['gateway_mode'].",
                      '".$arr_val[0]['email']."',
                      ".$arr_val[0]['group_id'].",
                      '".$arr_val[0]['display_name']."',
                      now(),
                      0,
                      '".$arr_val[0]['location']."', 0, 0, 'server',
                      ".$arr_val[0]['plan_id']."
                      )") or die(mysql_error());
                    $last_id = mysql_insert_id();
                    $arr_val[0]['tunnel_id']=$last_id;
                    $sqlPackage=mysql_query("SELECT SUM(`tunnel` + `gateway` + `bidirection`) total FROM `package_data` WHERE `plan_id`=".$arr_val[0]['plan_id']);
                    $rowPackage=mysql_fetch_assoc($sqlPackage);
                    $arr_val[0]['cost']=$rowPackage['total'];
                    /*$get_loc=mysql_query("SELECT `server_name` WHERE `id`=".$arr_val[0]['location']);
                    $get=mysql_fetch_array($get_loc);
                    $arr_val[0]['location']=$get['server_name'];*/

                    mysql_query("UPDATE `real_ip_list` SET `in_use`=1 WHERE `real_ip`='".$arr_val[0]['real_ip']."'");
                    if(isset($last_id)){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="add_client_clone"){
                    $qry=mysql_query("INSERT INTO `tunnels_data`(`type`,`email`,`internet_tunnel`,`cloud_id`,`user_token`,`status`,`servers_ACL`,`last_login`,`traffic`,`bidirectional_mode`,`group_id`,`display_name`,`is_deleted`,`last_updated`,`no_of_revision`, `location`, `is_complete_action`, `is_updated`, `tunnel_type`, `plan_id`) VALUES(
                    ".$arr_val[0]['type'].",
                    '".$arr_val[0]['email']."',
                    ".$arr_val[0]['internet_tunnel'].",
                    ".$arr_val[0]['cloud_id'].",
                    '".$arr_val[0]['user_token']."',
                    ".$arr_val[0]['status'].",
                    '".$arr_val[0]['servers_ACL']."',
                    now(),
                    ".$arr_val[0]['traffic'].",
                    ".$arr_val[0]['bidirectional_mode'].",
                    ".$arr_val[0]['group_id'].",
                    '".$arr_val[0]['display_name']."',
                    0,
                    now(),
                    0,
                    '".$arr_val[0]['location']."', 0, 0, 'client',
                    ".$arr_val[0]['plan_id']."
                    )") or die(mysql_error());
                    $last_id = mysql_insert_id();
                    $arr_val[0]['tunnel_id']=$last_id;
                    $sqlPackage=mysql_query("SELECT SUM(`tunnel` + `bidirection`) total FROM `package_data` WHERE `plan_id`=".$arr_val[0]['plan_id']);
                    $rowPackage=mysql_fetch_assoc($sqlPackage);
                    $arr_val[0]['cost']=$rowPackage['total'];
                    /*$get_loc=mysql_query("SELECT `server_name` WHERE `id`=".$arr_val[0]['location']);
                    $get=mysql_fetch_array($get_loc);
                    $arr_val[0]['location']=$get['server_name'];*/
                    mysql_query("UPDATE `client_subnets` SET `used_ips`=1 WHERE `subnet`='".$arr_val[0]['cloud_ip']."'");
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
                        $real_chk=mysql_query("SELECT `plan_id` FROM `tunnels_data` WHERE `tunnel_id`=".$arr_val['id']);
                        $row=mysql_fetch_assoc($real_chk);
                        $sqlPackage=mysql_query("SELECT SUM(`tunnel` + `gateway` + `bidirection` + `realip`) total FROM `package_data` WHERE `plan_id`=".$row['plan_id']);
                        $row_cost=mysql_fetch_assoc($sqlPackage);
                        $arr_val['cost']=$row_cost['total'];
                        if(mysql_query("UPDATE `real_ip_list` SET `in_use`=1 WHERE `real_ip`='".$arr_val['real_ip']."'")){
                            job_comp_stat($arr_val, $res_job['job_id']);
                        }
                    }
                }else if($res_job['action']=="change_tunnel_client"){
                    $sql_client_subnet=mysql_query("SELECT `subnet` FROM `client_subnets` WHERE `used_ips`=0") or die(mysql_error());
                    $row_client_subnet=mysql_fetch_array($sql_client_subnet);

                    if(mysql_query("UPDATE `tunnels_data` SET `tunnel_type`='client', `cloud_ip`='".$row_client_subnet['subnet']."', `real_ip`='' WHERE `tunnel_id`=".$arr_val['id'])){
                        if(mysql_query("UPDATE `client_subnets` SET `used_ips`=1 WHERE `subnet`='".$row_client_subnet['subnet']."'")){
                            $sqlPackage=mysql_query("SELECT SUM(`tunnel` + `bidirection`) total FROM `package_data` WHERE `plan_id`=1");
                            $rowPackage=mysql_fetch_assoc($sqlPackage);
                            $arr_val['cost']=$rowPackage['total'];
                            job_comp_stat($arr_val, $res_job['job_id']);
                        }
                    }

                }else if($res_job['action']=="change_tunnel_server"){
                    $sql_server_subnet=mysql_query("SELECT `subnet` FROM `server_subnets` WHERE `used_ips`=0") or die(mysql_error());
                    $row_server_subnet=mysql_fetch_array($sql_server_subnet);

                    if(mysql_query("UPDATE `tunnels_data` SET `tunnel_type`='server', `cloud_ip`='".$row_server_subnet['subnet']."', `real_ip`='' WHERE `tunnel_id`=".$arr_val['id'])){
                        if(mysql_query("UPDATE `server_subnets` SET `used_ips`=1 WHERE `subnet`='".$row_server_subnet['subnet']."'")){
                            $sqlPackage=mysql_query("SELECT SUM(`tunnel` + `gateway` + `bidirection`) total FROM `package_data` WHERE `plan_id`=1");
                            $rowPackage=mysql_fetch_assoc($sqlPackage);
                            $arr_val['cost']=$rowPackage['total'];
                            job_comp_stat($arr_val, $res_job['job_id']);
                        }
                    }

                }else if($res_job['action']=="change_location"){
                    if(mysql_query("UPDATE `tunnels_data` SET `location`='".$arr_val['value']."' WHERE `tunnel_id`=".$arr_val['id'])){
                        job_comp_stat($arr_val, $res_job['job_id']);
                    }
                }else if($res_job['action']=="real_ip_status"){
                    if(mysql_query("UPDATE `real_ip_list` SET `is_active`=".$arr_val['value']." WHERE `real_ip`='".$arr_val['ip']."'")){
                        $real_chk=mysql_query("SELECT `plan_id` FROM `tunnels_data` WHERE `tunnel_id`=".$arr_val['id']);
                        $row=mysql_fetch_assoc($real_chk);
                        if($arr_val['value']==1){
                            $sqlPackage=mysql_query("SELECT SUM(`tunnel` + `gateway` + `bidirection` + `realip`) total FROM `package_data` WHERE `plan_id`=".$row['plan_id']);
                        } else if($arr_val['value']==0){
                            $sqlPackage=mysql_query("SELECT SUM(`tunnel` + `gateway` + `bidirection`) total FROM `package_data` WHERE `plan_id`=".$row['plan_id']);
                        }

                        $row_cost=mysql_fetch_assoc($sqlPackage);
                        $arr_val['cost']=$row_cost['total'];

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
                                     '".$value[0]['display_name']."',
                                     '".$value[0]['cloud_ip']."',
                                     0, 0, 'server', ".$value[0]['group_id'].")";
                    }else if($value[0]['tunnel_type']=="client"){
                        $sql="INSERT INTO `tunnels_data` (`cloud_id`, `user_token`, `email`, `bidirectional_mode`, `display_name`, `is_complete_action`, `is_updated`, `tunnel_type`, `group_id`)
                                     VALUES (".$value[0]['cloud_id'].",
                                     '".$value[0]['token']."',
                                     '".$value[0]['email']."',
                                     '".$value[0]['bidirectional_mode']."',
                                     '".$value[0]['display_name']."',
                                     0, 0, 'client', ".$value[0]['group_id'].")";
                    }
                    $qry=mysql_query($sql) or die(mysql_error());
                    if($qry){
                        $last_id = mysql_insert_id();
                        $arr_val[0]['tunnel_id']=$last_id;
                        if($value['tunnel_type']="server"){
                            if($value[0]['display_name']!=""){
                                mysql_query("UPDATE `tunnels_data` SET `display_name`='Tunnel "+$last_id+"' WHERE `tunnel_id`=".$last_id);
                            }
                            mysql_query("UPDATE `server_subnets` SET `used_ips`=1 WHERE `subnet`='".$value[0]['cloud_ip']."'");
                        }
                        if(mysql_query("INSERT INTO `tunnel_acl_relation` SET `tunnel_id`=".$last_id)){

                            $last_acl_id = mysql_insert_id();
                            mysql_query("INSERT INTO `destination` SET `acl_id`=".$last_acl_id);
                            mysql_query("INSERT INTO `d_final` SET `acl_id`=".$last_acl_id);
                            mysql_query("INSERT INTO `c_firewall` SET `acl_id`=".$last_acl_id);
                            mysql_query("INSERT INTO `c_forwarding` SET `acl_id`=".$last_acl_id);
                            mysql_query("INSERT INTO `c_qos` SET `acl_id`=".$last_acl_id);
                            mysql_query("INSERT INTO `c_routing` SET `acl_id`=".$last_acl_id);
                            mysql_query("INSERT INTO `source` SET `acl_id`=".$last_acl_id);
                            mysql_query("INSERT INTO `s_aliasing` SET `acl_id`=".$last_acl_id);
                            mysql_query("INSERT INTO `s_firewall` SET `acl_id`=".$last_acl_id);
                            mysql_query("INSERT INTO `s_qos` SET `acl_id`=".$last_acl_id);
                            mysql_query("INSERT INTO `s_tos` SET `acl_id`=".$last_acl_id);
                            mysql_query("UPDATE `".$arr_val['val']."` SET `source-specific_tunnel`='".$last_id."' WHERE `acl_id`=".$last_acl_id);

                        }
                        else{
                            echo mysql_error();
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
                }else if($res_job['action']=="create_new_acl"){
                    if(mysql_query("INSERT INTO `tunnel_acl_relation` SET `tunnel_id`=".$arr_val['id'])){
                        $last_acl_id = mysql_insert_id();
                        if(mysql_query("INSERT INTO `destination` SET `acl_id`=".$last_acl_id)){
                            if(mysql_query("INSERT INTO `d_final` SET `acl_id`=".$last_acl_id)){
                                if(mysql_query("INSERT INTO `c_firewall` SET `acl_id`=".$last_acl_id)){
                                    if(mysql_query("INSERT INTO `c_firewall` SET `acl_id`=".$last_acl_id)){
                                        if(mysql_query("INSERT INTO `c_forwarding` SET `acl_id`=".$last_acl_id)){
                                            if(mysql_query("INSERT INTO `c_qos` SET `acl_id`=".$last_acl_id)){
                                                if(mysql_query("INSERT INTO `c_routing` SET `acl_id`=".$last_acl_id)){
                                                    if(mysql_query("INSERT INTO `source` SET `acl_id`=".$last_acl_id)){
                                                        if(mysql_query("INSERT INTO `s_aliasing` SET `acl_id`=".$last_acl_id)){
                                                            if(mysql_query("INSERT INTO `s_firewall` SET `acl_id`=".$last_acl_id)){
                                                                if(mysql_query("INSERT INTO `s_qos` SET `acl_id`=".$last_acl_id)){
                                                                    if(mysql_query("INSERT INTO `s_tos` SET `acl_id`=".$last_acl_id)){
                                                                        if(mysql_query("UPDATE `".$arr_val['val']."` SET `".$arr_val['val']."-specific_tunnel`='".$res_job['tunnel_id']."' WHERE `acl_id`=".$last_acl_id)){
                                                                            job_comp_stat($arr_val, $res_job['job_id']);
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }else if($res_job['action']=="delete_acl"){
                    if(mysql_query("DELETE FROM `tunnel_acl_relation` WHERE `id`=".$arr_val['id'])){
                        if(mysql_query("DELETE FROM `destination` WHERE `acl_id`=".$arr_val['id'])){
                            if(mysql_query("DELETE FROM `d_final` WHERE `acl_id`=".$arr_val['id'])){
                                if(mysql_query("DELETE FROM `c_firewall` WHERE `acl_id`=".$arr_val['id'])){
                                    if(mysql_query("DELETE FROM `c_forwarding` WHERE `acl_id`=".$arr_val['id'])){
                                        if(mysql_query("DELETE FROM `c_qos` WHERE `acl_id`=".$arr_val['id'])){
                                            if(mysql_query("DELETE FROM `c_routing` WHERE `acl_id`=".$arr_val['id'])){
                                                if(mysql_query("DELETE FROM `source` WHERE `acl_id`=".$arr_val['id'])){
                                                    if(mysql_query("DELETE FROM `s_aliasing` WHERE `acl_id`=".$arr_val['id'])){
                                                        if(mysql_query("DELETE FROM `s_firewall` WHERE `acl_id`=".$arr_val['id'])){
                                                            if(mysql_query("DELETE FROM `s_qos` WHERE `acl_id`=".$arr_val['id'])){
                                                                if(mysql_query("DELETE FROM `s_tos` WHERE `acl_id`=".$arr_val['id'])){
                                                                   job_comp_stat($arr_val, $res_job['job_id']);
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }else if($res_job['action']=="clear_acl_values"){
                    if(mysql_query("UPDATE `destination` SET `destination-any`='0',`destination-internet`='0',`destination-specific_tunnel`='0',`destination-specific_group`='0',`destination-my_cloud`='0',`destination-my_clouds`='0',`destination-every_cloud`='0' WHERE `acl_id`=".$arr_val['id'])){
                        if(mysql_query("UPDATE `d_final` SET `d_final-ip_port`='0',`d_final-process`='0',`d_final-app`='0' WHERE `acl_id`=".$arr_val['id'])){
                            if(mysql_query("UPDATE `c_firewall` SET `c_firewall-deny_all`='0',`c_firewall-allow_all`='0',`c_firewall-apps`='0',`c_firewall-ip_port_protoco`='0',`c_firewall-websites`='0' WHERE `acl_id`=".$arr_val['id'])){
                                if(mysql_query("UPDATE `c_forwarding` SET `c_forwarding-new_dst`='0' WHERE `acl_id`=".$arr_val['id'])){
                                    if(mysql_query("UPDATE `c_qos` SET `c_qos-shaping`='0' WHERE `acl_id`=".$arr_val['id'])){
                                        if(mysql_query("UPDATE `c_routing` SET `c_routing-tos_to_gateway`='0',`c_routing-country`='0' WHERE `acl_id`=".$arr_val['id'])){
                                            if(mysql_query("UPDATE `source` SET `source-any`='0',`source-internet`='0',`source-specific_tunnel`='0',`source-specific_group`='0',`source-my_cloud`='0',`source-my_clouds`='0',`source-every_cloud`='0' WHERE `acl_id`=".$arr_val['id'])){
                                                if(mysql_query("UPDATE `s_aliasing` SET `s_aliasing-new_dst`='0' WHERE `acl_id`=".$arr_val['id'])){
                                                    if(mysql_query("UPDATE `s_firewall` SET `s_firewall-deny_all`='0',`s_firewall-allow_all`='0',`s_firewall-processes`='0',`s_firewall-apps`='0' WHERE `acl_id`=".$arr_val['id'])){
                                                        if(mysql_query("UPDATE `s_qos` SET `s_qos-shaping`='0',`s_qos-priority`='0' WHERE `acl_id`=".$arr_val['id'])){
                                                            if(mysql_query("UPDATE `s_tos` SET `s_tos-bind_all`='0',`s_tos-processes`='0',`s_tos-apps`='0' WHERE `acl_id`=".$arr_val['id'])){
                                                               job_comp_stat($arr_val, $res_job['job_id']);
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }else if($res_job['action']=="create_acl_clone"){

                    if(mysql_query("INSERT INTO `tunnel_acl_relation` SET `tunnel_id`=".$res_job['tunnel_id'])){
                        $last_id = mysql_insert_id();
                        $table="";
                        $field="";
                        $arr=array();
                        foreach ($arr_val as $key => $value) {
                            foreach ($value as $k => $val) {
                                $table=$k;
                                if(is_array($val)){
                                    foreach ($val as $t => $v) {
                                        $field.=" `".$table."-".$t."` = '".$v['value']."', ";
                                    }
                                    $query="INSERT INTO `".$table."` SET `acl_id` = ".$last_id.", ".rtrim($field, ", ");
                                    mysql_query($query);
                                    $field="";
                                }
                            }
                        }
                        foreach ($arr_val as $key => $value){
                            $arr[$last_id]=$value;
                        }
                        job_comp_stat($arr, $res_job['job_id']);
                    }
                }else if($res_job['action']=="save_acl_values"){
                    foreach ($arr_val['data'] as $key => $value) {
                        foreach ($value as $ky => $val) {
                            foreach ($val as $k => $v) {
                                //echo "UPDATE `".$ky."` SET `".$ky."-".$k."`='".$v."' WHERE `acl_id`=".$key;
                                mysql_query("UPDATE `".$ky."` SET `".$ky."-".$k."`='".$v."' WHERE `acl_id`=".$key);
                            }
                        }
                    }
                    job_comp_stat($arr_val, $res_job['job_id']);
                }else if($res_job['action']=="change_acl"){
                    if($arr_val['val']=="source"){
                        if(mysql_query("UPDATE `destination` SET `destination-specific_tunnel`='".$arr_val['tid']."' WHERE `acl_id`=".$arr_val['id'])){
                            if(mysql_query("UPDATE `source` SET `source-specific_tunnel`='0' WHERE `acl_id`=".$arr_val['id'])){
                                job_comp_stat($arr_val, $res_job['job_id']);
                            }
                        }
                    }
                }
            }
        }
        $threaob->kill();
    }

    function job_comp_stat($data, $job_id){
        mysql_query("UPDATE `job_queue` SET `is_complete_action`=2, `old_data`='".serialize($data)."' WHERE `job_id`=".$job_id);
        echo mysql_error();
    }

    while (true){
        $db = mysql_connect($config['DB_HOST'], $config['DB_USER'], $config['DB_PASS'], $config['DB_NAME']) or die(mysql_error());
        mysql_select_db($config['DB_NAME'], $db) or die(mysql_error());

        $sqlCheck=mysql_query("SELECT * FROM `job_queue` WHERE `is_complete_action`=0");
        if(mysql_num_rows($sqlCheck)>0){
            $thread = new Thread('vpn_jobs');
            $thread->start($thread);
            sleep(5);
        }
        mysql_close($db);
    }

?>
