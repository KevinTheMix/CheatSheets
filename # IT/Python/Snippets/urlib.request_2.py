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