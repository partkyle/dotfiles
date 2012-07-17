#!/bin/sh

LINKABLES=`find . -iname *.symlink`

BACKUP=false
OVERWRITE=true

_dotfile() {
  BASELINK=`basename $1 | sed s/.symlink$// | sed s#^./##`
  DOTFILE="$HOME/.$BASELINK"
}

install() {
  for LINKABLE in $LINKABLES; do
    _dotfile $LINKABLE

    LINK_COMMAND="ln -s $PWD/$BASELINK $DOTFILE"

    if [ -e $DOTFILE ] || [ -L $DOTFILE ]; then
      if [ $BACKUP == "true" ]; then
        echo "backing up existing $DOTFILE to $DOTFILE.bak"
        mv $DOTFILE $DOTFILE.bak
      elif [ $OVERWRITE == "true" ]; then
        echo "deleting existing $DOTFILE"
        rm $DOTFILE
      else
        echo "Need to specify either OVERWRITE or BACKUP for files that exist"
        exit 1
      fi
    fi

    echo "linking: $LINK_COMMAND"
    $LINK_COMMAND
  done
}

uninstall() {
  for LINKABLE in $LINKABLES; do
    _dotfile $LINKABLE
    echo "removing $DOTFILE"
    rm $DOTFILE
  done
}

usage() {
  cat <<EOF
USAGE
EOF
}

case $1 in
  install)
    install
    ;;
  uninstall)
    uninstall
    ;;
  *)
    usage
    ;;
esac
