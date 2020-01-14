if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn keyword httpMethod  OPTIONS GET HEAD POST PUT DELETE TRACE CONNECT PATCH contained

syn match httpProto         'HTTP/[0-9.]\+' contained
syn match httpStatusCode    '[0-9]\{3\}' contained
syn match httpStatus        '[0-9]\{3\} .*$' contained contains=httpStatusCode
syn match httpHeaderKey     '^[A-Z][A-Za-z0-9\-]*:' contained
syn match httpURILine       '^\(OPTIONS\|GET\|HEAD\|POST\|PUT\|DELETE\|TRACE\|CONNECT\|PATCH\)\( .*\)\?\(HTTP/[0-9.]\+\)\?$'  contains=httpMethod,httpProto,inlineScript contained
syn match httpResponseLine  '^HTTP/[0-9.]\+ [0-9]\{3\}.*$' contains=httpProto,httpStatus contained
syn match httpHeaderLine    '^[A-Z][A-Za-z0-9\-]*: .*$' contains=httpHeaderKey,inlineScript contained

syn region responseHandler   start='> {%' end='%}'
syn region inlineScript   start='{{' end='}}'

syn region httpHeader       start='^\(OPTIONS\|GET\|HEAD\|POST\|PUT\|DELETE\|TRACE\|CONNECT\|PATCH\)\( .*\)\?\(HTTP/[0-9.]\+\)\?$' end='\n\s*\n' contains=httpURILine,httpHeaderLine,inlineScript
syn region httpHeader       start='^HTTP/[0-9.]\+ [0-9]\{3\}.*$' end='\n\s*\n' contains=httpResponseLine,httpHeaderLine

syn match httpComment '#.*$'

hi link httpComment Comment
hi link inlineScript    Label
hi link responseHandler Macro
hi link httpMethod      Type
hi link httpProto       Statement
hi link httpHeaderKey   Identifier
hi link httpStatus      String
hi link httpStatusCode      Number

let b:current_syntax = 'http'

let &cpo = s:cpo_save
unlet s:cpo_save
