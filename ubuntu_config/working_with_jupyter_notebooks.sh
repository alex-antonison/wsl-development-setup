#!/bin/bash

## To add a kernel to jupyter notebook - (https://ipython.readthedocs.io/en/stable/install/kernel_install.html)
### Activate the kernel
source activate myenv

### Add the kernel to ipython
python -m ipykernel install --user --name myenv

## To list all existing 
jupyter kernelspec list

## To remove a kernel - https://stackoverflow.com/questions/42635310/remove-kernel-on-jupyter-notebook
jupyter kernelspec uninstall kernel_name

## To start a jupyter notebook in chrome - https://github.com/jupyter/notebook/issues/4594 (towards the end)
BROWSER=/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe jupyter notebook --NotebookApp.use_redirect_file=False

## To start a jupyter notebook in firefox
BROWSER=/c/Program\ Files/Mozilla\ Firefox/firefox.exe jupyter notebook --NotebookApp.use_redirect_file=False