<?php
namespace AppSockets;
use Ratchet\ConnectionInterface;
use Ratchet\Wamp\WampServerInterface;

class WampSrv implements WampServerInterface {
    private $connectedTokens = array();
    public function onSubscribe(ConnectionInterface $conn, $topic) {
        //$topic is your user token. You should check here if session with this token exists and if not just close the connection with $conn->close();
        $this->connectedTokens[$topic->getId()] = $topic;
    }
    public function onUnSubscribe(ConnectionInterface $conn, $topic) {
    }
    public function onOpen(ConnectionInterface $conn) {
    }
    public function onClose(ConnectionInterface $conn) {
    }
    public function onWorkDone($request) {
        $msg = json_decode($request, 1);
        if (!array_key_exists($msg['toclient'], $this->connectedTokens)) {
            return;
        }
        $topic = $this->connectedTokens[$msg['toclient']];

        // send the data to all the clients subscribed to that user token
        $message=$msg["data"];
        $clientID=$msg["toclient"];
        if($message['message_type']=="request"){
            switch ($message['type']) {
                case 'dologin':
                    $arr=$message['value'];
                    $res=delete_tunnel($arr);
                    $message=json_encode($res);
                break;

                case 'dosignup':
                    $arr=$message['value'];
                    $res=delete_tunnel($arr);
                    $message=json_encode($res);

                break;

                case 'delete_tunnel':
                    $arr['id']=$message['value'];
                    $res=delete_tunnel($arr);
                    $message=json_encode($res);
                break;

                case 'gateay_change':
                    $id=$message['value']['id'];
                    $value=$message['value']['value'];
                    $res=gateway_change($id, $value, $clientID);
                    $message=json_encode($res);
                break;

                case 'bidirection_change':
                    $id=$message['value']['id'];
                    $value=$message['value']['value'];
                    $res=bidirection_change($id, $value, $clientID);
                    $message=json_encode($res);
                break;

                case 'internet_change':
                    $id=$message['value']['id'];
                    $value=$message['value']['value'];
                    $res=internet_change($id, $value, $clientID);
                    $message=json_encode($res);
                break;

                case 'route_change':
                    $id=$message['value']['id'];
                    $value=$message['value']['value'];
                    $res=route_change($id, $value, $clientID);
                    $message=json_encode($res);
                break;

                case 'group_change':
                    $id=$message['value']['id'];
                    $value=$message['value']['value'];
                    $res=group_change($id, $value, $clientID);
                    $message=json_encode($res);
                break;

                case 'add_tunnels':
                    $res=addTunnel($message['value']);
                    $message=json_encode($res);
                break;

                case 'add_server_clone':
                    $res=add_server_clone($message['value']);
                    $message=json_encode($res);
                break;

                case 'add_client_clone':
                    $res=add_server_clone($message['value']);
                    $message=json_encode($res);
                break;

                case 'edit_email':
                    $res=edit_email($message['value'], $clientID);
                    $message=json_encode($res);
                break;

                case 'edit_display':
                    $res=edit_display($message['value'], $clientID);
                    $message=json_encode($res);
                break;

                case 'request_real_ip':
                    $data['id']=$message['value'];
                    $res=request_real_ip($data, $clientID);
                    $message=json_encode($res);
                break;

                case 'change_location':
                    $res=change_location($message['value'], $clientID);
                    $message=json_encode($res);
                break;

                case 'real_ip_status':
                    $res=real_ip_status($message['value'], $clientID);
                    $message=json_encode($res);
                break;

                case 'save_a_tunnel':
                    $res=save_a_tunnel($message['value'], $clientID);
                    $message=json_encode($res);
                break;

                case 'save_all_tunnel':
                    $res=save_a_tunnel($clientID);
                    $message=json_encode($res);
                break;
            }
        }
        $topic->broadcast($message);
    }
    public function onCall(ConnectionInterface $conn, $id, $topic, array $params) {
        // I'm just closing a connection as soon as users for now should not send any messages to server. If it is not true, handle messages here $topic here is target user or group.
        // you need to assign users to additional groups so that you could send messages via this method without the need to expose targets session token wich should never be done !

        $conn->close();
    }
    public function onPublish(ConnectionInterface $conn, $topic, $event, array $exclude, array $eligible) {
        // In general this should be used if you just your client to be able to send messages to all listeners of a topic... Ive never used this function as onCall can handle tese situations too.
        if (!array_key_exists($topic->getId(), $this->connectedTokens)) {
            return;
        }

        // process user command here
        $topic->broadcast($event);
        //$conn->close();
    }
    public function onError(ConnectionInterface $conn, Exception $e) {
        //on socket error log and process it here
    }
}