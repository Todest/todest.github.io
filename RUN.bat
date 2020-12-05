@echo off
title Hexo Deploy System
call hexo clean
call hexo generate
call hexo deploy
call hexo backup
exit