#!/bin/bash

# 检查是否传入了目录参数，如果没有，默认使用当前目录
if [[ $# -eq 0 ]]; then
	directory="."
else
	directory="$1"
fi

# 遍历指定目录下的所有目录
for dir in "$directory"/*/; do
	if [[ -d "$dir/.git" ]]; then
		echo "Checking Git status in directory: $dir"
		cd "$dir"

		# 检查当前目录是否有未提交的文件
		if [[ -n $(git status -s) ]]; then
			echo "Uncommitted changes found. Running 'git fetch' instead."
			git fetch
		else
			echo "Updating Git code in directory: $dir"
			git pull --rebase && git submodule init && git submodule update --init
		fi

		cd ..
	fi
done
