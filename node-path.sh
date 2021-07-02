
#nodejs installation setup
export LOCAL=$HOME/.local/install
export NODE_PATH=$LOCAL/node/bin
export PATH=$NODE_PATH:$PATH

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
_PS1="$PS1"
PS1='$(echo $title|sed -r -e "s/^(\S+)\$/[\1]/")'"${_PS1}\n> "

