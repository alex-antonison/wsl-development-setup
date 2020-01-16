#!/bin/bash

# Install Hashicorp vault
wget https://releases.hashicorp.com/vault/1.2.3/vault_1.2.3_linux_amd64.zip -O vault.zip
unzip -d $HOME/.local/bin/ vault.zip
chmod +x $HOME/.local/bin/vault
rm vault.zip
# Install AWS Vault
wget https://github.com/99designs/aws-vault/releases/download/v4.6.4/aws-vault-linux-amd64 -O $HOME/.local/bin/aws-vault
chmod +x $HOME/.local/bin/aws-vault