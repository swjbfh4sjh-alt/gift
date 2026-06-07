#!/bin/bash
cd "$(dirname "$0")"

# 启动服务器
python3 -m http.server 8080 &
SERVER_PID=$!

# 启动隧道
ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30 -R 80:localhost:8080 nokey@localhost.run 2>&1 | grep -oP 'https://[a-z0-9]+\.lhr\.life'

# 关掉服务器
kill $SERVER_PID 2>/dev/null
