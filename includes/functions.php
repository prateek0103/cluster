<?php
function curl_get_file_contents($URL, $data = "") {
    $c = curl_init();
    curl_setopt($c, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($c, CURLOPT_HTTPHEADER, array(
        'Content-Type: application/x-www-form-urlencoded',
        'Connection: Keep-Alive'
    ));
    curl_setopt($c, CURLOPT_URL, $URL);
    curl_setopt($c, CURLOPT_SSL_VERIFYPEER, false);
    if($data != ""){
        curl_setopt($c, CURLOPT_POST, 1);
        curl_setopt($c, CURLOPT_POSTFIELDS, $data);
    }
    $contents = curl_exec($c);
    $err  = curl_getinfo($c,CURLINFO_HTTP_CODE);
    curl_close($c);
    if ($contents) return $contents;
    else return FALSE;
}

function get_url($script, $action=''){
    $route = '';
    if($action != ''){
        $route = '?';
        $parm_store = array();
        foreach ( $action as $key => $val ) {
            array_push ( $parm_store, $key.'='.$val );
        }
        $route .= implode('&', $parm_store);
        }
        $parts = explode('/', $_SERVER['SCRIPT_NAME']);
        array_pop($parts);
        unset($parts[0]);
        $url = 'http://'.$_SERVER['HTTP_HOST'].'/'.$script.'.php'.$route;
        if(isset($parts[1])){
        if($parts[1] != 'includes'){
        $url = 'http://'.$_SERVER['HTTP_HOST'].'/'.implode('/', $parts).'/'.$script.'.php'.$route;
        }
        }
        return $url;
    }

function action($db, $table_name, $field_id, $field_id_val){
    $db->query("UPDATE `".$table_name."` SET `is_complete_action`=0, `is_updated`=0 WHERE `".$field_id."`=".$field_id_val);
}

function send_notification($message) {
    // Load configuration
    global $CONFIG;
    $conn = new XMPPHP_XMPP(
    '188.166.68.172',
    9090,
    'admin',
    '12!@qwQW',
    'demovpn');
    try {
    $conn->connect();
    $conn->processUntil('session_start');
    $conn->presence();
    $conn->message('user2@188.166.68.172', $message); // message send from here
    $conn->disconnect();
    } catch(XMPPHP_Exception $e) {
    echo ($e->getMessage());
    }
}
