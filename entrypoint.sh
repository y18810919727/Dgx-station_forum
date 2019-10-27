#!/bin/bash
set -e
cat <<EOF
================
    Your Name
===============
EOF
# jupyter 访问密码，自行修改
TOKEN='passwd123'
# 容器内jupyter代码存放路径，自行修改
JUPYTER_DIR = "/code"
  
echo "总共参数: $#"
echo "脚本名字: $0"
service ssh start
nohup jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token="$TOKEN" --notebook-dir="$JUPYTER_DIR" &
if [[ $# -eq 0 ]]; then
  exec "/bin/bash"
else
  exec "$@"
fi
