# VIM


## Info

* [Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/)
* [Practical Vim](https://pragprog.com/book/dnvim2/practical-vim-second-edition)
* [Modern Vim](https://pragprog.com/book/modvim/modern-vim) (varhato megjelenes: 2018 januar)
* [The VimL Primer](https://pragprog.com/book/bkviml/the-viml-primer)
* mapping:
    - [1](http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1))
    - [2](http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_2))
    - [3](http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_3))
* Ian Langworth cikkei:
    - [vim after 11 years 1](https://statico.github.io/vim.html)
    - [vim after 11 years 2](https://statico.github.io/vim2.html)
    - [vim after 15 years](https://statico.github.io/vim3.html)
* vimrc
    - default vimrc: `/etc/vim/vimrc`
    - official example: `/usr/share/vim/vim*/vimrc_example.vim`
    - [itchyny's vimrc](https://github.com/itchyny/dotfiles/blob/master/.vimrc)
    - [a good vimrc](https://dougblack.io/words/a-good-vimrc.html)
    - [example vimrc with notes](https://github.com/sheerun/vimrc)
* python
    - [full stack python](https://www.fullstackpython.com/vim.html)
    - [vim and python](https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/)
* Vim 8
    - [howto: Vim 8 packages](https://ajnasz.hu/blog/20170917/vim-csomagkezeles-howto)
* Install from source
    - [recompiling the distro package, with custom config](https://askubuntu.com/questions/585237/whats-the-easiest-way-to-get-vim-with-python-3-support)
    - [building from source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)
* omnicomplete
    - [stack overflow](https://stackoverflow.com/questions/7097299/vim-python-completion)
    - [vim.wikia: omnicomplete](http://vim.wikia.com/wiki/Category:Omnicomplete)
    - [vim popup menu like in an IDE](http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE)
    - [completion using a szntax file](http://vim.wikia.com/wiki/Completion_using_a_syntax_file)


### pluginok

* altalanos tajekozodas: [vim awesome](https://vimawesome.com/), [ultimate vim
  conf](https://github.com/amix/vimrc), [top 5 vim
  plugins](https://www.reddit.com/r/vim/comments/6562vs/top_5_best_vim_plugins_in_2017/)
* plugin-manager: [pathogen](https://github.com/tpope/vim-pathogen)
* erdekesek lehetnek:
    - [vim-dokumentary](https://github.com/gastonsimone/vim-dokumentary):
      Normal modban a K meghivja a kurzor alatti szora  man-t. Ezzel a
      pluginnal a fajltipusnak megfelelo dokumentaciot hivja meg, pl pythonnal
      a pydoc-ot.
    - [vim-grep](https://github.com/itchyny/vim-grep)
    - [vim-surround](https://github.com/tpope/vim-surround): zarojelek, tag-ek
    - [vim-ragtag](https://github.com/tpope/vim-ragtag): tag-ek, autoclose
      helyett esetleg
    - [vim-unimpaired](https://github.com/tpope/vim-unimpaired)
    - [vim-bufferline](https://github.com/bling/vim-bufferline) ([lightline
      integration](https://github.com/itchyny/lightline.vim/issues/36))
    - [lightline-bufferline](https://github.com/mgee/lightline-bufferline)
    - [lightline-buffer](https://github.com/taohex/lightline-buffer)
    - [syntastic](https://github.com/vim-syntastic/syntastic)
    - [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
    - [ropevim](https://github.com/python-rope/ropevim)
    - [python-mode](https://github.com/python-mode/python-mode)
    - [jedi-vim](https://vimawesome.com/plugin/jedi-vim)
    - [vim-polyglot](https://vimawesome.com/plugin/vim-polyglot)
    - [virtualenv.vim](https://vimawesome.com/plugin/virtualenv-vim)
    - [ale](https://vimawesome.com/plugin/ale)
    - [goyo](https://vimawesome.com/plugin/goyo-vim)
    - [startify](https://github.com/mhinz/vim-startify)
    - [snipmate](https://github.com/garbas/vim-snipmate) (snippets)
    - [ultisnips](https://github.com/SirVer/ultisnips)
    - [vim-devicons](https://vimawesome.com/plugin/vim-devicons)
    - [emmet-vim](https://github.com/mattn/emmet-vim)
      ([honlap](http://mattn.github.io/emmet-vim/))
    - [VimCompletesMe](https://github.com/ajh17/VimCompletesMe)



## Map

A mappeléssel saját billentyűzetkombinációhoz rendelhetünk
tetszőleges parancsot.
A mappelés általános formája: `{cmd} {attr} {lhs} {rhs}`, ahol

* `{cmd}` a konkrét mappelés fajtája,
* `{attr}` az opcionális módosítókat jelöli, amiből több is lehet,
* `{lhs}` azt jelöli a billentyűzetkombinációt, amit használni akarunk
* `{rhs}` pedig azokat a parancsokat, amit rövidíteni akarunk.

### `{cmd}`

Az alábbiakat magukban használva a létező mappeléseket lehet kilistázni.
Ezekből több variáció van attól függően, hogy milyen módban érvényes mappelést
akarunk. A következő parancsok az alábbi módokban érvényesek

* `map`: normal, visual, select és operator-pending módban 
* `map!`: insert és command-line 
* `nmap`: normal
* `imap`: insert
* `vmap`: visual és select
* `smap`: select
* `xmap`: visual
* `cmap`: command-line
* `omap`: operator-pending

## Vegyes dolgok

### Karakterek

* Karakter bevitele insert módban: `Ctrl+K <alapbetű>`, ékezet. Pl. `Ctrl+K a"`
  = ä, l. `:h digraph`.
* A másik módszer: `Ctrl+V <num>`, pl `Ctrl+V 192` = À, l. `:h i_CTRL-V`.  A
  `<num>` lehet decimális, oktális vagy hexadecimális is.  A `Ctrl+V TAB`
  (hasonlóan a terminálhoz) egy TAB-ot illeszt be, akkor is, ha az `expandtab`
  amúgy be van állítva.
* `{cmd}:ascii`: kiírja a kurzor alatti karakter ascii értékét decimális,
  oktális és hexadecimálisan is.
* `ga`: mint az `ascii`, de normál módban is kiadható.  A
  [vim-characterize](https://github.com/tpope/vim-characterize) plugin
  kiegészíti ezeket a unicode kódponttal és a karakter nevével.

### Vegyes dolgon belüli vegyes dolgok

* `gh`-val lehet belépni select módba, l. `:h Select-mode`
* `:redir! > output.txt` után bármilyen command-line módban
  kiadott parancs kimenete át lesz irányítva a megadott fájlba,
  egészen a `:redir END` parancs kiadásáig.
* `gq{motion}`: tördeli az érintett sorokat. Ha textwidth=0 (disabled), akkor
  79 a default engedélyezett max szélesség. Pl. `gqq` az adott sort, `gqip` az
  aktuális bekezdést tördeli újra. `gw` hasonlít, nem tudom a pontos
  különbséget.


## felteteles vundle:

[link](https://github.com/VundleVim/Vundle.vim/issues/7)

lehetoseg 1

```
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

if v:version < 702
 source bundles-old.vim
else 
 source bundles-modern.vim
endif
```

lehetoseg 2

```
if v:version >= 702
    Bundle 'L9'
endif
```

lehetoseg 3

```
if exists("*l9#getVersion")
    Bundle 'FuzzyFinder'
endif
```

