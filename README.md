# Vault-Docker
Hashicorp Vault setup for docker 

## Initialization
This should only need to be run the first time.

#### Setup local host
1. Install vault on local host
2. Set VAULT_ADDR 
  * ```export VAULT_ADDR='http://vault_ip:8200'```

#### Get Keys
1. `vault init`
2. Copy keys and root token

#### Unseal (This must be done on every reboot)
1. `vault unseal`
2. Insert key 1
3. Repeat unseal command 2 more times putting in a different key each time.
4. Repeat until "Sealed: false" is in the reponse. (3 times)

#### Authenticate
1. `vault auth`
2. Insert "Initial Root Token"

#### Create New Token
1. `vault token-create`
2. Save new token to a safe place
