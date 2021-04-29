#!/data/data/com.termux/files/usr/bin/env bash

# myTermux utility
# change terminal color
alias chcolor='/data/data/com.termux/files/home/.termux/colors.sh'
# change terminal font
alias chfont='/data/data/com.termux/files/home/.termux/fonts.sh'

# my aliases
alias q='exit'
alias c='clear'
alias v=nvim
alias vim='nvim -u ~/.vimrc'
alias V=vim
alias p='python'
alias n='ncmpcpp'
alias Sd='cd /sdcard'
alias mkill='mpd --kill'
alias mem='df -h | egrep "size|storage" | awk "{print $2}"'
alias srzsh='source ~/.zshrc'
alias neo='neofetch --ascii_distro arcolinux_small'
alias desktop='vncserver -geometry 1420x720'
alias dkill='vncserver -kill'
exa &>/dev/null
if [ $? == 0 ]; then
  alias ls="exa --icons"
  alias la="exa -a --icons"
  #alias la="exa --icons -lgha --group-directories-first"
else
  alias la='ls -a'
fi

# config files
alias zshrc="v ~/.zshrc"
alias bashrc='v ~/../usr/etc/bash.bashrc'
alias vimrc='v ~/.vimrc'
alias nvimrc="v ~/.config/nvim/init.vim"
alias aliases='v ~/.my_aliases'
alias xstart='v ~/.vnc/xstartup'
alias rcxml='v ~/.config/openbox/rc.xml'
alias mpdconf="v ~/.mpd/mpd.conf"
alias mpconf="v $PREFIX/etc/mpd.conf"
alias neoconf='v ~/.config/neofetch/config.conf'
alias ncmconf="v ~/.config/ncmpcpp/config"
alias mycolors='v ~/.termux/colors/ann.colors'

# go to directory
SDCARD="/storage/D639-79B5"
alias github='cd $SDCARD/Documents/github.com'
alias annzc='cd $SDCARD/Documents/github.com/annzc'
alias piton='cd $SDCARD/Documents/learnCode/python'
alias dload='cd /sdcard/download'
alias pf="cd $PREFIX"
alias Ex='cd $SDCARD/'
alias Doc='cd $SDCARD/Documents/'
alias binn='cd $PREFIX/bin'
alias etc='cd $PREFIX/etc'

# johnTheRipper aliases
if [ -f ~/bin/john_aliases ]; then
  . ~/bin/john_aliases
fi

# enable icon for lf file explorer
if [ -f ~/.config/lf/lfrc ]; then
  . ~/.config/lf/lfrc
fi

listfile(){
  find . -maxdepth 1 -type f | sed "/\.\/\./d" | sed "s/\.\///g"
}

# python virtual environment control
pyenv(){
  if [ ! -f $PREFIX/bin/virtualenv ]; then
    echo "don't forget to install python virtualenv package first\nrun: pkg install virtualenv\nor : pip install virtualenv"
  elif [[ $1 == "-c" ]]; then
    virtualenv env
  elif [[ $1 == "-a" ]]; then
    if [ -f ./env/bin/activate ]; then
      source env/bin/activate
    else
      echo "have you already ran \"pyenv -c\" in your current directory?"
    fi
  elif [[ $1 == "-d" ]]; then
    deactivate &>/dev/null
    if [ ! $? == 0 ]; then
      echo "you're not in any virtual env!"
    fi
  else
    echo "USAGE: pyenv [COMMANDS]

list commands:
-------------
-c   - create a \"env\" folder as virtualenv
-a   - activate virtual environment
-d   - deactivate current virtualenv
-------------"
  fi
}

## another useful functions
## got these from tutermuxid
# shorthand for chmod
cx(){
  if [ $2 ]; then
    if [ $1 == "-" ]; then
      if [ -f $2 ]; then
        chmod -x $2
      else
        echo "no such file!"
      fi
    elif [ -f $1 ]; then
      chmod +x $1
    elif [ ! -f $1 ]; then
      echo "no such file!"
    fi
  else
    echo "Usage: cx [file]"
  fi
}

# shorthand for git clone
gitc(){
  if [ $2 ]; then
    git clone https://github.com/$1/$2
  elif [ $1 ]; then
    echo -e "[repo] not found!"
    echo -e "USAGE: $ gitc [username] [repo]"
  else
    echo -e "USAGE: \n$ gitc [username] [repo]"
  fi
}

# shorthand to git remote
gitrmt(){
  if [ $2 ]; then
    git remote add origin https://github.com/$1/$2
  elif [ $1 ]; then
    echo -e "[repo] not found!"
    echo -e "USAGE: $ gitrmt [username] [repo]"
  else
    echo -e "USAGE: \n$ gitrmt [username] [repo]"
  fi
}
