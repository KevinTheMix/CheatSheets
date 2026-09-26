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