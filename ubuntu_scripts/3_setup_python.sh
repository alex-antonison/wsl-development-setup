#!/bin/bash

git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv

## Pushes pyenv environment variables into .bashrc
echo '## pyenv setup' >> $HOME/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $HOME/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> $HOME/.bashrc

## Sources .bashrc
source ~/.bashrc

# ## Install pyenv
PYTHON_VERSION="3.7.5"

pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION
