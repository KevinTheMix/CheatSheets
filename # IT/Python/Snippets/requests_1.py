import requests
response = requests.get('https://isoapp1010.belgrid.net/', verify=False)

print('Got it!')
print(response.status_code)
print(response.text)
print(response.content)