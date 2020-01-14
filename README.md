# vim-dot-http

[dot-http](https://github.com/bayne/dot-http) support for vim

![screenshot](https://user-images.githubusercontent.com/712014/72755392-39831a00-3b7f-11ea-8407-82d666b029e3.png)

## Description

Features:
- Syntax highlighting for .http files
- Run request under cursor
- Response output displayed in scratch buffer

## Installation

```
# vim 8 native package loading
# http://vimhelp.appspot.com/repeat.txt.html#packages
git clone https://github.com/bayne/vim-dot-http.git ~/.vim/pack/my-packages/start/vim-dot-http
```

## Usage

Running `:DotHttp` will invoke `dot-http` on the line that the cursor is currently on. The response output will be displayed in a scratch buffer.

Set the current environment by setting the environment variable

```
let g:dot_http_env = 'dev'
```
