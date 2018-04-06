"Check if py3 is supported
function! s:UsingPython3()
  if has('python3')
    return 1
  endif
  if has('python')
    return 0
  endif
  echo "Error: Required vim compiled with +python/+python3"
  finish
endfunction

let s:using_python3 = s:UsingPython3()
let s:python_until_eof = s:using_python3 ? "python3 << EOF" : "python << EOF"
let s:python_command = s:using_python3 ? "py3 " : "py "

" This function taken from the lh-vim repository
function! s:GetVisualSelection()
    try
        let a_save = @a
        normal! gv"ay
        return @a
    finally
        let @a = a_save
    endtry
endfunction

function! s:GetCursorWord()
    return expand("<cword>")
endfunction

exec s:python_until_eof

# -*- coding: utf-8 -*-
import vim,re
import sys

try:
    from googletrans import Translator
except ImportError:
    pass
def str_decode(word):
    if sys.version_info >= (3, 0):
        return word
    else:
        return word.decode('utf-8')

def translate_visual_selection(lines):
    translate = Translator()
    try:
      if(translate.detect(lines).lang == 'zh-CN'):
        result = translate.translate(lines.replace('\n', ' '), dest='en').text 
      else:
        result = translate.translate(lines.replace('\n', ' '), dest='zh-CN').text
    except Exception as e:
      result = 'network err! Please check your network connection.'

    vim.command('echo "' + str_decode(result) + '"')
EOF

function! s:GoogleVisualTranslate()
    exec s:python_command 'translate_visual_selection(vim.eval("<SID>GetVisualSelection()"))'
endfunction

function! s:GoogleCursorTranslate()
    exec s:python_command 'translate_visual_selection(vim.eval("<SID>GetCursorWord()"))'
endfunction

function! s:GoogleEnterTranslate()
    let word = input("Please enter the word: ")
    redraw!
    exec s:python_command 'translate_visual_selection(vim.eval("word"))'
endfunction

command! GGv call <SID>GoogleVisualTranslate()
command! GGc call <SID>GoogleCursorTranslate()
command! GGi call <SID>GoogleEnterTranslate()
