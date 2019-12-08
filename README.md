# Guide to setting up dev environment in Windows + WSL

## Overview

The purpose of this guide is to document my personal setup for WSL as I am trying to get more used to the environment.  Will adjust this over time as I discover new things.

## General notes

* It is important to remember to run PowerShell or Command Prompt as `Run Administrator` in order to have correct permissions for setup.
* When working in Windows Terminal, to copy you need to do `CTRL + SHIFT + C` as `CTRL + C` will kill processes.  To paste text you need to use `CTRL + SHIFT + V`.  You can also use the right click on your mouse to both copy and paste text.

## Manual Steps

1. Enable WSL on Windows 10 - see this link on how to do that [Windows 10 Enable WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
2. Install Chocolatey. [https://chocolatey.org/docs/installation](https://chocolatey.org/docs/installation)
    1. Chocolatey is a PowerShell software management tool in windows and is a useful way of managing installs.
3. Install Ubuntu 18.04 LTS from the Microsoft Store [https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab](https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab).
    1. There is an option to simply always install the latest LTS but as this guide will be built with 18.04 LTS, if I do upgrade to a future LTS, I will check and make sure it all works before changing that here.
    2. Once you have it installed, you will need to open the Ubuntu app and provide a username and password to complete the setup.  I am not a huge fan of the default terminal and will be suggesting another one in following steps.
4. Install [VS Code](https://code.visualstudio.com/) and [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701?activetab=pivot:overviewtab) with chocolatey with [windows_apps_setup.ps1](windows_scripts/windows_apps_setup.ps1)
5. At this point, you should have Ubuntu 18.04 LTS installed, VS Code, and Windows Terminal.  From here you can open up Windows Terminal and the first thing I like to do is go into settings and swap out the default profile to Ubuntu as that will be my main terminal of choice.
6. To allow for you to have your files shared between Windows and Ubuntu, I like to change my home directory to be mapped to `/mnt/c/Users/[username]`.  You can accomplish this by checking out this helpful post. [Blog on Remapping WSL Home](https://jeremyskinner.co.uk/2018/07/27/sharing-home-directory-between-windows-and-wsl/)
    1. If you are interested in keeping your files available between both Windows and Ubuntu, it is important you do this now since it will be a bit cumbersome to do this after the fact.
    2. I am not sure exactly but I believe you may need to restart your computer or at a minimum log out and log back in for this to take effect.
7. Create an SSH key.  Since I typically do most of my compute against on a server, always handy to go ahead and create a ssh key for more secure authentication.  `ssh-keygen -t rsa -C "[your-email]`.  Highly suggest including a password with your ssh-key as it provides an additional layer of security.
8. Before you can use VS Code in WSL, you will need to first open it up and install the WSL extension.  I also suggest checking out some of my other suggested extensions at [Suggested Extensions](#suggested-extensions) section.  Once you have WSL installed, you will be able to easily bring it up by changing to the directory you want to open it in and do `code .`.
   1. One important thing to note is that you will have to install extensions both within WSL as well as on Windows.
9. Next, we will install necessary Linux packages for development.  I suggest checking out my [1_setup_linux_packages.sh](ubuntu_scripts/1_setup_linux_packages.sh) script to see what packages I have included prior to running.  There will be a prompt mid-install so be sure to keep an eye out for it and select `Yes`.
10. With packages installed, I suggest upgrading your `.bashrc` with [Oh My BASH!](https://ohmybash.github.io/).  I have written a short script that will install Oh My Bash as well as echo sourcing your `.bashrc` into your `.bash_profile` at [2_setup_oh_my_bash.sh](ubuntu_scripts/2_setup_oh_my_bash.sh)
    1. There is also an [Oh My ZSH!](https://ohmyz.sh/) if you prefer zshell.
11. With all necessary packages installed and your `.bashrc` setup, you are now ready to setup Python! [pyenv](https://github.com/pyenv/pyenv) is my favorite method of managing different versions of python.  You can see the [3_setup_python.sh](ubuntu_scripts/3_setup_python.sh) for how to set it up.

## Setting up Docker

I have not yet figured out how to get Docker working well directly within WSL, however WSL2 is supposed to solve a lot of the problems noted between Docker and WSL.  For now I will simply be working with Docker Desktop.  See [Install Docker Desktop on Windows](https://docs.docker.com/docker-for-windows/install/) for how to setup in Windows.  If you have any advice or suggestions on getting it working in WSL, please send them my way!

## Python Environment Management

After working with [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/) for a long time, I have opted recently to switch to using [venv](https://docs.python.org/3/library/venv.html) as it is simple to setup and use, no prior setup is necessary, and it works without fail.  Also, if you are using VS Code and you open VS Code up in your project directory, it will detect

1. To set it up, you will execute `python -m venv /path/to/project/venv` which I suggest being collocated with your project.
2. To use, you will need to do the following:

```bash
cd /path/to/project
source /venv/bin/activate
```

Once you are done, to stop using the environment you just run `deactivate` and it will stop the environment.

## Suggested-Extensions

* [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
* [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
* [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
* [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
* [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
* [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
* [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
