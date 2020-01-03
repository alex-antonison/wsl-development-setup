#!/bin/bash

## Setup yarn

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install yarn

## Setup mermaid.cli

git clone https://github.com/mermaidjs/mermaid.cli $HOME/.mermaid.cli
cd $HOME/.mermaid.cli
yarn add mermaid.cli

## Add mermaid.cli to path

echo "export PATH=$PATH:~/.mermaid.cli/node_modules/.bin" >> >> $HOME/.bashrc