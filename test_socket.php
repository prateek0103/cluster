<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
<meta charset="utf-8"/>
<title>DEMOVPN</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<script src="assets/plugins/jquery/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="assets/js/fancywebsocket.js" type="text/javascript"></script>
<script>
//test socket
function send( text ) {
            Server.send( 'message', text );
        }

        $(document).ready(function() {
            Server = new FancyWebSocket('ws://192.81.220.57:8880');

            //Let the user know we're connected
            /*Server.bind('open', function() {
                var data={"type":"dologin","message_type":"request","value":{"email":"subratar19@gmail.com","password":"123456"}};
                send(JSON.stringify(data));
            });*/

            //OH NOES! Disconnection occurred.
            Server.bind('close', function( data ) {

            });

            //Log any messages sent from server
            Server.bind('message', function( payload ) {
                console.log(payload);
                //log( payload );
            });

            Server.connect();
            setInterval(function(){
                var data = {"message_type":"request", "type":"deduct_cash"};
                send(JSON.stringify(data));
             }, 10000);
            setInterval(function(){
                var data = {"message_type":"request", "type":"process_complete"};
                send(JSON.stringify(data));
             }, 3000);
            /*setTimeout(function(){
                var data = {"type":"bidirection_change","message_type":"request","value":{"id":"43","value":"4"}};
                send(JSON.stringify(data));
             }, 5000);*/

             /*setTimeout(function(){
                var data = {"type":"get_tunnels","message_type":"request"};
                send(JSON.stringify(data));
             }, 8000);
            /*setInterval(function(){
                var data = {"type":"get_DeV", "message_type":"request", "data":{"id":4, "state":1, "device":'dffs32343'}};
                send(JSON.stringify(data));
             }, 5000);*/
        });

    //end of test socket
</script>
</head>

<body class="">
</body>
</html>