
#!/bin/bash

DATETIME=`date "+%Y-%m-%d %H:%M:%S"`

# 切换到脚本所在目录
cd -- "$(dirname "$BASH_SOURCE")" || exit

# 执行Git操作
# 检测git空间状态
if [[ -n $(git status --short)  ]];then
  # 提交推送
  git add .
  git commit -m "synchronization $DATETIME"
  git pull
  git push
  # git push --set-upstream origin $TARGET_BRANCH
else
  git pull
  echo "workspce no changes"
fi

# 保持终端运行
read -n 1 -s -r -p "按任意键继续..."
