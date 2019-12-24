#!/bin/bash

## Set up oh my bash
sh -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"

## Add sourcing your .bashrc to
## your .bash_profile
echo "source ~/.bashrc" >> ~/.bash_profile