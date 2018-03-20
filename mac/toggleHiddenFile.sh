#!/bin/sh

#echo '系统隐藏文件显示状态修改'

showstate=$(defaults read com.apple.finder AppleShowAllFiles)

if [ "$showstate" -eq "0" ];then

echo '当前处于隐藏状态'
defaults write com.apple.finder AppleShowAllFiles -bool true
killall Finder
echo '切换系统隐藏文件显示状态为---显示---'
exit 1

else

echo '当前处于显示状态'
defaults write com.apple.finder AppleShowAllFiles -bool false
killall Finder
echo '切换系统隐藏文件显示状态为--隐藏----'
exit 1;
fi
