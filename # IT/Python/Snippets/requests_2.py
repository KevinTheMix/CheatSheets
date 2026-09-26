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