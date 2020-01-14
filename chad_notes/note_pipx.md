- add `pipx`:
    - after setting up pyenv : `pip install pipx`
    - allows you to have global access to packages installed with pipx
    - pipx install:
        - docker-compose
        - pipenv
        - pgcli
- add to `~/.bashrc`:
```
# pipx
export PATH="$PATH:~/.local/bin"
```

