<html>
    <head>

    </head>
    <BODY>
        <a href="#" id="srvcmd" onclick="javascript:send()">Send command to server</a>
        <script src="http://autobahn.s3.amazonaws.com/js/autobahn.min.js"></script>
        <script>
            var conn = new ab.Session('ws://119.18.52.146:8080',
                function() {
                    conn.subscribe('user_token_here', function(topic, data) {
                        // This is the place to handle server pushes
                        alert('A message for this user:' + topic + ' : ' + data);
                    });
                },
                function() {
                    alert('WebSocket connection closed');
                },
                {'skipSubprotocolCheck': true}
            );
            function send()
            {
                conn.publish('user_token_here', "sent server message");
            }

        </script>
    </BODY>
</html>
