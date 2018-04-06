# vim google translater

**vim google translater** 是使用谷歌翻译python库提供vim内翻译功能的插件，需要安装`googletrans`

**经过修改vim插件 [ianva/vim-youdao-translater](https://github.com/ianva/vim-youdao-translater) 得到**

## 安装

### 安装googletrans

```
pip install googletrans
```

### 普通安装:
把 `gt.vim` 文件拷贝到 `~/.vim/plugin` 目录下，就可以用了。


### Bundle安装：
如果装有 Bundle 可以 :

1. 修改.vimrc

   ```
   Bundle 'ghoskno/vim-googletrans'
   ```

2. ```
   :BundleInstall
   ```




###  其他
添加 `~/.vimrc` 文件：

```vim
vnoremap <silent> <C-T> :<C-u>GGv<CR>
nnoremap <silent> <C-T> :<C-u>GGc<CR>
noremap <leader>ct :<C-u>GGi<CR>
```

## 如何使用

在普通模式下，按 `<C-T>`， 会翻译当前光标下的单词；

在 `visual` 模式下选中单词或语句，按 `<C-T>`，会翻译选择的单词或语句；

点击`<leader>ct`键可以在命令行输入要翻译的单词或语句；

译文将会在编辑器底部的命令栏显示。


## 额外说明
该插件使用的`googletrans` python库需要额外安装且该插件需要翻墙访问谷歌主站，且翻译结果单一，使用较为不便。
可考虑使用另一个通过爬虫访问百度翻译的插件，见[vim-baidu-translate](https://github.com/GhosKno/vim-baidu-translate)
