docker-compose was giving an error about `docker-credential-desktop` not existing.
- the error seems to be a credentials error
    - solution:
        - remove `"credsStore": "desktop"` from `~/.docker/config.json` in wsl
        - note: I also ran `docker-compose` in powershell.  This may have actually been the fix in the fact that it could have set the credentials correctly.  Don't expect this to be true but wanted to note it.
