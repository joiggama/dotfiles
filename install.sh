#!/bin/zsh

source ./shared/shell

case "$(uname)" in
  Linux)
    ./linux/install.sh
    ;;
  *)
    echo "TODO: $(uname) not supported"
    ;;
esac
