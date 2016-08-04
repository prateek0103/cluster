<?php
    include '../../includes/config.php';
    include '../../includes/connection.php';
    require '../../api/api_function.php';

    require dirname(__DIR__) . '/vendor/autoload.php';
require "WampSocketServer.php";
    $loop   = React\EventLoop\Factory::create();
    $server = new AppSockets\WampSrv;

    //We use ZeroMQ here to get messages from each service run. In such  way we eill never need a php client
    $context = new React\ZMQ\Context($loop);
    $msgReceiver = $context->getSocket(ZMQ::SOCKET_PULL);
    $msgReceiver->bind('tcp://127.0.0.1:8081'); // If your sripts are running on a different machine set ip to 0.0.0.0 and make sure to disallow all ips in firewall except those on from wich you want to push notifications
    $msgReceiver->on('message', array($server, 'onWorkDone'));

    // The global socketserver for clients(I am using wamp here as it is the easiest to handle user session token for multiply devices with it.
    $webSock = new React\Socket\Server($loop);
    $webSock->listen(8080, '0.0.0.0');
    $webServer = new Ratchet\Server\IoServer(
        new Ratchet\Http\HttpServer(
            new Ratchet\WebSocket\WsServer(
                new Ratchet\Wamp\WampServer ( $server )
            )
        ),
        $webSock
    );

    $loop->run();

?>