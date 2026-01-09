# [Jupyter](https://jupyter.org)

## Glossary

* **Jupyter Notebook** = web-based REPL (read-eval-print loop) ordered document containing code, text (using Markdown), mathematics, plots and rich media, and encoded as a (_.ipynb_) JSON
* **JupyterHub** = multi-user server for Jupyter Notebooks
* **JupyterLab** = new (2018) web-based flexible GUI

## Code Samples

### Ping Method

```Python
import platform    # For getting the operating system name
import subprocess  # For executing a shell command

def ping(host):
    """
    Returns True if host (str) responds to a ping request.
    Remember that a host may not respond to a ping (ICMP) request even if the host name is valid.
    """
    param = '-n' if platform.system().lower()=='windows' else '-c'  # Option for the number of packets as a function of
    command = ['ping', param, '1', host]    # Builds the command (e.g.: "ping -c 1 google.com")
    return subprocess.call(command) == 0    # Executes the command.

ping('www.google.com')  # Calls the method
```

### DNS Resolve

```Python
import socket # https://docs.python.org/3/library/socket.html
data = socket.gethostbyname_ex('intranet.elia.be')
data = socket.gethostbyname_ex('isoapp1010.belgrid.net')
print ("\n\nThe IP Address of the Domain Name is: "+repr(data))  
```

### http.client

```Python
# Courtesy of https://stackoverflow.com/a/7000784

import os
from http.client import HTTPSConnection
from base64 import b64encode
#import http.client
import ssl
#import krbV

os.environ['PYTHONHTTPSVERIFY'] = '0' # https://stackoverflow.com/a/5971326
os.environ['REQUESTS_CA_BUNDLE'] = ''
os.environ['CURL_CA_BUNDLE'] = ''

c = HTTPSConnection("isoapp1010.belgrid.net", 443, timeout=5, context=ssl._create_unverified_context())
print('Connection prepared (but not linked)')

encodedLogin = b64encode(b"belgrid/kd0009:Starcraft1").decode("ISO-8859-1")
print(encodedLogin)

#headers = headers = { 'Authorization' : 'Negotiate' }
#headers = headers = { 'Authorization' : 'Basic %s' %  encodedLogin }
#c.request('GET', '/piwebapi')
#c.request('GET', '/piwebapi', headers=headers)
c.request('GET', '/', headers={ 'Authorization' : 'Basic %s' %  encodedLogin })
print('Request sent..')

res = c.getresponse() # get the response back
print('Response: .. ')
print(res)

# # at this point you could check the status etc

data = res.read() # this gets the page text
print(data)
```

### requests 1

```Python
import requests
response = requests.get('https://isoapp1010.belgrid.net/', verify=False)

print('Got it!')
print(response.status_code)
print(response.text)
print(response.content)
```

### requests 2

```Python
import requests
import os

os.environ['PYTHONHTTPSVERIFY'] = '0'
os.environ['REQUESTS_CA_BUNDLE'] = ''
os.environ['CURL_CA_BUNDLE'] = ''
print('environnement variables set')

response = requests.get('https://172.30.237.46/piwebapi', headers = { 'host' : 'picoresighttest' }, auth=('belgrid/kd0009', 'Starcraft1'), verify=False)
print('Got it!')
print(response.status_code)

print(response.headers["www-authenticate"])
print(response.text)
print(response.content)
```

### urlib.request 1

```Python
import urllib.request
#site = urllib.request.urlopen("https://picoresighttest/piwebapi/")
#content = site.read()
#print(content)
```

### urlib.request 2

```Python
import urllib.request
import ssl
#import certifi
import os

os.environ['PYTHONHTTPSVERIFY'] = '0'
os.environ['REQUESTS_CA_BUNDLE'] = ''
os.environ['CURL_CA_BUNDLE'] = ''

context = ssl._create_unverified_context()
#context = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
#context.verify_mode = ssl.CERT_REQUIRED
#context.load_verify_locations(certifi.where())
httpsHandler = urllib.request.HTTPSHandler(context = context)
manager = urllib.request.HTTPPasswordMgrWithDefaultRealm()
manager.add_password(None, 'https://isoapp1010.belgrid.net', 'kd0009', 'Starcraft1')
authHandler = urllib.request.HTTPBasicAuthHandler(manager)
opener = urllib.request.build_opener(httpsHandler, authHandler)
urllib.request.install_opener(opener)

print('Ready')

response = urllib.request.urlopen('https://isoapp1010.belgrid.net/piwebapi')
print(response.read())
```
