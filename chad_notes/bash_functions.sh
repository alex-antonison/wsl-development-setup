
function vault_auth () {
    export VAULT_TOKEN=`vault login -method=ldap -token-only=true username=<ActiveDirectoryUserName>`
    echo $VAULT_TOKEN >| $HOME/.vault_token
}

alias awsvault='aws-vault exec stratasan --session-ttl=8h --'
