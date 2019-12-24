# Guide to setting up dev environment in Windows + WSL

## Overview

The purpose of this guide is to document my personal setup for WSL as I am trying to get more used to the environment.  I will adjust this over time as I discover new and need to setup new things.

## General notes

* It is important to remember to run PowerShell or Command Prompt as `Run Administrator` in order to have correct permissions for setup.
* When working in Windows Terminal, to copy you need to do `CTRL + SHIFT + C` as `CTRL + C` will kill processes.  To paste text you need to use `CTRL + SHIFT + V`.  You can also use the right click on your mouse to both copy and paste text.
* When using Jupyter Notebooks, you will need to start up the kernel in WSL and then copy and paste the link that comes up into your browser.  I have researched it automatically opening a browser a bit but have not found a reliable solution.

## Manual Steps

1. Enable WSL on Windows 10 - see this link on how to do that [Windows 10 Enable WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
2. Install Chocolatey. [https://chocolatey.org/docs/installation](https://chocolatey.org/docs/installation)
    1. Chocolatey is a PowerShell software management tool in windows and is a useful way of managing installs.
3. Install Ubuntu 18.04 LTS from the Microsoft Store [https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab](https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab).
    1. There is an option to simply always install the latest LTS but as this guide will be built with 18.04 LTS, if I do upgrade to a future LTS, I will check and make sure it all works before changing that here.
    2. Once you have it installed, you will need to open the Ubuntu app and provide a username and password to complete the setup.  I am not a huge fan of the default terminal and will be suggesting another one in following steps.
4. Install [VS Code](https://code.visualstudio.com/), [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701?activetab=pivot:overviewtab), and [git](https://git-scm.com/) with chocolatey with [windows_apps_setup.ps1](windows_scripts/windows_apps_setup.ps1)
5. At this point, you should have Ubuntu 18.04 LTS, VS Code, Windows Terminal, and git installed.  From here you can open up Windows Terminal and the first thing I like to do is go into settings and swap out the default profile to Ubuntu as that will be my main shell of choice.  You can do this by going into the settings and swapping out the guid for the Ubuntu terminal for the `defaultProfile`. <br/><br/><img src="https://github.com/alex-antonison/wsl-development-setup/blob/master/ubuntu_config/windows-terminal-settings.png" width="60%" height="60%"><img src="https://github.com/alex-antonison/wsl-development-setup/blob/master/ubuntu_config/windows-terminal-ubuntu-default.png" width="50%" height="50%">
6. To allow for you to have your files shared between Windows and Ubuntu, I like to change my home directory to be mapped to my home windows directory.  In order to allow for docker to also work, you need to create a `/etc/wsl.conf` and put the following in it - [wsl.conf](ubuntu_config/wsl.conf).  You also need to edit your `/etc/passwd` file and chnage your home directory to `/c/Users/username`
    1. For more information, you can look between these blog posts [How to share Windows and WSL Directory](https://jeremyskinner.co.uk/2018/07/27/sharing-home-directory-between-windows-and-wsl/) and [How to setup Docker in WSL](https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly)
    2. If you are interested in keeping your files available between both Windows and Ubuntu, it is important you do this now since it will be a bit cumbersome to do this after the fact.
    3. I suggest restarting your computer after you have done the above steps.
7. Create an SSH key.  Since I typically do most of my compute against on a server, always handy to go ahead and create a ssh key for more secure authentication.  `ssh-keygen -t rsa -C "[your-email]`.  Highly suggest including a password with your ssh-key as it provides an additional layer of security.
    1. You will more than likely need to adjust the permissions on both your `~/.ssh/config` file as well as your private key `~/.ssh/id_rsa`, you can do this with `chmod 600 ~/.ssh/config && chmod 400 ~/.ssh/id_rsa`
8. Before you can use VS Code in WSL, you will need to first open it up and install the WSL extension.  I also suggest checking out some of my other suggested extensions at [Suggested Extensions](#suggested-extensions) section.  Once you have WSL installed, you will be able to easily bring it up by changing to the directory you want to open it in and do `code .`.
   1. One important thing to note is that you will have to install extensions both within WSL as well as on Windows.
9. Next, we will install necessary Linux packages for development.  I suggest checking out my [1_setup_linux_packages.sh](ubuntu_scripts/1_setup_linux_packages.sh) script to see what packages I have included prior to running.  There will be a prompt mid-install so be sure to keep an eye out for it and select `Yes`.
10. With packages installed, I suggest upgrading your `.bashrc` with [Oh My BASH!](https://ohmybash.github.io/).  I have written a short script that will install Oh My Bash as well as echo sourcing your `.bashrc` into your `.bash_profile` at [2_setup_oh_my_bash.sh](ubuntu_scripts/2_setup_oh_my_bash.sh)
    1. There is also an [Oh My ZSH!](https://ohmyz.sh/) if you prefer zshell.
11. With all necessary packages installed and your `.bashrc` setup, you are now ready to setup Python! [pyenv](https://github.com/pyenv/pyenv) is my favorite method of managing different versions of python.  You can see the [3_setup_python.sh](ubuntu_scripts/3_setup_python.sh) for how to set it up.  To ensure your terminal has the updated settings, you should close and re-open it.
12. To setup docker, you can run the [4_setup_docker.sh](ubuntu_scripts/4_setup_docker.sh) which was pulled from [Setting up docker for windows and wsl to work flawlessly](https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly)
13. To seutp docker compose, run [5_setup_docker_compose.sh](ubuntu_scripts/5_setup_docker_compose.sh).
14. I like to use [BurnSushi/erd](https://github.com/BurntSushi/erd) for ERD diagrams, you can run [6_setup_erd.sh](ubuntu_scripts/6_setup_erd.sh) which will install Stack, a haskell compiler, and then install erd.

## Python Environment Management

After working with [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/) for a long time, I have opted recently to switch to using [venv](https://docs.python.org/3/library/venv.html) as it is simple to setup and use, no prior setup is necessary, and it works without fail.  Also, if you are using VS Code and you open VS Code up in your project directory, it will detect

1. To set it up, you will execute `python -m venv /path/to/project` which I suggest being collocated with your project.
2. To use, you will need to do the following:

```bash
cd /path/to/project
source /venv/bin/activate
```

Once you are done, to stop using the environment you just run `deactivate` and it will stop the environment.

## Using direnv to automate activating and deactivating environments

A handy utility to automate the activation and deactivation of environments is [direnv](https://github.com/direnv/direnv).  Once installed, you need to add the appropriate hook into your shell [https://github.com/direnv/direnv/blob/master/docs/hook.md](https://github.com/direnv/direnv/blob/master/docs/hook.md).  Once completed, you can then add a `.envrc` file to your projects and it will automatically activate and deactivate your venv environment.  This is what my [.envrc](ubuntu_config/.envrc) looks like.

## Using docker in WSL notes

So far, it has worked well but the one thing I have encountered that requires something special is in order to mount a volume, you will need to use a `--mount` with `type=bind` in order to get the volume to work.  See here for more information [https://docs.docker.com/storage/bind-mounts/](https://docs.docker.com/storage/bind-mounts/)

## Using Jupyter Notebook in WSL

When using a jupyter notebook in WSL, in order to allow for a notebook to autmoatically open in a browser, you will need to execute the notebook in combination with executable for your browser of choice.  See the [working_with_jupyter_notebooks.sh](ubuntu_config/working_with_jupyter_notebooks.sh) for some snippets on working with a jupyter notebook in chrome or firefox.

## Suggested-Extensions

* [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
* [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
* [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
* [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
* [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
* [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
* [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
* [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
* [GitHub Pull Requests](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github)
* [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)
* [Project Manager](https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager)

## Resources

* [Awesome-WSL](https://github.com/sirredbeard/Awesome-WSL) - This has been a great place for finding resources for WSL.
* [Jeremy Skinner Blog](https://jeremyskinner.co.uk/) - Posted a post around how to setup your WSL environment home to be mapped to your windows folder.
* [https://chocolatey.org/](https://chocolatey.org/) - Package management for Windows in PowerShell.
* [Windows Terminal](https://github.com/microsoft/terminal) - This has been my favorite terminal so far in Windows.
* [Nick Janetakis](https://nickjanetakis.com/) - Posted a blog about setting up and using docker.
