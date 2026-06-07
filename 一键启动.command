#!/bin/bash
cd "$(dirname "$0")"
echo ""
echo "  🚀 启动生日卡..."
echo ""

# 启动服务器
python3 -m http.server 8080 > /dev/null 2>&1 &

# 启动隧道
ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30 -R 80:localhost:8080 nokey@localhost.run

# 关服务器
kill $(lsof -ti:8080) 2>/dev/null
