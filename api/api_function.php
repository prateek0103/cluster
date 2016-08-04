<?php
function job_queue_info(){
  global $db;
  $arr=array();
  $sql=$db->query("SELECT * FROM `job_queue` WHERE `is_complete_action`<>2 GROUP BY `tunnel_id`");
  if($sql->num_rows>0){
    while($res=$sql->fetch_assoc()){
      $arr[]=$res['tunnel_id'];
    }
  }
  return $arr;
}

//server user name
function server_username(){
    $id=time().rand();
    $b=strlen($id);
    $c=5;
    $d=$c-$b;
    $a="";
    for($i=0; $i<$d; $i++){
        $j=0;
        $a.=$j;

    }
    return 'VPN'.$a.$id.'S';
}

//server password
function server_password(){
    $array=array("1"=>"1", "2"=>"2", "3"=>"3", "4"=>"4", "5"=>"5", "6"=>"6", "7"=>"7", "8"=>"8", "9"=>"9", "0"=>"0", "a"=>"a", "b"=>"b", "c"=>"c", "d"=>"d", "e"=>"e", "f"=>"f", "g"=>"g", "h"=>"h", "i"=>"i", "j"=>"j", "k"=>"k", "l"=>"l", "m"=>"m", "n"=>"n", "o"=>"o", "p"=>"p", "q"=>"q", "r"=>"r", "s"=>"s", "t"=>"t", "u"=>"u", "v"=>"v", "w"=>"w", "x"=>"x", "y"=>"y", "z"=>"z", "1"=>"1", "2"=>"2", "3"=>"3", "4"=>"4", "5"=>"5", "6"=>"6", "7"=>"7", "8"=>"8", "9"=>"9", "0"=>"0", "A"=>"A", "B"=>"B", "C"=>"C", "D"=>"D", "E"=>"E", "F"=>"F", "G"=>"G", "H"=>"H", "I"=>"I", "J"=>"J", "K"=>"K", "L"=>"L", "M"=>"M", "N"=>"N", "O"=>"O", "P"=>"P", "Q"=>"Q", "R"=>"R", "S"=>"S", "T"=>"T", "U"=>"U", "V"=>"V", "W"=>"W", "X"=>"X", "Y"=>"Y", "Z"=>"Z", "@"=>"@", "#"=>"#", "&"=>"&", "%"=>"%", "1"=>"1", "2"=>"2", "3"=>"3", "4"=>"4", "5"=>"5", "6"=>"6", "7"=>"7", "8"=>"8", "9"=>"9", "0"=>"0");
    $var="";
    for($i=0; $i<6; $i++){
        $val=array_rand($array);
        $var.=$val;
    }
    return $var;
}
//to manage all job queue insertion
function remote($id, $action, $data, $group, $token){
    global $db;
    if($db->query("INSERT INTO `job_queue` (`tunnel_id`, `action`, `group`, `new_data`, `added_time`, `token`) VALUES('".$id."', '".$action."', '".$group."', '".serialize($data)."', now(), '".$token."')")){
        return true;
    }
    else{
      echo mysql_error();
    }
}


//login section
function dologin($data){
   global $db;
   //echo "SELECT COUNT(*) AS `total`, `login_type`, `email`, `password`, `customer_id` FROM `customers_data` WHERE `email`='" . $db->real_escape_string($data['email']) . "' AND `is_active`='1' AND `is_verfied`=1";
   $sql = $db->query("SELECT COUNT(*) AS `total`, `login_type`, `name`, `email`, `token`, `password`, `customer_id` FROM `customers_data` WHERE `email`='" . $db->real_escape_string($data['email']) . "' AND `is_active`='1' AND `is_verfied`=1");
   $row = $sql->fetch_assoc();

   if ($row['total'] == 1) {

      $pass = $data['password'];
      $pass = substr($pass, 0, 2) . $pass . substr($pass, -2, 2);
      if($row['login_type'] == 'normal'){
         if ($row['password'] == md5($pass)) {
            $_SESSION['vpn_user'] = md5($row['customer_id']);
            $_SESSION['user_id'] = $row['customer_id'];
            $_SESSION['uname']=explode(" ", $row['name']);
            $_SESSION['email'] = $row['email'];
            $_SESSION['token'] = $row['token'];
            $_SESSION['user_type'] = 'customer';
            /* $path="../app/contacts.php";
            header('location:'.$path);*/
            $return_values = array('user_id'=>$row['customer_id'], 'email'=>$row['email'], 'token'=>$row['token']);
            return array("status" => 1, 'data' => 'Login Successfull', 'type'=>'login', 'message_type'=>'reply', 'value'=>$return_values);
         }
         else {
            return array("status" => 0, 'data' => 'Wrong username or password', 'type'=>'login', 'message_type'=>'reply', 'value'=>array());
         }
      }
      else if($row['login_type'] == 'google') {
            $_SESSION['vpn_user'] = md5($row['customer_id']);
            $_SESSION['pre_user_id'] = $row['customer_id'];
            $_SESSION['user_id'] = $row['customer_id'];
            $_SESSION['uname']=explode(" ", $row['name']);
            $_SESSION['token'] = $row['token'];
            $_SESSION['user_type'] = 'customer';
             $path="contacts.php";
             header('location:'.$path); //seems strange. check how gauth works!
          return null;
       }
  }
  return array("status" => 0, 'data' => 'User not exist', 'type'=>'login', 'message_type'=>'reply', 'value'=>array());
}

//registration section
function doregister($data)
{
                global $db;
                $def_cash_qry = $db->query("SELECT `settings_value` FROM `settings` WHERE `settings_name`='default_cash'");
                $def_cash = $def_cash_qry->fetch_assoc();
                $sql = $db->query("SELECT COUNT(*) AS `total` FROM `customers_data` WHERE `email`='" . $db->real_escape_string($data['email']) . "'");
                $row = $sql->fetch_assoc();
                if ($row['total'] == 0) {
                    $pass = $db->real_escape_string($data['password']);
                    $pass = substr($pass, 0, 2) . $pass . substr($pass, -2, 2);
                    $token=md5($data['email'].time());

                    if ($db->query("INSERT INTO `customers_data` (`email`, `password`, `name`, `token`, `is_active`, `is_verfied`, `Cash_amount`) VALUES ('".$db->real_escape_string(trim($data['email']))."', '".md5($pass)."','".$data['name']."', '".$token."', 1, 1, ".$def_cash['settings_value'].")")) {
                       $current_id=$db->insert_id;
                       if(!empty($current_id)) {
                          /* $subject ='Confirm Your Email Address';
                           $message ='<html>
                               <head>
                                   <title>"'.$subject.'"</title>
                               </head>
                               <body>
                               Thank you for registration. You are just one step behind to get the experience of latest VPN technology. Please click on the following
                               <a href="http://dev.comenzarit.com/demovpn/activate.php?id='.$current_id.'">click to confirm you email address and activate your account.</a>
                               </body>
                           </html>';
                           $headers = "MIME-Version: 1.0" . "\r\n";
                           $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
                           $headers .= 'From:DemoVPN <demovpn@comenzarit.com>' . "\r\n";
                           mail($_POST['email'],$subject,$message,$headers);*/
                        }
                        return array("status" => 1, 'data' => 'Successfully created a new user', 'type'=>'signup', 'message_type'=>'reply', 'value'=>array());
                    } else {
                        return array("status" => 0, 'data' => 'Sorry, unknown error occurred, try again later', 'type'=>'signup', 'message_type'=>'reply', 'value'=>array());
                    }
                } else {
                    return array("status" => 0, 'data' => 'This email is already registered', 'type'=>'signup', 'message_type'=>'reply', 'value'=>array());
                }
}

//contact delete section
  function dodel_cus($data){
    global $db;
      $sql = $db->query("DELETE FROM `users_data` WHERE `id`='".$data."'");
        if ($sql) {
          return array("status" => 1, 'data' => 'Successfully Deleted');
        } else {
          return array("status" => 0, 'data' => 'Ops some error occured! try again later');
        }
    }

//profile update section
    function doupdate_profile($data){
      echo "<pre>";
      print_r($data);die;
     global $db;
     if($db->query("update `customers_data` set `name`='".$db->real_escape_string($data['name'])."', phone=".$db->real_escape_string($data['phone']).", remail='".$db->real_escape_string($data['reemail'])."' WHERE `customer_id`=".$db->real_escape_string($_SESSION['user_id'])."")){

       $arr=array("id"=>$_SESSION['user_id'], "name"=>$data['name'], "phone"=>$data['phone'], "remail"=>$data['reemail']);
       //json example array(status, message, property type, all data)
       return array("status" => 1, 'data' => 'Successfully updated', "type"=>"doupdate_profile", "value"=>$arr);
     }
   }

//change password section
    function changePassword($data){
      global $db;
      $pass = $db->real_escape_string($data['opassword']);
      $pass = substr($pass, 0, 2) . $pass . substr($pass, -2, 2);
      $npass = $db->real_escape_string($data['password']);
      $npass = substr($npass, 0, 2) . $npass . substr($npass, -2, 2);
      $sql=$db->query("SELECT * from `customers_data` where `password`='".md5($pass)."' AND `customer_id`=".$db->real_escape_string($_SESSION['user_id'])."");
      if($sql->num_rows>0){
        $db->query("update `customers_data` set `password`='".md5($npass)."' where `customer_id`=".$db->real_escape_string($_SESSION['user_id'])."");
        return array("status" => 1, 'data' => 'Successfully updated');
      }else{
        return array("status" => 0, 'data' => 'Password not match with old password');
      }
    }

//add contact manually section
  function doaddcontact(){
    global $db;
    if($db->query("INSERT INTO `users_data` SET `user_email`='".$db->real_escape_string(trim($_POST['contact_mail']))."', `name`='".$db->real_escape_string(trim($_POST['contact_name']))."'")) {
        $id = $db->insert_id;
      } else {
                $sql = $db->query("SELECT `id` FROM `users_data` WHERE `user_email`='".$db->real_escape_string(trim($_POST['contact_mail']))."'");
                $row = $sql->fetch_assoc();
                $id = $row['id'];
            }
            if($db->query("INSERT INTO `customer_user_relations` SET `customer_id`='" . $db->real_escape_string($_SESSION['user_id']) . "', `user_id`='" . $id . "'"))
            {
                return array("status" => 1, 'data' => 'Successfully added');
            } else {
                return array("status" => 0, 'data' => 'Contact already exists');
            }
  }

  function addVoucher(){
    global $db;

    $sql=$db->query("SELECT * FROM `voucher` WHERE `voucher_no`='".$_POST['voucher']."' AND `is_active`=1");
    $row = $sql->fetch_assoc();

    $sql1=$db->query("SELECT * from `customers_data` where `token`='".$db->real_escape_string($_SESSION['token'])."'");
    $row1 = $sql1->fetch_assoc();

     $voucher_id=$row['id'];
     $voucher_amt=$row['amount'];
     $cash_amt=$row1['Cash_amount'];

     $sql3=$db->query("UPDATE `customers_data` SET `Cash_amount`=$cash_amt+$voucher_amt WHERE `token`='".$db->real_escape_string($_SESSION['token'])."'");
     if($sql3){
        $db->query("UPDATE `voucher` SET `is_active`=0 where `id`=".$voucher_id);
        return array("status" => 1, 'data' => 'Successfully Applied This Voucher');
      } else {
        return array("status" => 0, 'data' => 'Invalid Voucher');
      }
}

  function update_plan($data){
    global $db;
    $sql3=$db->query("UPDATE `customers_data` SET `plan_id`='".$data."' WHERE `customer_id`=".$db->real_escape_string($_SESSION['user_id'])."");
    if($sql3){
      $arr=array("id"=>$_SESSION['user_id'], "plan_id"=>$data);
      return array("status" => 1, 'data' => 'Successfully Modify Your Plan', "type"=>"update_plan", "value"=>$arr);
    }else{
      return array("status" => 0, 'data' => 'Ops some error occured! try again later');
    }
  }

//status change php section
function status($stat, $tunnel_id){
    $html="";
    /*  if($stat >= 0 && $stat < 2) {
        $html .= '<input type="hidden" class="edit_status_s" name="status" value=' . $stat . '>';
        $html .= '<div class="status st_ch_status_' . $stat . ' tunnel_stat_' . $tunnel_id . '" type="data" data-toggle="tooltip" title="Active" data-cast="' . $_SESSION['user_id'] . '" data-val="' . $stat . '" data-id="' . $tunnel_id . '"><i class="fa fa-fw fa-circle"></i></div>';
    }*/
    if($stat==1){
        $html.='<input type="hidden" class="edit_status_s" name="status" value=1>';
        $html.='<div class="status tunnel_stat_'.$tunnel_id.'" type="data" data-toggle="tooltip" title="Active" data-cast="'.$_SESSION['user_id'].'" data-val="1" data-id="'.$tunnel_id.'"><i class="fa fa-fw fa-circle" style="color:#1D9E74"></i></div>';

    }else if($stat==0){
        $html.='<input type="hidden" class="edit_status_s" name="status" value=0>';
        $html.='<div class="status tunnel_stat_'.$tunnel_id.'" type="data" data-toggle="tooltip" title="Inactive" data-cast="'.$_SESSION['user_id'].'" data-val="0" data-id="'.$tunnel_id.'"><i class="fa fa-fw fa-circle"  style="color:#DA3838"></i></div>';
    }
    return $html;
}

function task_server_status($tunnel_id) {
    global $db;
    $sql = $db->query("SELECT rs.`remote_ip`, MIN(IFNULL(js.`status`, 0)) as status FROM `remote_server_list` as rs LEFT JOIN `job_queue` as jq ON rs.`remote_group`=jq.`group` LEFT JOIN `job_status` AS js ON js.`job_id` = jq.`job_id` AND js.`server_id`=rs.`id`  WHERE jq.`is_complete_action`=0 AND jq.`tunnel_id`=".$tunnel_id."  GROUP BY rs.`remote_ip`");
    $result = array();
    while($row=$sql->fetch_assoc())
    {
        $result[] = $row;
    }
    return $result;
}

//gateway change php section
function gateway($stat, $tunnel_id, $type){
    $html="";
    if($type!="client"){
      /*  if($stat >= 0 && $stat < 2) {
            $html .= '<input type="hidden" class="edit_gateway_s" name="gateway" value=' . $stat . '>';
            $html .= '<div class="gateway_stat_' . $stat . ' gateway tunnel_gate_' . $tunnel_id . '"  data-pos="0" type="data" data-toggle="tooltip" title="No" data-cast="' . $_SESSION['user_id'] . '" data-val="' . $stat .  '" data-id="' . $tunnel_id . '"><i class="fa fa-times"></i></div>';
        }*/
          if($stat==0){
              $html.='<input type="hidden" class="edit_gateway_s" name="gateway" value=0>';
              $html.='<div class="gateway tunnel_gate_'.$tunnel_id.'"  data-pos="0" type="data" data-toggle="tooltip" title="No" data-cast="'.$_SESSION['user_id'].'" data-val="0" data-id="'.$tunnel_id.'"><i class="fa fa-times" style="color:#DA3838"></i></div>';
            /*$html.='<div class="lock_btn" data-i="unlock"><i class="fa fa-unlock"></i></div>';
            $html.='<div class="lock_btn" data-i="lock"><i class="fa fa-lock"></i></div>';*/
          }else if($stat==1){
              $html.='<input type="hidden" class="edit_gateway_s" name="gateway" value=1>';
              $html.='<div class="gateway tunnel_gate_'.$tunnel_id.'"  data-pos="0" type="data" data-toggle="tooltip" title="Yes" data-cast="'.$_SESSION['user_id'].'" data-val="1" data-id="'.$tunnel_id.'"><i class="fa fa-check" style="color:#1D9E74"></i></div>';
            /*$html.='<div class="lock_btn" data-i="unlock"><i class="fa fa-unlock"></i></div>';
            $html.='<div class="lock_btn" data-i="lock"><i class="fa fa-lock"></i></div>';*/
        }
    }
    return $html;
}

//bidirection change php section
function biderection ($stat, $tunnel_id){
    $html="";
   if($stat==0){
        $html.='<input type="hidden" id="edit_biderection_s" name="biderection" value=0>';
        $html.='<div class="biderection tunnel_bi_'.$tunnel_id.'"  data-pos="0" type="data" data-toggle="tooltip" title="Mode 1" data-ctrl="0" data-cast="'.$_SESSION['user_id'].'" data-val="0" data-id="'.$tunnel_id.'" data-url="change_biderection">';
        $html.='<i class="fa fa-chevron-left"></i><i class="fa fa-chevron-right"></i></div>';
    }
    if($stat==1){
        $html.='<input type="hidden" id="edit_biderection_s" name="biderection" value=1>';
        $html.='<div class="biderection tunnel_bi_'.$tunnel_id.'"  data-pos="0" type="data" data-toggle="tooltip" title="Mode 2" data-ctrl="0" data-cast="'.$_SESSION['user_id'].'" data-val="1" data-id="'.$tunnel_id.'" data-url="change_biderection">';
        $html.='<i class="fa fa-chevron-left" style="color:#1D9E74"></i><i class="fa fa-chevron-right" style="color:#1D9E74"></i></div>';

    }
    if($stat==2){
        $html.='<input type="hidden" id="edit_biderection_s" name="biderection" value=2>';
        $html.='<div class="biderection tunnel_bi_'.$tunnel_id.'"  data-pos="0" type="data" data-toggle="tooltip" title="Mode 3" data-ctrl="0" data-cast="'.$_SESSION['user_id'].'" data-val="2" data-id="'.$tunnel_id.'" data-url="change_biderection">';
        $html.='<i class="fa fa-chevron-left" style="color:#1D9E74"></i><i class="fa fa-chevron-right"></i></div>';
    }
    if($stat==3){
        $html.='<input type="hidden" id="edit_biderection_s" name="biderection" value=3>';
        $html.='<div class="biderection tunnel_bi_'.$tunnel_id.'"  data-pos="0" type="data" data-toggle="tooltip" title="Mode 4" data-ctrl="0" data-cast="'.$_SESSION['user_id'].'" data-val="2" data-id="'.$tunnel_id.'" data-url="change_biderection">';
        $html.='<i class="fa fa-chevron-left"></i><i class="fa fa-chevron-right" style="color:#1D9E74"></i></div>';
    }
    return $html;
}

//Tunnels show by the tunnel function
function tunnels($tunnel, $is_shared=false){
  $group_arr=array('<span style="color: #ea4335;"><strong>A</strong></span>', '<span style="color: #839D1C;"><strong>B</strong></span>', '<span style="color: #00A998;"><strong>C</strong></span>', '<span style="color: #F6AE00;"><strong>D</strong></span>', '<span style="color: #4285F4;"><strong>E</strong></span>', '<span style="color: #330033;"><strong>F</strong></span>', '<span style="color: #FF404E;"><strong>G</strong></span>', '<span style="color: #FFFF00;"><strong>H</strong></span>', '<span style="color: #FF3300;"><strong>I</strong></span>', '<span style="color: #CC6600;"><strong>J</strong></span>', '<span style="color: #9999CC;"><strong>K</strong></span>', '<span style="color: #0000CC;"><strong>L</strong></span>', '<span style="color: #FF0000;"><strong>M</strong></span>', '<span style="color: #003366;"><strong>N</strong></span>', '<span style="color: #003333;"><strong>0</strong></span>', '<span style="color: #FF00CC;"><strong>P</strong></span>', '<span style="color: #FF0066;"><strong>Q</strong></span>', '<span style="color: #CC0000;"><strong>R</strong></span>', '<span style="color: #CC6600;"><strong>S</strong></span>', '<span style="color: #666666;"><strong>T</strong></span>', '<span style="color: #330066;"><strong>U</strong></span>', '<span style="color: #CC99CC;"><strong>V</strong></span>', '<span style="color: #FFCC66;"><strong>W</strong></span>', '<span style="color: #FF3399;"><strong>X</strong></span>', '<span style="color: #99CCFF;"><strong>Y</strong></span>', '<span style="color: #0099FF;"><strong>Z</strong></span>');
   $html="";
   foreach ($tunnel as  $data) {
    $html.='<div class="p_div">';
        $html.='<div id="p_div_'.$data['tunnel_id'].'">';
            //if($data['plan_id']!=1){
                 $html .= '<a class="btn holbol acc_type cursor acc_type_' . $data['tunnel_id'] . '" data-id="' . $data['tunnel_id'] . '" data-val="' . $data['plan_id'] . '" data-toggle="tooltip" data-placement="bottom" ' . ($data['plan_id'] == 1 ? "style='margin-left: 0px; background-color:#b9c3c8; '" : "style='margin-left: 0px; background-color:transparent;  color: black; opacity:0.25'") . '>Premium</a>';

            //}
            //if($data['route']==1){
                $html.='<a data-val="'.$data['route'].'" class="btn holbol route_change cursor tunnel_route_'.$data['tunnel_id'].'" type="data" data-pos="0" data-id="'.$data['tunnel_id'].'" '.($data['route']==1?"style='background-color:#b9c3c8'":"style='background-color:transparent;  color: black; opacity:0.25'").'>Route</a>';
            //}

            //if($data['internet']==1){
                $html.='<a data-val="'.$data['internet'].'" class="btn holbol internet_change cursor tunnel_internet_'.$data['tunnel_id'].'" type="data" data-pos="0" data-id="'.$data['tunnel_id'].'" '.($data['internet']==1?"style='background-color:#b9c3c8'":"style='background-color:transparent; color: black; opacity:0.25'").'>Internet</a>';
            //}
            $opacity = '';
            if($is_shared == false){
              $opacity = 'opacity:0.25; color: black; background-color: transparent;';
            }
            $html.='<a data-val="" class="btn holbol sponsore sponsored_'.$data['tunnel_id'].'" type="data" data-pos="0" data-tid="'.$data['tunnel_id'].'"  data-cloud="'.$data['cloud_id'].'" data-u="'.$_SESSION['user_id'].'" style="background-color:#1D9E74;'.$opacity.'">Sponsored</a>';

            $html.='<a class="btn holbol change_tunnel change_tunnel_'.$data['tunnel_id'].'" data-id="'.$data['tunnel_id'].'" data-type="'.($data['tunnel_type']!="client"?"server":"client").'" href="javascript:void(0)" '.($data['tunnel_type']!="client"?"style='background-color:#b9c3c8'":"style='background-color:transparent;  color: black; opacity:0.25'").'>Server';

            $html.='</a>';

        $html.='</div>';

        if($data['tunnel_type']=="client"){
            if($data['status']!=0){
              $html.='<div class="list_body bg_yellow tunnel_body tunnel_body_'.$data['tunnel_id'].'">';
            }else if($data['status']==0){
                $html.='<div class="list_body bg_yellow tunnel_body tunnel_body_'.$data['tunnel_id'].'" style="background-color:#cecece">';
            }
          }else{
            if($data['status']!=0){
              $html.='<div class="list_body bg_green tunnel_body tunnel_body_'.$data['tunnel_id'].'">';
            }else if($data['status']==0){
              $html.='<div class="list_body bg_green tunnel_body tunnel_body_'.$data['tunnel_id'].'" style="background-color:#cecece">';
            }
          }

         $html.='<div class="meta">';
            $html.='<a href="javascript:void(0)" class="showACL" data-toggle="tooltip" data-placement="right" title="ACL view" data-cloud="'.$data['cloud_id'].'" data-type="'.$data['tunnel_type'].'" data-id="'.$data['tunnel_id'].'"><i class="fa fa-wrench"></i></a>';
            $html.='<a href="javascript:void(0)" class="btn_add_acl btn_add_acl_'.$data['tunnel_id'].'" data-toggle="tooltip" data-placement="right" title="Create ACL" data-id="'.$data['tunnel_id'].'"><i class="fa fa-fw fa-plus" style="margin-left: 5px; font-size: 10px;"></i></a>';
        $html.='</div>';

         //$html.='<div class="meta" data-toggle="tooltip" data-placement="right" title="'.($data['tunnel_type']!="client"?"Downgrade to client":"Upgrade to server").'"><a href="javascript:void(0)" class="change_tunnel change_tunnel_'.$data['tunnel_id'].'" data-type="'.$data['tunnel_type'].'" data-id="'.$data['tunnel_id'].'">'.($data['tunnel_type']!="client"?"<i class='fa fa-long-arrow-down'></i>":"<i class='fa fa-long-arrow-up'></i>").'</a></div>';

         $html.='<div class="meta" data-toggle="tooltip" title="Add clone"><a href="javascript:void(0)" class="add_clone" data-type="'.$data['tunnel_type'].'" data-id="'.$data['tunnel_id'].'"><i class="fa fa-fw fa-plus"></i></a></div>';

         $html.='<div class="meta" data-toggle="tooltip" title="Save this"><a href="javascript:void(0)" class="save_this_client" data-type="'.$data['tunnel_type'].'" data-id="'.$data['tunnel_id'].'"><i class="fa fa-floppy-o"></i></a></div>';

         $html.='<div class="meta cursor tunnel_chk tunnel_'.$data['tunnel_id'].' tunnel_grp_chk_'.$data['group_id'].'" data-val="0" data-id="'.$data['tunnel_id'].'" data-toggle="tooltip" title="Select tunnel"><i class="fa fa-fw fa-square-o"></i></div>';

         $html.='<div class="meta cursor tunnel_grp" data-toggle="tooltip" data-gid="'.$data['group_id'].'" title="'.$data['group_id'].'"><div class="group tunnel_grp_'.$data['tunnel_id'].'" type="data" data-cast="'.$_SESSION['user_id'].'" data-val="'.$data['group_id'].'" data-id="'.$data['tunnel_id'].'" data-pos="0">'.(array_key_exists($data['group_id'], $group_arr)?$group_arr[$data['group_id']]:"").'</div></div>';

         //$html.='<div class="meta width-140 tunnel_email_'.$data['tunnel_id'].'" data-toggle="tooltip" data-placement="bottom" title="'.$data['email'].'">'.$data['email'].'</div>';
         $html.='<div class="meta width-120 tunnel_display_'.$data['tunnel_id'].'" data-toggle="tooltip" data-placement="bottom" title="'.$data['display_name'].'"><a href="javascript:void(0);" class="display display_'.$data['tunnel_id'].' tunnel_editable" data-type="text" data-pk="'.$data['tunnel_id'].'" data-title="Enter display name">'.($data['display_name']!=""?$data['display_name']:"Tunnel ".$data['tunnel_id']).'</a></div>';

         $html.='<div class="meta cursor">'.biderection($data['bidirectional_mode'], $data['tunnel_id']).'</div>';
         $html.='<div class="meta width-80 tunnel_location_'.$data['tunnel_id'].'" data-toggle="tooltip" title=""><a href="javascript:void(0);" class="change_location location_'.$data['tunnel_id'].' tunnel_editable" data-type="select" data-source="request.php?request=get_server_name" data-pk="'.$data['tunnel_id'].'">'.($data['location']!=null?$data['location']:"Select Location").'</a></div>';
         //new
         $dev_class = 'dev-disconnect';
        $dev_message = 'Disconnected';
           if($data['dev_status'] == 1){
               $dev_class = 'dev-connected';
               $dev_message = $data['DeV'];
           }
           elseif($data['dev_status'] == 0){
               $dev_class = 'dev-connecting';
               $dev_message = 'Initiating';
           }
           elseif($data['dev_status'] == -1){
               $dev_class = 'dev-disconnected';
               $dev_message = 'Disconnected';
           }
         $html.='<div class="meta width-170" style="width:78px;"><div class="dev_status  '.$dev_class.'"  data-tid="'.$data['tunnel_id'].'" id="DeV_'.$data['tunnel_id'].'" data-toggle="tooltip" data-placement="bottom" title="" style="width:100%;">'.$dev_message.'</div></div>';

         $html.='<div class="meta width-80 subnet_'.$data['tunnel_id'].'" data-toggle="tooltip" title="'.$data['cloud_ip'].'">'.$data['cloud_ip'].'</div>';
         $tunnel_cost = packages($data['tunnel_type'], $data['plan_id'], $data['tunnel_id']);
         $html.='<div class="meta plan_cost_'.$data['tunnel_id'].'" data-toggle="tooltip" title="Tunnel points '.$tunnel_cost*cash_to_point().'">'.$tunnel_cost*cash_to_point().'</div>';

         $html.='<span class="not_client_'.$data['tunnel_id'].'">';
         if($data['tunnel_type']!="client"){
            $html.='<div class="meta width-100" data-toggle="tooltip" title="'.($data['real_ip']!=null?$data['real_ip']:"Not assigned").'"><a href="javascript:void(0);" class="real_ip real_ip_'.$data['tunnel_id'].'" style="'.($data['active']==0?"color:#1B1E24":"color:#1D9E74").'" data-val="'.($data['active']!=null?$data['active']:-1).'" data-id="'.$data['tunnel_id'].'">'.($data['real_ip']!=null?$data['real_ip']:"Not assigned").'</a></div>';

            $html.='<div class="meta cursor">'.gateway($data['gateway_mode'], $data['tunnel_id'], $data['tunnel_type']).'</div>';
         } else {
            $html.='<div class="meta width-100" data-toggle="tooltip" data-placement="right" title="'.($data['tunnel_type']!="client"?"":"To activate this field upgrade to server").'"><a href="javascript:void(0)" class="change_tunnel change_tunnel_'.$data['tunnel_id'].'" data-type="'.$data['tunnel_type'].'" data-id="'.$data['tunnel_id'].'">'.($data['tunnel_type']!="client"?"<i class='fa fa-long-arrow-down'></i>":"<i class='fa fa-long-arrow-up'></i>").'</a></div>';

            $html.='<div class="meta" data-toggle="tooltip" data-placement="right" title="'.($data['tunnel_type']!="client"?"":"To activate this field upgrade to server").'"><a href="javascript:void(0)" class="change_tunnel change_tunnel_'.$data['tunnel_id'].'" data-type="'.$data['tunnel_type'].'" data-id="'.$data['tunnel_id'].'">'.($data['tunnel_type']!="client"?"<i class='fa fa-long-arrow-down'></i>":"<i class='fa fa-long-arrow-up'></i>").'</a></div>';
         }
         $html.='</span><div class="meta" data-toggle="tooltip" title="Delete this tunnel" ><a href="javascript:void(0);" data-id="'.$data['tunnel_id'].'" class="delete_tunnel delete_tunnel_'.$data['tunnel_id'].'" data-type="'.$data['tunnel_type'].'"><i class="fa fa-fw fa-trash" style="color:#DA3838"></i></a></div>';

         $html.='<div class="meta cursor">'.status($data['status'], $data['tunnel_id']).'</div>';

      $html.='</div>';
      $html.='</div>';
      $html.='<div class="tunnel_acl_div_'.$data['tunnel_id'].' tunnel_acl_div" style="display:none;">';
        $html.='<label style="border-bottom: 1px solid #000;direction: ltr;font-size: 20px;margin-left: 20px;">Source base<span class="source_no_data_p_'.$data['tunnel_id'].'" style="color: #ea4335; font-size: 15px;"></span>&nbsp;&nbsp;<input type="button" class="btn btn-xs btn-primary acl_destination_search_btn" value="Search ACL" data-tid="'.$data['tunnel_id'].'" style="margin-bottom: 3px;"/></label>';
        $html.='<div class="source_acl_content_'.$data['tunnel_id'].'"></div>';
        $html.='<label  style="border-bottom: 1px solid #000;direction: ltr;font-size: 20px;margin-left: 20px;margin-top: 5px;">Destination base<span class="destination_no_data_p_'.$data['tunnel_id'].'" style="color: #ea4335; font-size: 15px;"></span></label>';
       $deststate = ($data['tunnel_type']!="client"?"":"disabled");

        $html.='<div class="destination_acl_content destination_acl_content_'.$data['tunnel_id'].' ' .$deststate. '"></div>';
      $html.='</div>';
   }
   return $html;
}

//add cloud section
function add_cloud($data){
   global $db;
   $sql = $db->query("INSERT INTO `clouds_data` (`cloud_name`, `user_token`, `email`) VALUES ('".$db->real_escape_string($_POST['cloud_name'])."', '".$db->real_escape_string($_SESSION['token'])."', '".$db->real_escape_string($_POST['cloud_email'])."')");
       $last_id=$db->insert_id;
       $data=array("id"=>$last_id, "clouds_data"=>$_POST['cloud_name'], "customer_id"=>$_SESSION['user_id'], "email"=>$_POST['cloud_email']);
       if($sql){
          return array("status" => 1, 'data' => 'Cloud Added successfully');
       }
       else{
           return array("status" => 0, 'data' => 'error occurred, try again.');
       }
}

//delete tunnel section
function delete_tunnel($data){
   global $db;
   $sql = $db->query("SELECT * FROM `tunnels_data` WHERE `tunnel_id`=".$data['id']);
   $row = $sql->fetch_assoc();
   if($sql->num_rows>0){
      //if($db->query("UPDATE `tunnels_data` SET `is_deleted`=1 WHERE `tunnel_id`=".$data['id'])){
        /*if($data['type']=="server"){
            $db->query("UPDATE `server_subnets` SET `used_ips`=0 WHERE `subnet`='".$row['cloud_ip']."'");
            $db->query("UPDATE `real_ip_list` SET `in_use`=0 WHERE `real_ip`='".$row['real_ip']."'");
         }else if($data['type']=="client"){
            $db->query("UPDATE `client_subnets` SET `used_ips`=0 WHERE `subnet`='".$row['cloud_ip']."'");
         }*/
          $arr=array("data"=>$data);
          /*if(!isset($data['user_id'])){
              $data['user_id'] = $_SESSION['user_id'];
          }*/

          $res=remote($data['id'], "delete_tunnel", $arr, "a", $data["token"]);
          if($res==1){
            if($data['type']=="server"){
              $db->query("UPDATE `server_subnets` SET `used_ips`=0 WHERE `subnet`='".$row['cloud_ip']."'");
              $db->query("UPDATE `real_ip_list` SET `in_use`=0 WHERE `real_ip`='".$row['real_ip']."'");
           }
            return array("toclient"=>$_SESSION['token'], "status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', 'type'=>'delete_tunnel', 'value'=>$data['id']);
          }
      //}
   }
}

function gateway_change($id, $val, $token){
    global $db;
    $arr=array("id"=>$id, "value"=>$val);
    $sql=$db->query("SELECT * FROM `job_queue_temp` WHERE `type`='gateway_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
    if($sql->num_rows==0){
        $db->query("INSERT INTO `job_queue_temp` (`tunnel_id`, `token`, `type`, `data`) VALUES(".$id.", '".$token."', 'gateway_change', '".serialize($arr)."')");
    }else{
        $db->query("UPDATE `job_queue_temp` SET `data`='".serialize($arr)."' WHERE `type`='gateway_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
    }
    return array("status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', "type"=>"gateway_change", "value"=>$arr);
}

function status_change($id, $val, $token){

    global $db;
    $arr=array("id"=>$id, "value"=>$val);
    $sql=$db->query("SELECT * FROM `job_queue_temp` WHERE `type`='status_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
    if($sql->num_rows==0){
        $db->query("INSERT INTO `job_queue_temp` (`tunnel_id`, `token`, `type`, `data`) VALUES(".$id.", '".$token."', 'status_change', '".serialize($arr)."')");
    }else{
        $db->query("UPDATE `job_queue_temp` SET `data`='".serialize($arr)."' WHERE `type`='status_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
    }
    return array("status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', "type"=>"status_change", "value"=>$arr);
}

function bidirection_change($id, $val, $token){
  global $db;
  //$_SESSION['users_data'][$id]["bidirection_change"]=array("id"=>$id, "value"=>$val);
  $arr=array("id"=>$id, "value"=>$val);
  $sql=$db->query("SELECT * FROM `job_queue_temp` WHERE `type`='bidirection_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
  if($sql->num_rows==0){
    $db->query("INSERT INTO `job_queue_temp` (`tunnel_id`, `token`, `type`, `data`) VALUES(".$id.", '".$token."', 'bidirection_change', '".serialize($arr)."')");
  }else{
    $db->query("UPDATE `job_queue_temp` SET `data`='".serialize($arr)."' WHERE `type`='bidirection_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
  }
  //return $_SESSION['users_data'];
  //if($sql=$db->query("UPDATE `tunnels_data` SET `bidirectional_mode`=".$val." WHERE `tunnel_id`=".$id)){
      // $arr=array("id"=>$id, "value"=>$val);
      // $res=remote($_SESSION['user_id'], $id, "bidirection_change", $arr, "b");
      // if($res==1){
        return array("status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', "type"=>"bidirection_change", "value"=>$arr);
      // }
  //}
}

function internet_change($id, $val, $token){
  global $db;
  //$_SESSION['users_data'][$id]["internet_change"]=array("id"=>$id, "value"=>$val);
  $arr=array("id"=>$id, "value"=>$val);
  $sql=$db->query("SELECT * FROM `job_queue_temp` WHERE `type`='internet_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
  if($sql->num_rows==0){
    $db->query("INSERT INTO `job_queue_temp` (`tunnel_id`, `token`, `type`, `data`) VALUES(".$id.", '".$token."', 'internet_change', '".serialize($arr)."')");
  }else{
    $db->query("UPDATE `job_queue_temp` SET `data`='".serialize($arr)."' WHERE `type`='internet_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
  }
  //if($sql=$db->query("UPDATE `tunnels_data` SET `internet`=".$val." WHERE `tunnel_id`=".$id)){
      $arr=array("id"=>$id, "value"=>$val);
      // $res=remote($_SESSION['user_id'], $id, "internet_change", $arr, "b");
      // if($res==1){
        return array("status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', "type"=>"internet_change", "value"=>$arr);
      // }
  //}
}

function route_change($id, $val, $token){
  global $db;
  //$_SESSION['users_data'][$id]["route_change"]=array("id"=>$id, "value"=>$val);
  $arr=array("id"=>$id, "value"=>$val);
  $sql=$db->query("SELECT * FROM `job_queue_temp` WHERE `type`='route_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
  if($sql->num_rows==0){
    $db->query("INSERT INTO `job_queue_temp` (`tunnel_id`, `token`, `type`, `data`) VALUES(".$id.", '".$token."', 'route_change', '".serialize($arr)."')");
  }else{
    $db->query("UPDATE `job_queue_temp` SET `data`='".serialize($arr)."' WHERE `type`='route_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
  }
  // if($sql=$db->query("UPDATE `tunnels_data` SET `route`=".$val." WHERE `tunnel_id`=".$id)){
      $arr=array("id"=>$id, "value"=>$val);
      // $res=remote($_SESSION['user_id'], $id, "route_change", $arr, "b");
      // if($res==1){
        return array("status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', "type"=>"route_change", "value"=>$arr);
      // }
  // }
}

function plan_change($id, $val, $token){
  global $db;
  //$_SESSION['users_data'][$id]["plan_change"]=array("id"=>$id, "value"=>$val);
  $arr=array("id"=>$id, "value"=>$val);
  $sql=$db->query("SELECT * FROM `job_queue_temp` WHERE `type`='plan_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
  if($sql->num_rows==0){
    $db->query("INSERT INTO `job_queue_temp` (`tunnel_id`, `token`, `type`, `data`) VALUES(".$id.", '".$token."', 'plan_change', '".serialize($arr)."')");
  }else{
    $db->query("UPDATE `job_queue_temp` SET `data`='".serialize($arr)."' WHERE `type`='plan_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
  }
  return array("status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', "type"=>"plan_change", "value"=>$arr);
}

//group change section
function group_change($id, $val, $token){
  global $db;
  //$_SESSION['users_data'][$id]["group_change"]=array("id"=>$id, "value"=>$val);
  $arr=array("id"=>$id, "value"=>$val);
  $sql=$db->query("SELECT * FROM `job_queue_temp` WHERE `type`='group_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
  if($sql->num_rows==0){
    $db->query("INSERT INTO `job_queue_temp` (`tunnel_id`, `token`, `type`, `data`) VALUES(".$id.", '".$token."', 'group_change', '".serialize($arr)."')");
  }else{
    $db->query("UPDATE `job_queue_temp` SET `data`='".serialize($arr)."' WHERE `type`='group_change' AND `tunnel_id`=".$id." AND `token`='".$token."'");
  }
  //if($sql=$db->query("UPDATE `tunnels_data` SET `group_id`=".$val." WHERE `tunnel_id`=".$id)){
      $arr=array("id"=>$id, "value"=>$val);
      // $res=remote($_SESSION['user_id'], $id, "group_change", $arr, "b");
      // if($res==1){
        return array("status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', "type"=>"group_change", "value"=>$arr);
      // }
  //}
}

//add tunnel section
function addTunnel($data, $token){
   global $db;
   $tunnel=array();
   $real_ip="";
   $subnet_ip="";

   $sql = $db->query("SELECT `customer_id` FROM `customers_data` WHERE `Cash_amount`>0 and `token` = '".$token."'");
   if($sql->num_rows!=0){
      // $email =  $db->real_escape_string($val['email']); //There is no $val! check tunnels add!!!
       $m=server_username();
       $n=server_password();

       $subnet_res=$db->query("SELECT `subnet` from `server_subnets` where `used_ips`='0'");
       $subnet_num = $subnet_res->num_rows;
       if($subnet_num==0){
           return array("status" => 0, 'data' => 'Unexpected error occured.');
       }else{
           $subnet_row=$subnet_res->fetch_assoc();
           $subnet_ip = $subnet_row['subnet'];

            $tunnel[0]['uname']=$m;
            $tunnel[0]['upass']=$n;
            $tunnel[0]['cloud_id']=$data['cloud_id'];
            $tunnel[0]['email']=$data['mail_id'];
            $tunnel[0]['display_name']="";
            $tunnel[0]['bidirectional_mode']=0;
            $tunnel[0]['gateway_mode']=0;
            $tunnel[0]['cloud_ip']=$subnet_ip;
            $tunnel[0]['tunnel_type']="server";
            $tunnel[0]['group_id']=0;
            $tunnel[0]['username']=$m;
            $tunnel[0]['password']=$n;
            $tunnel[0]['token']=$token;
       }
       $res=remote("", "add_new_tunnel", $tunnel, "a", $token);
       if($res==1){
        /* if($val['type']=="server"){ //There is no $val! check tunnels add!!!
            $db->query("UPDATE `server_subnets` SET `used_ips`='1'  WHERE `subnet`='".$subnet_ip."'");
         }*/
       }
   }else{
       return array("status" => 2, 'data' => 'You have no balace to do any operations, please recharge ur account.');
   }
   if($res==1){
      return array("status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', 'type'=>'add_tunnels', "uid"=>$tunnel['customer_id'], 'value'=>$tunnel);
   }
}

function add_server_clone($clone_id, $token){
  global $db;
  $tunnel=array();
  $sql2=$db->query("SELECT `subnet` FROM `server_subnets` WHERE `used_ips`=0");

  if($sql2->num_rows>0){
      $row2=$sql2->fetch_assoc();
      $subnet_clone=$row2['subnet'];
      $uname=server_username();
      $upass=server_password();
      $sql1=$db->query("SELECT * FROM `tunnels_data` WHERE `tunnel_id`=".$clone_id);
      $row_clone=$sql1->fetch_assoc();
        $row_clone['uname']=$uname;
        $row_clone['upass']=$upass;
        $row_clone['cloud_ip']=$subnet_clone;
        $row_clone['token']=$token;
        $tunnel[]=$row_clone;
        $res=remote("", "add_server_clone", $tunnel, "a", $token);
        //$_SESSION['users_data'][$id]["add_server_clone"]=$tunnel;
        if($res==1){
          $db->query("UPDATE `server_subnets` SET `used_ips`='1'  WHERE `subnet`='".$subnet_clone."'");
          return array("status"=>1, "data"=>"Your request under process, please wait...", 'message_type'=>'reply', "type"=>"add_server_clone", "uid"=>$row_clone['customer_id'], "value"=>$tunnel);
        }
      //}
  }else{
    return array("status"=>0, "data"=>"Unexpected error occured, try again");
  }
}
//does nothing?
function add_client_clone($clone_id, $token){
  global $db;
  $tunnel=array();
    if(!isset($row2)) $row2 = array();
  $subnet_clone=$row2['subnet'];
  $sql1=$db->query("SELECT * FROM `tunnels_data` WHERE `tunnel_id`=".$clone_id);
  $row_clone=$sql1->fetch_assoc();
  /*$sql_clone=$db->query("INSERT INTO `tunnels_data`(`type`,`email`,`internet_tunnel`,`cloud_id`,`customer_id`,`status`,`servers_ACL`,`last_login`,`traffic`,`bidirectional_mode`,`group_id`,`display_name`,`cloud_ip`,`is_deleted`,`last_updated`,`no_of_revision`, `location`, `is_complete_action`, `is_updated`, `tunnel_type`) VALUES(
      ".$row_clone['type'].",
      '".$row_clone['email']."',
      ".$row_clone['internet_tunnel'].",
      ".$row_clone['cloud_id'].",
      ".$row_clone['customer_id'].",
      ".$row_clone['status'].",
      '".$row_clone['servers_ACL']."',
      now(),
      ".$row_clone['traffic'].",
      ".$row_clone['bidirectional_mode'].",
      ".$row_clone['group_id'].",
      '".$row_clone['display_name']."',
      '".$subnet_clone."',
      0,
      now(),
      0,
      '".$row_clone['location']."', 0, 0, 'client'
      )");*/
  //if($sql_clone){
    //$last_id = $db->insert_id;
    //$db->query("UPDATE `client_subnets` SET `used_ips`=1 WHERE `subnet`='".$subnet_clone."'");
    //$row_clone['tunnel_id']=$last_id;
    //$row_clone['cloud_ip']=$subnet_clone;
    $tunnel[]=$row_clone;
    $res=remote("", "add_client_clone", $tunnel, "a", $token);
    //$_SESSION['users_data'][$id]["add_client_clone"]=$tunnel;
    if($res==1){
      return array("status"=>1, "data"=>"Your request under process, please wait...", 'message_type'=>'reply', "type"=>"add_client_clone", "uid"=>$row_clone['customer_id'], "value"=>$tunnel);
    }
  //}
}

function getTunnel($data){
    global $db;
    $tunnel = "SELECT `tunnels_data`.*, (case when (`tunnels_data`.`real_ip` = '') THEN 'Request real ip' ELSE `tunnels_data`.`real_ip`  END) real_ip, `remote_server_list`.`server_name` `location`, `real_ip_list`.`is_active` `active` FROM `tunnels_data` left join `real_ip_list` on `tunnels_data`.`real_ip`=`real_ip_list`.`real_ip` left join `remote_server_list` on `tunnels_data`.`location`=`remote_server_list`.`id` WHERE  `tunnels_data`.`cloud_id`='".$db->real_escape_string($data['cloud'])."' and `tunnels_data`.`user_token`='".$db->real_escape_string($_SESSION['token'])."' and `tunnels_data`.`is_deleted`=0";

    if($data['type']=="tunnel"){
        if($data['dif']=="server"){

            $sql=$db->query($tunnel." order by `tunnels_data`.`tunnel_type`");
        }else {
            $sql=$db->query($tunnel." order by `tunnels_data`.`tunnel_type` DESC");
        }
    }if($data['type']=="group"){
        if($data['dif']=="asc"){
            $sql=$db->query($tunnel." order by group_id");
        }else {
            $sql=$db->query($tunnel." order by group_id DESC");
        }
    } /*else if($data['type']=="email"){
        if($data['dif']=="asc"){
            $sql=$db->query($tunnel." order by email");
        }else{
            $sql=$db->query($tunnel." order by email DESC");
        }
    }*/ else if($data['type']=="name"){
        if($data['dif']=="asc"){
            $sql=$db->query($tunnel." order by display_name");
        }else{
            $sql=$db->query($tunnel." order by display_name DESC");
        }
    } else if($data['type']=="bidirection"){
        if($data['dif']=="asc"){
            $sql=$db->query($tunnel." order by bidirectional_mode");
        }else{
            $sql=$db->query($tunnel." order by bidirectional_mode DESC");
        }
    } else if($data['type']=="gateway"){
        if($data['dif']=="asc"){
            $sql=$db->query($tunnel." order by gateway_mode");
        }else{
            $sql=$db->query($tunnel." order by gateway_mode DESC");
        }
    }else if($data['type']=="internet"){
        if($data['dif']=="asc"){
            $sql=$db->query($tunnel." order by internet");
        }else{
            $sql=$db->query($tunnel." order by internet DESC");
        }
    }else if($data['type']=="route"){
        if($data['dif']=="asc"){
            $sql=$db->query($tunnel." order by route");
        }else{
            $sql=$db->query($tunnel." order by route DESC");
        }
    }
    $t_data=array();
    while($row=$sql->fetch_assoc()){
        $row['cost']=packages($row['tunnel_type'], $row['plan_id'], $row['tunnel_id']);
        $t_data[]=$row;
    }
    if(isset($data['rect'])) {
        $acltunnel = "SELECT `tunnels_data`.*, (case when (`tunnels_data`.`real_ip` = '') THEN 'Request real ip' ELSE `tunnels_data`.`real_ip`  END) real_ip, `remote_server_list`.`server_name` `location`, `real_ip_list`.`is_active` `active` FROM `tunnels_data` left join `real_ip_list` on `tunnels_data`.`real_ip`=`real_ip_list`.`real_ip` left join `remote_server_list` on `tunnels_data`.`location`=`remote_server_list`.`id` left join `user_acl_relation` on `user_acl_relation`.`tunnel_id` = `tunnels_data`.`tunnel_id` WHERE `tunnels_data`.`is_deleted`=0 and `user_acl_relation`.`acl_id`=". $data['rect'] . " order by `tunnels_data`.`tunnel_type`";
        $sql2=$db->query($acltunnel);
        while($row=$sql2->fetch_assoc()){
            $row['cost']=packages($row['tunnel_type'], $row['plan_id'], $row['tunnel_id']);
            $t_data[]=$row;
        }
      //  $t_data[]='sadasdasdasdas';
    }
    return $t_data;
}

function edit_email($data, $token){
  global $db;
  //$sql="UPDATE `tunnels_data` SET `email`='".$data['value']."' WHERE `tunnel_id`=".$data['pk'];
  //if($db->query($sql)){
    $arr=array("id"=>$data['pk'], "value"=>$data['value']);
    //$_SESSION['users_data'][$data['pk']]["edit_email"]=$arr;
    $sql=$db->query("SELECT * FROM `job_queue_temp` WHERE `type`='edit_email' AND `tunnel_id`=".$data['pk']." AND `token`='".$token."'");
    if($sql->num_rows==0){
      $db->query("INSERT INTO `job_queue_temp` (`tunnel_id`, `token`, `type`, `data`) VALUES(".$data['pk'].", '".$token."', 'edit_email', '".serialize($arr)."')");
    }else{
      $db->query("UPDATE `job_queue_temp` SET `data`='".serialize($arr)."' WHERE `type`='edit_email' AND `tunnel_id`=".$data['pk']." AND `token`='".$token."'");
    }
    // $res=remote($_SESSION['user_id'], $data['pk'], "edit_email", $arr, "b");
    // if($res==1){
      return array('status'=>1, 'data'=>'Your request under process, please wait...', 'message_type'=>'reply', "type"=>"edit_email", "value"=>$arr);
    // }
  //}
}

function edit_display($data, $token){
  global $db;
  //$sql="UPDATE `tunnels_data` SET `display_name`='".$data['value']."' WHERE `tunnel_id`=".$data['pk'];
  //if($db->query($sql)){
    $arr=array("id"=>$data['pk'], "value"=>$data['value']);
    //$_SESSION['users_data'][$data['pk']]["edit_display"]=$arr;
    $sql=$db->query("SELECT * FROM `job_queue_temp` WHERE `type`='edit_display' AND `tunnel_id`=".$data['pk']." AND `token`='".$token."'");
    if($sql->num_rows==0){
      $db->query("INSERT INTO `job_queue_temp` (`tunnel_id`, `token`, `type`, `data`) VALUES(".$data['pk'].", '".$token."', 'edit_display', '".serialize($arr)."')");
    }else{
      $db->query("UPDATE `job_queue_temp` SET `data`='".serialize($arr)."' WHERE `type`='edit_display' AND `tunnel_id`=".$data['pk']." AND `token`='".$token."'");
    }
    // $res=remote($_SESSION['user_id'], $data['pk'], "edit_display", $arr, "a");
    // if($res==1){
      return array('toclient'=>$_SESSION['token'], 'status'=>1, 'data'=>'Your request under process, please wait...', 'message_type'=>'reply', "type"=>"edit_display", "value"=>$arr);
    // }
  //}
}

function request_real_ip($data, $token){
  global $db;
  $real_res=$db->query("SELECT `real_ip` from `real_ip_list` where `in_use`='0'");
  $real_num = $real_res->num_rows;
  if($real_num>0){
    $real_row=$real_res->fetch_assoc();
    //if($db->query("UPDATE `tunnels_data` SET `real_ip`='".$real_row['real_ip']."' WHERE `tunnel_id`=".$data['id'])){

      $arr=array("id"=>$data['id'], "real_ip"=>$real_row['real_ip']);
      $res=remote($data['id'], "request_real_ip", $arr, "b", $token);
      // $res=remote($_SESSION['user_id'], $data['id'], "request_real_ip", array("id"=>$data['id'], "real_ip"=>$real_row['real_ip']), "b");
      if($res==1){
        $db->query("UPDATE `real_ip_list` SET `in_use`=1 WHERE `real_ip`='".$real_row['real_ip']."'");
        return array('toclient'=>$_SESSION['token'], 'status'=>1, 'data'=>'Your request under process, please wait...', 'message_type'=>'reply', 'type'=>'request_real_ip', 'id'=>$data['id'], 'value'=>$real_row['real_ip']);
      }
    //}
  }else{
    return array('status'=>0, 'data'=>'Real ip not assigned, Try again');
  }
}

function get_server_name(){
  global $db;
  //echo "SELECT `id`,`server_name` FROM `remote_server_list` WHERE `remote_group`<>'a'";
  $sql=$db->query("SELECT `id`,`server_name` FROM `remote_server_list` WHERE `remote_group`<>'a'");
  while($row=$sql->fetch_assoc()){
      $location_arr[$row['id']] = $row['server_name'];
  }
  return $location_arr;
}

function packages($type, $plan_id, $id){
  global $db;
  if($type=="server"){
    $t_qry=$db->query("SELECT `real_ip` FROM `tunnels_data` WHERE `tunnel_id`=".$id);
    $t_qry_row=$t_qry->fetch_assoc();
    $real_chk=$db->query("SELECT `is_active` FROM `real_ip_list` WHERE `real_ip`='".$t_qry_row['real_ip']."'");
    $real_chk_row=$real_chk->fetch_assoc();
    if(isset($t_qry_row['real_ip']) && $real_chk_row['is_active']==1){
      $sqlPackage=$db->query("SELECT SUM(`tunnel` + `gateway` + `bidirection` + `realip`) total FROM `package_data` WHERE `plan_id`=".$plan_id);
    }else {
      $sqlPackage=$db->query("SELECT SUM(`tunnel` + `gateway` + `bidirection`) total FROM `package_data` WHERE `plan_id`=".$plan_id);
    }
    $rowPackage=$sqlPackage->fetch_assoc();
  } else if($type=="client"){
    $sqlPackage=$db->query("SELECT SUM(`tunnel` + `bidirection`) total FROM `package_data` WHERE `plan_id`=".$plan_id);
    $rowPackage=$sqlPackage->fetch_assoc();
  }
  //print_r($package);
  return $rowPackage['total'];
}

function change_tunnel($data){
    global $db;
    $sql=$db->query("SELECT * FROM `job_queue_temp` WHERE (`type`='change_tunnel_client' OR `type`='change_tunnel_server') AND `tunnel_id`=".$data['id']." AND `token`='".$data['token']."'");
    $sql2=$db->query("SELECT * FROM `job_queue_temp` WHERE `type`='create_new_acl' AND `tunnel_id`=".$data['id']." AND `token`='".$data['token']."'");
    if($data['type']=="server"){
        $arr=array("id"=>$data['id']);
        if($sql->num_rows==0){
            $db->query("INSERT INTO `job_queue_temp` (`tunnel_id`, `token`, `type`, `data`) VALUES(".$data['id'].", '".$data['token']."', 'change_tunnel_client', '".serialize($arr)."')");
        }
        else{
            $db->query("UPDATE `job_queue_temp` SET `data`='".serialize($arr)."', `type`='change_tunnel_client' WHERE (`type`='change_tunnel_client' OR `type`='change_tunnel_server') AND `tunnel_id`=".$data['id']." AND `token`='".$data['token']."'");
        }
        if($sql->num_rows > 0){
            $db->query("DELETE FROM `job_queue_temp` WHERE `type`='create_new_acl' AND `tunnel_id`=".$data['id']." AND `token`='".$data['token']."'");
        }

        //$db->query("INSERT INTO `job_queue` (`tunnel_id`, `action`, `group`, `new_data`, `added_time`, `token`) VALUES('".$data2['id']."', 'create_new_acl', 'a', '".serialize($data2)."', now(), '".$data2['token']."')");
        // $res=remote($data['id'], "change_tunnel_client", $arr, "b", $data['token']);
        //  if($res==1){
        return array('toclient'=>$_SESSION['token'], 'status'=>1, 'data'=>'Your request under process, please wait...', 'message_type'=>'reply', 'type'=>'change_tunnel_to_server', 'value'=>$arr);
        //  }
    }else if($data['type']=="client"){
        $arr=array("id"=>$data['id']);
        $data2 = array(
            'id' => $data['id'],
            'token' =>  $data['token'],
            'val' => 'destination'
        );
        if($sql->num_rows==0){
            $db->query("INSERT INTO `job_queue_temp` (`tunnel_id`, `token`, `type`, `data`) VALUES(".$data['id'].", '".$data['token']."', 'change_tunnel_server', '".serialize($arr)."')");
        }
        else{
            $db->query("UPDATE `job_queue_temp` SET `data`='".serialize($arr)."', `type`='change_tunnel_server' WHERE (`type`='change_tunnel_client' OR `type`='change_tunnel_server') AND `tunnel_id`=".$data['id']." AND `token`='".$data['token']."'");
        }
        if($sql2->num_rows==0){
            $db->query("INSERT INTO `job_queue_temp` (`tunnel_id`, `token`, `type`, `data`) VALUES(".$data2['id'].", '".$data2['token']."', 'create_new_acl', '".serialize($data2)."')");
        }
        // $res=remote($data['id'], "change_tunnel_server", $arr, "b", $data['token']);
        // if($res==1){
        return array('status'=>1, 'data'=>'Your request under process, please wait...', 'message_type'=>'reply', 'type'=>'change_tunnel_to_client', 'value'=>$arr);
        //  }
    }
}
/*
function change_tunnel($data){
  global $db;
  if($data['type']=="server"){
        $arr=array("id"=>$data['id']);
        $res=remote($data['id'], "change_tunnel_client", $arr, "b", $data['token']);
        if($res==1){
          return array('toclient'=>$_SESSION['token'], 'status'=>1, 'data'=>'Your request under process, please wait...', 'message_type'=>'reply', 'type'=>'change_tunnel_to_server', 'value'=>$arr);
        }
  }else if($data['type']=="client"){
      $arr=array("id"=>$data['id']);
      $res=remote($data['id'], "change_tunnel_server", $arr, "b", $data['token']);
      if($res==1){
        return array('status'=>1, 'data'=>'Your request under process, please wait...', 'message_type'=>'reply', 'type'=>'change_tunnel_to_client', 'value'=>$arr);
      }
  }
}*/


function change_location($data, $token){
  global $db;
  //$sql="UPDATE `tunnels_data` SET `location`='".$data['value']."' WHERE `tunnel_id`=".$data['pk'];
  //if($db->query($sql)){
    $arr=array("id"=>$data['pk'], "value"=>$data['value']);
    //$_SESSION['users_data'][$data['pk']]["change_location"]=$arr;
    $sql=$db->query("SELECT * FROM `job_queue_temp` WHERE `type`='change_location' AND `tunnel_id`=".$data['pk']." AND `token`='".$token."'");
    if($sql->num_rows==0){
      $db->query("INSERT INTO `job_queue_temp` (`tunnel_id`, `token`, `type`, `data`) VALUES(".$data['pk'].", '".$token."', 'change_location', '".serialize($arr)."')");
    }else{
      $db->query("UPDATE `job_queue_temp` SET `data`='".serialize($arr)."' WHERE `type`='change_location' AND `tunnel_id`=".$data['pk']." AND `token`='".$token."'");
    }
    // $res=remote($_SESSION['user_id'], $data['pk'], "change_location", $arr, "b");
    // if($res==1){
      return array('toclient'=>$_SESSION['token'], 'status'=>1, 'data'=>'Your request under process, please wait...', 'message_type'=>'reply', "type"=>"change_location", "value"=>$arr);
    // }
  //}
}

function get_subnet($data){
  global $db;
  //return $data;
  $arr=array("id"=>$data['id'], "ip"=>$data['ip']);
  $ip_chk=$db->query("SELECT * FROM `client_subnets` WHERE `subnet`='".$data['ip']."'");
  if($ip_chk->num_rows>0){
    $ip_chk_row=$ip_chk->fetch_assoc();
    if($ip_chk_row['used_ips']!=1){
      $qry=$db->query("UPDATE `tunnels_data` SET `cloud_ip`='".$data['ip']."' WHERE `tunnel_id`=".$data['id']);
      if($qry){
        $db->query("UPDATE `client_subnets` SET `used_ips`=1 WHERE `subnet`='".$data['ip']."'");
        return array('message'=>'VPN ip changed successfully', 'status'=>1, 'message_type'=>'reply', 'type'=>'get_subnet', "data"=>array("id"=>$data['id'], "ip"=>$data['ip']));
      }
    } else {
      return array('message'=>'IP already in use', 'status'=>0, 'message_type'=>'reply', 'type'=>'get_subnet');
    }
  }else {
    return array('message'=>'Wrong IP', 'status'=>0, 'message_type'=>'reply', 'type'=>'get_subnet');
  }
}

function get_dev($data){
  global $db;
  // print_r($data);

  if($db->query("UPDATE `tunnels_data` SET `dev_status`='".$data['state']."', `dev_id`='".$data['device']."' WHERE `tunnel_id`='".$data['id']."'")){
    return array('message'=>'New Dev', 'message_type'=>'reply', 'type'=>'get_DeV', 'data'=>array('id'=>$data['id'], 'state'=>$data['state'], 'device'=>$data['device']));
  }
  else{
    echo $db->error;
  }
}

function real_ip_status($data, $token){
  global $db;
  if($data['val']==1){
    $data['val']=0;
  }elseif($data['val']==0){
    $data['val']=1;
  }
  //$sql="UPDATE `real_ip_list` SET `is_active`=".$data['val']." WHERE `real_ip`='".$data['ip']."'";
  //if($db->query($sql)){
    $arr=array("id"=>$data['id'], "ip"=>$data['ip'], "value"=>$data['val']);
    $res=remote($data['id'], "real_ip_status", $arr, "b", $token);
    //$_SESSION['users_data'][$data['id']]["real_ip_status"]=$arr;
    if($res==1){
      return array('toclient'=>$_SESSION['token'], 'status'=>1, 'data'=>'Real ip status changed successfully', 'message_type'=>'reply', 'type'=>'real_ip_status', "value"=>$arr);
    }
    // $res=remote($_SESSION['user_id'], $data['id'], "real_ip_status", $arr, "b");
    // if($res==1){
    // }
  //}
}

function save_a_tunnel($id, $token){
  global $db;
  $data=array();
  //echo "SELECT * FROM `job_queue_temp` WHERE `tunnel_id`=".$id." AND `token`='".$token."'";die;
  $sql=$db->query("SELECT * FROM `job_queue_temp` WHERE `tunnel_id`=".$id." AND `token`='".$token."'");
  if($sql->num_rows>0){
    while($arr=$sql->fetch_assoc()){
      $value=unserialize($arr['data']);
      if($arr['type'] == 'edit_display'){
         $group = 'a';
      }
      else{
         $group = 'b';
      }
      $res=remote($id, $arr['type'], $value, $group, $arr['token']);

    }

    if($res==1){
      $db->query("DELETE FROM `job_queue_temp` WHERE `tunnel_id`=".$id);
      //unset($_SESSION["users_data"][$id]);
        if(!isset($user_id)) $user_id = ""; //What is it?????
      return array('toclient'=>$_SESSION['token'], 'status'=>1, 'data'=>'Your request submitted, please wait for while', 'message_type'=>'reply', 'type'=>'save_a_tunnel', 'value'=>$id, 'cust_id'=>$user_id);
    }
  }else{
    return array('status'=>0, 'data'=>'Your request either submitted, or not changed yet, please try again');
  }
}

function save_all_tunnel($token){
  global $db;
  $ids=array();
  $sql=$db->query("SELECT * FROM `job_queue_temp` WHERE `token`='".$token."'");
  $arr=array();
  if($sql->num_rows>0){
    while($arr=$sql->fetch_assoc()){
      $value=unserialize($arr['data']);
       if($arr['type'] == 'edit_display'){
         $group = 'a';
      }
      else{
         $group = 'b';
      }
      $res=remote($arr['tunnel_id'], $arr['type'], $value, $group, $arr['token']);
      $ids[]=$arr['tunnel_id'];
    }
    if($res==1){
      $db->query("DELETE FROM `job_queue_temp` WHERE `token`='".$token."'");
      return array('toclient'=>$_SESSION['token'], 'status'=>1, 'data'=>'Your request submitted, please wait for while', 'message_type'=>'reply', 'type'=>'save_all_tunnel', 'ids'=>$ids);
    }
  }else{
    return array('status'=>0, 'data'=>'Your request either submitted, or not changed yet, please try again');
  }
}

function delete_cloud($cloud_id, $token){
  global $db;
  if($db->query("DELETE FROM `clouds_data` WHERE `cloud_id`=".$cloud_id)){
    $sql=$db->query("SELECT * FROM `tunnels_data` WHERE `cloud_id`=".$cloud_id);
    if($sql->num_rows>0){
      while ($row=$sql->fetch_assoc()) {
        $data['id']=$row['tunnel_id'];
        $data['token']=$token;
        delete_tunnel($data);
      }
      $_SESSION['msg']="Cloud is_deleted successfully and its related tunnel will be removed soon";
    }
  }
}

function active_user_by_admin($c_id, $value){
  global $db;
  $status_chng_qry="UPDATE `customers_data` SET `is_active`=".$value." WHERE `customer_id`=".$c_id;
  return $status_change=$db->query($status_chng_qry);
}

function remote_server_status_change($data){
  global $db;
  if($db->query("UPDATE `remote_server_list` SET `is_active`=".$data['val']." WHERE `id`=".$data['id'])){
    echo 1;
  }
}

function remote_server_edit($data){
  global $db;
  $sql=$db->query("SELECT * FROM `remote_server_list` WHERE `id`=".$data['id']);
  if($sql->num_rows>0){
    return $sql->fetch_assoc();
  }
}

function cust_edit($data){
  global $db;
  $sql=$db->query("SELECT * FROM `customers_data` WHERE `customer_id`=".$data['id']);
  if($sql->num_rows>0){
    return $sql->fetch_assoc();
  }
}

function plan_edit($data){
  global $db;
  $sql=$db->query("SELECT * FROM `package_data` JOIN `plans` ON `plans`.`id`=`package_data`.`plan_id` WHERE `plan_id`=".$data['id']);
  if($sql->num_rows>0){
    return $sql->fetch_assoc();
  }
}

function voucher_edit($data){
  global $db;
  $sql=$db->query("SELECT * FROM `voucher` WHERE `id`=".$data['id']);
  if($sql->num_rows>0){
    return $sql->fetch_assoc();
  }
}

function remote_server_delete($data){
  global $db;
  if($db->query("DELETE FROM `remote_server_list` WHERE `id`=".$data['id'])){
    return 1;
  }
}

function test_all_remote(){
  global $db;
  $arr=array();
  $sql=$db->query("SELECT * FROM `remote_server_list`");
  if($sql->num_rows>0){
      while($res=$sql->fetch_assoc()){
          $conn = new mysqli($res['remote_ip'], $res['server_uname'], $res['server_pass']);
          if ($conn->connect_error) {
              if($db->query("UPDATE `remote_server_list` SET `is_active`=0 WHERE `id`=".$res['id'])){
                  $arr[$res["id"]]=array("result"=>0);
              }
          }else{
              if($db->query("UPDATE `remote_server_list` SET `is_active`=1 WHERE `id`=".$res['id'])){
                  $arr[$res["id"]]=array("result"=>1);
              }
          }
          $subject ='Remote Server';
           $message ='<html>
               <head>
                   <title>"'.$subject.'"</title>
               </head>
               <body>
                    Dear sir/madam,<br>
                        "'.$res['remote_ip'].'" Remote server status has been changed, please check.<br><br>
                    Thank you,<br>
                    Demovpn team.
               </body>
           </html>';
           $headers = "MIME-Version: 1.0" . "\r\n";
           $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
           $headers .= 'From:DemoVPN <demovpn@comenzarit.com>' . "\r\n";
           mail($_POST['email'],$subject,$message,$headers);
      }
      $conn->close();
      return $arr;
  }
}

function delete_user_by_admin($customer_id){
  global $db;
  $delete_qry="DELETE FROM `customers_data` WHERE `customer_id`=".$customer_id;
  $delete_succ=$db->query($delete_qry);
  return $delete_succ;
}

function delete_voucher_by_admin($id){
  global $db;
  $delete_qry="DELETE FROM `voucher` WHERE `id`=".$id;
  $delete_succ=$db->query($delete_qry);
  return $delete_succ;
}

function delete_vpn_by_admin($id){
  global $db;
  $delete_qry="DELETE FROM `server_subnets` WHERE `cloud_id`=".$id;
  $delete_succ=$db->query($delete_qry);
  return $delete_succ;
}

function delete_real_by_admin($id){
  global $db;
  $delete_qry="DELETE FROM `real_ip_list` WHERE `real_ip`=".$id;
  $delete_succ=$db->query($delete_qry);
  return $delete_succ;
}

function admin_login($data){
  global $db;
  $usrnm = $data['email'];
  $encpass = $data['password'];
  $qry = "SELECT * FROM `admin` WHERE uname='".$usrnm."' AND password='".$encpass."'";
  $res = $db->query($qry);
  if($res->num_rows > 0){
    return $res->fetch_assoc();
  }else{
    $pass = $encpass;
    $pass = substr($pass, 0, 2) . $pass . substr($pass, -2, 2);
    $uqry = "SELECT * FROM `customers_data` WHERE `email`='".$usrnm."' AND `password`='".md5($pass)."' AND `is_admin`=1";
    $ures = $db->query($uqry);
    if($ures->num_rows > 0){
      return $ures->fetch_assoc();
    }else{
      return 0;
    }
  }
}

function login_as_user($data){
   global $db;
   //echo "SELECT COUNT(*) AS `total`, `login_type`, `email`, `password`, `customer_id` FROM `customers_data` WHERE `email`='" . $db->real_escape_string($data['email']) . "' AND `is_active`='1' AND `is_verfied`=1";
   $sql = $db->query("SELECT COUNT(*) AS `total`, `login_type`, `name`, `email`, `token`, `password`, `customer_id` FROM `customers_data` WHERE `customer_id`='" .$data['id'] . "' AND `is_active`='1' AND `is_verfied`=1");
   $row = $sql->fetch_assoc();

   if ($row['total'] == 1) {
    $_SESSION['vpn_user'] = md5($row['customer_id']);
    $_SESSION['user_id'] = $row['customer_id'];
    $_SESSION['uname']=explode(" ", $row['name']);
    $_SESSION['email'] = $row['email'];
    $_SESSION['token'] = $row['token'];
    $_SESSION['user_type'] = 'customer';
    header("location:contacts.php");
  }else{
      return array("status" => 0, 'data' => 'User not exist', 'type'=>'login', 'message_type'=>'reply', 'value'=>array());
   }
}

function get_tunnels($token){
  global $db;
  $tunnel = "SELECT `tunnels_data`.*, `remote_server_list`.`server_name` `location`, `real_ip_list`.`is_active` `active` FROM `tunnels_data` left join `real_ip_list` on `tunnels_data`.`real_ip`=`real_ip_list`.`real_ip` left join `remote_server_list` on `tunnels_data`.`location`=`remote_server_list`.`id` WHERE  `tunnels_data`.`user_token`='".$db->real_escape_string($token)."' and `tunnels_data`.`is_deleted`=0";
    //echo $tunnel." order by group_id asc ";die;
    $sql=$db->query($tunnel." order by group_id asc, group_id");
    $data=array();
    while($row=$sql->fetch_assoc()){
        $data[]=$row;
    }
    return array("type"=>"get_tunnels", "message_type"=>"reply", "data"=>$data);
}

function set_def_cash($data){
    global $db;
    if($db->query("UPDATE `settings` SET `settings_value`=".$data['dcash']." WHERE `settings_name`='default_cash'")){
        return true;
    }
}

function set_point_val($data){
    global $db;
    if($db->query("UPDATE `settings` SET `settings_value`=".$data['dcash']." WHERE `settings_name`='cast_to_point'")){
        return true;
    }
}
function dev_status_toggle($data)
{
    global $db;

    $res = $db->query("SELECT * FROM `tunnels_data` WHERE `tunnel_id`=" . $data['id']);
    if($res->num_rows > 0)
    {
        $row = $res->fetch_assoc();

        $dev_status = -1;
        if($row['dev_status'] == -1)
        {
            $dev_status = 1;
        }
        $db->query("UPDATE `tunnels_data` SET `dev_status`=" . $dev_status . " WHERE `tunnel_id`=" . $data['id']);
        return array('status' =>1 , 'message'=>array('st' => $dev_status, 'DeV' => $row['DeV']));
    }
    return array('status' =>0 , 'message'=>'Error performing request');
}
function get_acl_info($id){
    global $db;
    $arr=array();
    $res = $db->query("SELECT `id` FROM `tunnel_acl_relation` WHERE `tunnel_id`=".$id);
    $val = '';
    $res_shared_acl = $db->query("SELECT `acl_id` FROM `user_acl_relation` WHERE `tunnel_id`=".$id);
    $val_shared_acl="";
    if($res->num_rows > 0 || $res_shared_acl->num_rows > 0){
      while($row = $res->fetch_assoc()){
          $val.=$row['id'].",";
      }
      while($row_shared_acl = $res_shared_acl->fetch_assoc()){

          $val.=$row_shared_acl['acl_id'].",";
      }

      $val=rtrim($val, ",");

      $main_query="SELECT *FROM `tunnel_acl_relation`
            JOIN `destination` ON `tunnel_acl_relation`.`id` = `destination`.`acl_id`
            JOIN `d_final` ON `tunnel_acl_relation`.`id` = `d_final`.`acl_id`
            JOIN `c_firewall` ON `tunnel_acl_relation`.`id` = `c_firewall`.`acl_id`
            JOIN `c_forwarding` ON `tunnel_acl_relation`.`id` = `c_forwarding`.`acl_id`
            JOIN `c_qos` ON `tunnel_acl_relation`.`id` = `c_qos`.`acl_id`
            JOIN `c_routing` ON `tunnel_acl_relation`.`id` = `c_routing`.`acl_id`
            JOIN `source` ON `tunnel_acl_relation`.`id` = `source`.`acl_id`
            JOIN `s_firewall` ON `tunnel_acl_relation`.`id` = `s_firewall`.`acl_id`
            JOIN `s_aliasing` ON `tunnel_acl_relation`.`id` = `s_aliasing`.`acl_id`
            JOIN `s_qos` ON `tunnel_acl_relation`.`id` = `s_qos`.`acl_id`
            JOIN `s_tos` ON `tunnel_acl_relation`.`id` = `s_tos`.`acl_id`
            WHERE `tunnel_acl_relation`.`id`
            IN (".$val.")";
      $res1 = $db->query($main_query);
      while($row1 = $res1->fetch_assoc()){
          $arr[] = $row1;
      }
      $acl_info = array();
      foreach ($arr as $key => $value) {

          $id = $value['id'];
          $acl_info[$id]=array();
          $acl_info[$id]["tunnel_id"]=$value['tunnel_id'];
          unset($value['id']);
          unset($value['acl_id']);
          unset($value['tunnel_id']);
          unset($value['creation_time']);
          unset($value['is_active']);

          foreach ($value as $k => $val) {
            $key = explode("-", $k);
            $base = $key[0];
            if(!isset($acl_info[$id][$base])){
                $acl_info[$id][$base]=array();
            }
            $label = ucwords(str_replace('_', ' ', $key[1]));
            //if($val>0){
                $acl_info[$id][$base][$key[1]] = array('label'=>readLabel($key), 'value'=>$val);
            //}
          }
      }
      //print_r($acl_info);die;
      return $acl_info;
  }
  else{
      return array('status' =>0 , 'message'=>'No ACL found for this Tunnel');
  }

}
function readLabel($key) {
    $label = ucwords(str_replace('_', ' ', $key[1]));
    $result = array(
     'full' => $label,
     'short' => ucwords(mb_substr($key[1], 0, 1, 'utf-8'))
     );
    if($key[0] == 'source' && $key[1] == 'my_cloud')
    {
        if($key[1] == 'my_cloud')
            $result = array(
                'full' => 'this cloud',
                'short' => 'T'
     );
    }
    else if($key[0] == 'source')
    {
        if($key[1] == 'my_cloud')
            $result = array(
                'full' => $label,
                'short' => 'C'
            );
        if($key[1] == 'specific_tunnel')
            $result = array(
                'full' => $label,
                'short' => 'T'
            );
        if($key[1] == 'specific_group')
            $result = array(
                'full' => $label,
                'short' => 'G'
            );
    }
    else  if($key[1] == 'country')
        $result = array(
            'full' => 'Path',
            'short' => 'P'
        );
    return $result;
}
function create_new_acl($data){
    global $db;
    $res=remote($data['id'], "create_new_acl", $data, "a", $data["token"]);
    if($res==1){
      return array("toclient"=>$_SESSION['token'], "status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', 'type'=>'create_new_acl', 'value'=>$data['id']);
    }
}

function acl_update($data){
  global $db;
  if($db->query("UPDATE `".$data['type']."` SET `".$data['type']."-".$data['name']."`='".$data['val']."' WHERE `acl_id`=".$data['id'])){
      return true;
  }

}

function get_acl_val($data){
  global $db;
  $res = $db->query("SELECT `".$data['type']."-".$data['name']."` FROM `".$data['type']."` WHERE `acl_id`=".$data['id']);
  $result = $res->fetch_assoc();
  return $result[$data['type']."-".$data['name']];
}

function chk_res($data){
  global $db;
  $arr = array();
  $res = $db->query("SELECT `".$data['type']."-".$data['val']."` FROM `".$data['type']."` WHERE `acl_id`=".$data['id']);
  $result = $res->fetch_assoc();
  $arr['option_val'] = $result[$data['type']."-".$data['val']];

  if($data['type']=="destination"){
    $data['type']="source";
  } else if($data['type']=="source"){
    $data['type']="destination";
  }
  $res1 = $db->query("SELECT `".$data['type']."-".$data['val']."` FROM `".$data['type']."` WHERE `acl_id`=".$data['id']);
  $result = $res1->fetch_assoc();
  $arr['exist_tunnel'] = $result[$data['type']."-".$data['val']];
  return $arr;
}

function create_acl_clone($data){
    global $db;
    $arr=array();
    $acl_info = array();

    $res1 = $db->query("SELECT *FROM `tunnel_acl_relation`
          JOIN `destination` ON `tunnel_acl_relation`.`id` = `destination`.`acl_id`
          JOIN `d_final` ON `tunnel_acl_relation`.`id` = `d_final`.`acl_id`
          JOIN `c_firewall` ON `tunnel_acl_relation`.`id` = `c_firewall`.`acl_id`
          JOIN `c_forwarding` ON `tunnel_acl_relation`.`id` = `c_forwarding`.`acl_id`
          JOIN `c_qos` ON `tunnel_acl_relation`.`id` = `c_qos`.`acl_id`
          JOIN `c_routing` ON `tunnel_acl_relation`.`id` = `c_routing`.`acl_id`
          JOIN `source` ON `tunnel_acl_relation`.`id` = `source`.`acl_id`
          JOIN `s_firewall` ON `tunnel_acl_relation`.`id` = `s_firewall`.`acl_id`
          JOIN `s_aliasing` ON `tunnel_acl_relation`.`id` = `s_aliasing`.`acl_id`
          JOIN `s_qos` ON `tunnel_acl_relation`.`id` = `s_qos`.`acl_id`
          JOIN `s_tos` ON `tunnel_acl_relation`.`id` = `s_tos`.`acl_id`
          WHERE `tunnel_acl_relation`.`id`=".$data['id']);
    while($row1 = $res1->fetch_assoc()){
        $arr[] = $row1;
    }

    foreach ($arr as $key => $value) {

        $id = $value['id'];
        $acl_info[$id]=array();
        $acl_info[$id]["tunnel_id"]=$value['tunnel_id'];
        unset($value['id']);
        unset($value['acl_id']);
        unset($value['tunnel_id']);
        unset($value['creation_time']);
        unset($value['is_active']);

        foreach ($value as $k => $val) {
          $key = explode("-", $k);
          $base = $key[0];
          if(!isset($acl_info[$id][$base])){
              $acl_info[$id][$base]=array();
          }
          $label = ucwords(str_replace('_', ' ', $key[1]));
          //if($val>0){
              $acl_info[$id][$base][$key[1]] = array('label'=>$label, 'value'=>$val);
          //}
        }
    }
    //print_r($acl_info);die;

    $res=remote($data['tid'], "create_acl_clone", $acl_info, "a", $data["token"]);
    if($res==1){
      return array("toclient"=>$_SESSION['token'], "status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', 'type'=>'create_acl_clone', 'value'=>$data['tid']);
    }
}

function delete_acl($data){
    global $db;

    $res=remote($data['tid'], "delete_acl", $data, "a", $data["token"]);
    if($res==1){
      return array("toclient"=>$_SESSION['token'], "status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', 'type'=>'delete_acl', 'value'=>$data['id']);
    }
    /*if($db->query("DELETE FROM `tunnel_acl_relation` WHERE `id`=".$id)){
        if($db->query("DELETE FROM `destination` WHERE `acl_id`=".$id)){
            if($db->query("DELETE FROM `d_final` WHERE `acl_id`=".$id)){
                if($db->query("DELETE FROM `c_firewall` WHERE `acl_id`=".$id)){
                    if($db->query("DELETE FROM `c_forwarding` WHERE `acl_id`=".$id)){
                        if($db->query("DELETE FROM `c_qos` WHERE `acl_id`=".$id)){
                            if($db->query("DELETE FROM `c_routing` WHERE `acl_id`=".$id)){
                                if($db->query("DELETE FROM `source` WHERE `acl_id`=".$id)){
                                    if($db->query("DELETE FROM `s_aliasing` WHERE `acl_id`=".$id)){
                                        if($db->query("DELETE FROM `s_firewall` WHERE `acl_id`=".$id)){
                                            if($db->query("DELETE FROM `s_qos` WHERE `acl_id`=".$id)){
                                                if($db->query("DELETE FROM `s_tos` WHERE `acl_id`=".$id)){
                                                   return true;
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
    }*/
}

function clear_acl_values($data){
    global $db;

    $res=remote($data['tid'], "clear_acl_values", $data, "a", $data["token"]);
    if($res==1){
      return array("toclient"=>$_SESSION['token'], "status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', 'type'=>'clear_acl_values', 'value'=>$data['id']);
    }
}

function save_acl_values($data){
  global $db;
  $res=remote($data['tid'], "save_acl_values", $data, "a", $data["token"]);
    if($res==1){
      return array("toclient"=>$_SESSION['token'], "status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', 'type'=>'save_acl_values', 'value'=>$data['id']);
    }
}

function change_acl($data){
    global $db;

    $res=remote($data['tid'], "change_acl", $data, "a", $data["token"]);
    if($res==1){
      return array("toclient"=>$_SESSION['token'], "status" => 1, 'data' => 'Your request under process, please wait...', 'message_type'=>'reply', 'type'=>'change_acl', 'value'=>$data['id']);
    }
}

function point($data){
  global $db;
  $point_set = $db->query("SELECT `settings_value` FROM `settings` WHERE `settings_name`='cast_to_point'");
  $res_point = $point_set->fetch_assoc();

  $res = $db->query("SELECT * FROM `customers_data` WHERE `Cash_amount` >= ".$data['point']/$res_point['settings_value']." AND `customer_id`=".$data['id']);
  if($res->num_rows>0){
    $cust_chk = $db->query("SELECT * FROM `customers_data` WHERE `email`='".$data['email']."'");
    if($cust_chk->num_rows>0){
      if($db->query("UPDATE `customers_data` SET `Cash_amount` = (`Cash_amount`)+".$data['point']/$res_point['settings_value']." WHERE `email`='".$data['email']."'")){
          if($db->query("UPDATE `customers_data` SET `Cash_amount` = (`Cash_amount`)-".$data['point']/$res_point['settings_value']." WHERE `customer_id`=".$data['id'])){
            return 1;
          }
      }else{
        return 0;
      }
    }else{
      return 0;
    }
  }else{
    return 0;
  }
}

function shared_tunnel($data){
  global $db;

  if(strpos($data['shared_with'],",")){
    $val = explode(",",$data['shared_with']);
  } else{
    $val = $data['shared_with'];
  }
    foreach ($val as $value) {

      if($sql=$db->query("INSERT INTO `shared_tunnel` (`user_id`,`tunnel_id`,`cloud_id`,`shared_with`) VALUES(".$data['user_id'].",".$data['t_id'].",".$data['c_id'].",'".$value."')")){

      }
    }
}

function get_acl_destination_base($email, $id){
  global $db;
  $arr = array();
  $sql = $db->query("SELECT * FROM `customers_data` WHERE `email`='".$email."' AND `customer_id`<>".$id);
  if($sql->num_rows>0){

    $sql_get_acl = $db->query("SELECT * FROM `tunnel_acl_relation`
                JOIN `destination` ON `tunnel_acl_relation`.`id` = `destination`.`acl_id`
                JOIN `d_final` ON `tunnel_acl_relation`.`id` = `d_final`.`acl_id`
                JOIN `c_firewall` ON `tunnel_acl_relation`.`id` = `c_firewall`.`acl_id`
                JOIN `c_forwarding` ON `tunnel_acl_relation`.`id` = `c_forwarding`.`acl_id`
                JOIN `c_qos` ON `tunnel_acl_relation`.`id` = `c_qos`.`acl_id`
                JOIN `c_routing` ON `tunnel_acl_relation`.`id` = `c_routing`.`acl_id`
                JOIN `source` ON `tunnel_acl_relation`.`id` = `source`.`acl_id`
                JOIN `s_firewall` ON `tunnel_acl_relation`.`id` = `s_firewall`.`acl_id`
                JOIN `s_aliasing` ON `tunnel_acl_relation`.`id` = `s_aliasing`.`acl_id`
                JOIN `s_qos` ON `tunnel_acl_relation`.`id` = `s_qos`.`acl_id`
                JOIN `s_tos` ON `tunnel_acl_relation`.`id` = `s_tos`.`acl_id`
                WHERE `tunnel_acl_relation`.`id`
                IN (SELECT `tunnel_acl_relation`.`id` FROM `customers_data` JOIN `tunnels_data` ON `customers_data`.`token`=`tunnels_data`.`user_token` 
                JOIN `tunnel_acl_relation` ON `tunnels_data`.`tunnel_id`=`tunnel_acl_relation`.`tunnel_id` WHERE `customers_data`.`email`='".$email."') ORDER BY `tunnel_acl_relation`.`id`");
    while($row1 = $sql_get_acl->fetch_assoc()){
        $arr[] = $row1;
    }
    $acl_info = array();
    foreach ($arr as $key => $value) {

        $id = $value['id'];
        $acl_info[$id]=array();
        $acl_info[$id]["tunnel_id"]=$value['tunnel_id'];
        unset($value['id']);
        unset($value['acl_id']);
        unset($value['tunnel_id']);
        unset($value['creation_time']);
        unset($value['is_active']);

        foreach ($value as $k => $val) {
          $key = explode("-", $k);
          $base = $key[0];
          if(!isset($acl_info[$id][$base])){
              $acl_info[$id][$base]=array();
          }
          $label = ucwords(str_replace('_', ' ', $key[1]));
          //if($val>0){
              $acl_info[$id][$base][$key[1]] = array('label'=>$label, 'value'=>$val);
          //}
        }
    }
    //print_r($acl_info);die;
    return $acl_info;
  }else{
    return 0;
  }
}

function install_acl($data, $u_id){
  global $db;

  if($db->query("INSERT INTO `user_acl_relation` (`acl_id`,`user_id`,`tunnel_id`) VALUES(".$data['acl_id'].",".$u_id.",".$data['tunnel_id'].")")){
    echo 1;
  }else{
    echo 0;
  }

}

function cash_to_point(){
  global $db;
  $sql_point=$db->query("SELECT `settings_value` FROM `settings` WHERE `settings_name`='cast_to_point'");
  $point = $sql_point->fetch_assoc();
  return $point['settings_value'];
}

function change_profile_picture($file){

  global $db;
  $path="assets/user_img/";
  $formats = array("jpg", "png", "gif", "bmp", "jpeg");
  $name = $file['name'];
    $size = $file['size'];
    $tmp = $file['tmp_name'];
    if (strlen($name)) {
      $ext = strtolower(pathinfo($name, PATHINFO_EXTENSION));
      if (in_array($ext, $formats)) {
        $imgn = time() . rand() . "." . $ext;
        if (move_uploaded_file($tmp, $path . $imgn)) {
          $res = $imgn;
        }
      } else {
        $res = '0';
      }
    } else {
      $res = '0';
    }
    $original_image = explode('.', $name);
    return array($res, $original_image[0]);
}

?>