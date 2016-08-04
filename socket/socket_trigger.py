#!/usr/bin/python
import time
import signal
import socket
import threading
from threading import Thread
from websocket import create_connection

def websocketthread():
    ws = create_connection("ws://192.81.220.57:8880")

    while True:
    #   signal.alarm(1)
       time.sleep(5)
       ws.send("{\"message_type\":\"request\",\"type\":\"process_complete\"}")
       pass

    result =  ws.recv()
    print "Received '%s'" % result
    ws.close()
pass



def checkthread():
    sock = socket.socket()
    sock.bind(('', 7373))
    sock.listen(1)
    conn, addr = sock.accept()

    print 'connected:', addr

    while True:
        data = conn.recv(1024)
        if not data:
            break
        conn.send("1")

    conn.close()
pass

Thread(target = websocketthread).start()