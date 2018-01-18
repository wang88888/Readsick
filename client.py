#!/usr/bin/python
# -*- coding: UTF-8 -*-
# 文件名：client.py

import socket               # 导入 socket 模块
import time
import requests 
s = socket.socket()         # 创建 socket 对象
host = '192.168.7.1'        
port = 80                   
s.connect((host, port))
print port
while True:
    sendData = raw_input('please input the send message:')

    if len(sendData)>0:
        s.send(sendData)  

    else:
        break   
    time.sleep(3)
    print s.recv(1024)

s.close()  