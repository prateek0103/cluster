<?php

//All worker work goes here
$messagetosend =  array('toclient' => 'user_token_here',
    'data' => "Message from background task!");
$context = new ZMQContext();
//You can establish this connection only once if you want but then you need to propertly handle disconnected events and reconnect on them. 
//So until you are not requied to do so - I stronly advice not to make such thing.... It will give benefit only if there will be over 50 connections per second on this socet. Until then just establish it from script.
$socket = $context->getSocket(ZMQ::SOCKET_PUSH, 'pushsock'); 
$socket->connect("tcp://localhost:8081");
$socket->send(json_encode($messagetosend));