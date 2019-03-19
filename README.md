# Dotfiles

My dotfiles and setup scripts.

## 1 Requirements

* make
* git
* curl

## 2 Make

* Configure shell with `.bashrc`, `.inputrc` etc.:
  ```sh
  make shell
  ```
* Restore shell configurations:
  ```sh
  make restore_shell
  ```
* Setup and configure vim with `.vimrc` and
[vim-plug](https://github.com/junegunn/vim-plug)
  ```sh
  make vim
  ```
* Install drivers and programs for work (ubuntu):
  ```sh
  make desktop
  ```
