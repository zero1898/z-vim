# z-vim
configure my own vim

---
### 1.卸载老版本vim
```shell
sudo apt-get remove vim
sudo apt-get remove vim-runtime
sudo apt-get remove gvim
sudo apt-get remove vim-tiny
sudo apt-get remove vim-common
sudo apt-get remove vim-gui-common
```

### 2.必备工具
```shell
# git
sudo apt-get -y install git

$ ctags
sudo apt-get -y install ctags

# 下载工具
sudo apt-get -y install wget curl

# 编译工具
sudo apt-get -y install build-essential cmake
```

### 3.安装vim依赖
```shell
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev \
    python python3 python-dev python3-dev \
    ruby-dev libperl-dev lua5.2 lua5.2-dev
```

### 4.从github下载vim源码
```shell
git clone https://github.com/vim/vim.git
# 更新以前下载的源码
cd vim/ && git pull
```

### 5.编译
```shell
cd vim/src
# 设置vim源码编译属性
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp \
    --enable-pythoninterp --enable-python3interp \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
    --enable-perlinterp \
    --enable-luainterp \
    --enable-gui=gtk2 --enable-cscope --prefix=/usr
# --with-features=huge：支持最大特性
# --enable-multibyte：多字节支持 可以在Vim中输入中文
# --enable-rubyinterp：启用Vim对ruby编写的插件的支持
# --enable-pythoninterp：启用Vim对python编写的插件的支持
# --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ 指定 python 路径
# --enable-perlinterp：启用Vim对perl编写的插件的支持
# --enable-luainterp：启用Vim对lua编写的插件的支持
# --enable-gui=gtk2：gtk2支持,也可以使用gnome，表示生成gvim
# --enable-cscope：Vim对cscope支持
# --prefix=/usr：编译安装路径
# 需要重新配置可 输入 make distclean 清理一下上一次编译生成的所有文件

make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install
```

### 6.配置我的vim
```shell
# 下载我的z-vim(包括bashrc)
git clone https://github.com/zero1898/z-vim.git
# 脚本安装
cd z-vim/ && sh install.sh
```

### 7.语法检测
```shell
# python包管理工具pip
sudo apt-get -y install python-pip
# python语法检测
sudo pip install pyflakes
sudo pip install pep8

# php
sudo apt-get -y install php
sudo apt-get -y install php-dev php-curl php-pear
# php语法检测
sudo pear install PHP_CodeSniffer

# 安装node管理工具nvm
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | NVM_DIR="path/to/nvm" bash
# 安装完成后，需要重启终端。之后执行下列命令即可安装 Node.js
nvm install ???
# html5 && js语法检测
sudo $NVM_BIN/npm install -g jshint
```
