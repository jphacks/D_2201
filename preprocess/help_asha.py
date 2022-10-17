import requests
import json
import pprint

url = 'https://www.jpmap-jaxa.jp/jpmap/api/v1/rect/'

params = {'product':'4',
          'interval':'3',
          'nlat':'34.8',
          'wlon':'135.4',
          'slat':'34.4',
          'elon':'135.8',
          'start':'20211001',
          'end':'20221001'}

res = requests.get(url, params=params)
data = json.loads(res.text)
pprint.pprint(data)