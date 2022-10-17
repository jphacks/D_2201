import datetime
from dateutil import relativedelta
import requests
import json
import pprint

url = 'https://www.jpmap-jaxa.jp/jpmap/api/v1/rect/'

lat_max = 34.8
lon_min = 135.4
lat_min = 34.4
lon_max = 135.8
today = datetime.date.today()
ty = today.strftime('%Y%m%d')

lastyear = today - relativedelta.relativedelta(years=1)
ly = lastyear.strftime('%Y%m%d')

params = {'product':'4',
          'interval':'3',
          'nlat': lat_max,
          'wlon': lon_min,
          'slat':lat_min,
          'elon':lon_max,
          'start':ly,
          'end': ty }
a = []
res = requests.get(url, params=params)
json_load = json.loads(res.text)


for k in range(0,13):
    if json_load['data'][k]['value'] == -9999:
        a.append(json_load['data'][k-1]['value'])
    
    else :
        a.append(json_load['data'][k]['value'])
        
    k = k + 1
    
aerosol_score = a[-1]/0.40
