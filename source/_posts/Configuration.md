---
title: 配置文件
date: 2019-03-29 17:11:09
categories:
  - 资料
tags:
  - Notepad
  - VIM
  - VScode
  - Sublime
abbrlink: da99de06
---
# Notepad++
```bat <code>编译</code>
cmd /k g++ -o $(CURRENT_DIRECTORY)\$(NAME_PART).exe "$(FULL_CURRENT_PATH)" & PAUSE & EXIT
```
```bat <code>运行</code>
cmd /k "$(CURRENT_DIRECTORY)\$(NAME_PART)" & PAUSE & EXIT
```
```bat <code>编译并运行</code>
cmd /k g++ -o $(CURRENT_DIRECTORY)\$(NAME_PART).exe "$(FULL_CURRENT_PATH)" &cmd /k "$(CURRENT_DIRECTORY)\$(NAME_PART)" & PAUSE & EXIT
```
<!--more-->
# .vimrc
```vimrc
set number
set nocompatible
syntax on
set showmode
set showcmd
set mouse=a
set encoding=utf-8
set t_Co=256
filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4
set cursorline
set nowrap
set laststatus=2
set ruler
set showmatch
set hlsearch
set ignorecase
set smartcase
set nobackup
set noswapfile
set noerrorbells
set visualbell
set history=1000
set autoread
set listchars=tab:»■,trail:■
set wildmenu
set wildmode=longest:list,full
```

# VS code
`launch.json`
```json
{
	"version": "0.2.0",
	"configurations": [
		{
			"name": "(gdb) Launch", // 配置名称，将会在启动配置的下拉菜单中显示
			"type": "cppdbg",	   // 配置类型，这里只能为cppdbg
			"request": "launch",	// 请求配置类型，可以为launch（启动）或attach（附加）
			"program": "${workspaceRoot}/${fileBasenameNoExtension}.exe",// 将要进行调试的程序的路径
			"args": [],			 // 程序调试时传递给程序的命令行参数，一般设为空即可
			"stopAtEntry": false,   // 设为true时程序将暂停在程序入口处，一般设置为false
			"cwd": "${workspaceRoot}", // 调试程序时的工作目录，一般为${workspaceRoot}即代码所在目录
			"environment": [],
			"externalConsole": true, // 调试时是否显示控制台窗口，一般设置为true显示控制台
			"MIMode": "gdb",
			"miDebuggerPath": "E:\\MinGW\\bin\\gdb.exe", // miDebugger的路径，注意这里要与MinGw的路径对应
			"preLaunchTask": "g++", // 调试会话开始前执行的任务，一般为编译程序，c++为g++, c为gcc
			"setupCommands":
			[
				{
					"description": "Enable pretty-printing for gdb",
					"text": "-enable-pretty-printing",
					"ignoreFailures": true
				}
			]
		}
	]
}
```
`tasks.json`
```json
{
	"version": "2.0.0",
	"command": "g++",
	"args": ["-g","${file}","-o","${fileBasenameNoExtension}.exe"],	// 编译命令参数
	"problemMatcher": {
		"owner": "cpp",
		"fileLocation": ["relative", "${workspaceRoot}"],
		"pattern": {
			"regexp": "^(.*):(\\d+):(\\d+):\\s+(warning|error):\\s+(.*)$",
			"file": 1,
			"line": 2,
			"column": 3,
			"severity": 4,
			"message": 5
		}
	}
}
```
# Sublime
```json <code>G++.sublime-build</code>
{ 
    "cmd": ["g++", "${file}", "-std=c++11", "-o", "${file_path}\\\\${file_base_name}", "&", "start", "cmd", "/c", "${file_path}\\\\${file_base_name} & echo. & pause"],
    "file_regex": "^(..[^:]*):([0-9]+):?([0-9]+)?:? (.*)$", "working_dir": "${file_path}",
    "selector": "source.c, source.c++", "shell": true,
    "encoding":"cp936", 
    "variants":
    [
        {
            "name" : "Build Only",
            "cmd":["g++", "${file}", "-std=c++11", "-o", "${file_path}\\\\${file_base_name}"]
        },
        {
            "name" : "Run Only",
            "cmd" : ["start", "cmd", "/c", "${file_path}\\\\${file_base_name} & echo. & pause"]
        }
    ]
}
```