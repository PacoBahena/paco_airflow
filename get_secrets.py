import os
import json
import requests

def get_secrets():

    url = os.path.join(os.environ['VAULT_AD'],'v1/auth/userpass/login',os.environ['VAULT_USER'])
    data =json.dumps({"password": os.environ['VAULT_PW']})
    r = requests.post(url,data=data)

    token = r.json()['auth']['client_token']
    url2 = os.path.join(os.environ['VAULT_AD'],'v1',os.environ['VAULT_DIR'])

    r2 = requests.get(os.path.join(os.environ['VAULT_AD'],'v1',os.environ['VAULT_DIR']),
                      headers={'X-Vault-Token':token})
    secrets = r2.json()['data']

    return secrets