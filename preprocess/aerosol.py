import datetime
from dateutil import relativedelta
import requests
import json
import pprint

url = 'https://www.jpmap-jaxa.jp/jpmap/api/v1/rect/'

a = float(input("北側の緯度を入力してください\t>>"))
b = float(input("西側の経度を入力してください\t>>"))
c = float(input("南側の緯度を入力してください\t>>"))
d = float(input("東側の経度を入力してください\t>>"))

today = datetime.date.today()
ty = today.strftime('%Y%m%d')

lastyear = today - relativedelta.relativedelta(years=1)
ly = lastyear.strftime('%Y%m%d')

params = {'product':'4',
          'interval':'3',
          'nlat': a,
          'wlon': b,
          'slat':c,
          'elon':d,
          'start':ly,
          'end': ty }

res = requests.get(url, params=params)
data = json.loads(res.text)
pprint.pprint(data)
