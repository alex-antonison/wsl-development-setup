This is what I (Chad) know so far about aws-vault and hashicorp vault
## AWS-Vault
- this is a tool to help securely store your aws credentials (secret key and access key) in your dev environment
- the commands:
    - `aws-vault add <profile>`: asks for your aws credentials and stores them in an encrypted file
    - `aws-vault exec <profile> --session-ttl=8h --` : sets up the decryption and drops you in a sub-shell.  Credentials last for 8 hours.
    - `aws-vault exec <profile> --session-ttl=8h -- <command>` : will run the command for you with the credentials
## Vault
- this tool hooks into active directory to define what you have access to, such as aws databases
- the function, called `vault_token` in this directory logs you in and then sets the env variable.
