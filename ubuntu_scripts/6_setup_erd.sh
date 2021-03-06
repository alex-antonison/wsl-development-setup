#!/bin/bash

## Setup stack

curl -sSL https://get.haskellstack.org/ | sh

## Setup erd

git clone git://github.com/BurntSushi/erd $HOME/.erd
cd $HOME/.erd
stack install
