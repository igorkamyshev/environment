#!/bin/bash

# ensure Command Line Tools
if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
   test -d "${xpath}" && test -x "${xpath}" ; then
   echo 'Command Line Tools already installed'
else
   echo 'Installing Command Line Tools now'
   xcode-select --install
fi

# ensure Homebrew
if test ! $(which brew); then
  echo 'Installing Homebrew now '
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed"
fi

brew bundle

# configure git
git config --global user.name "Igor Kamyshev"
git config --global user.email igor@kamyshev.me

brew cleanup
