import datetime
from re import L
from dateutil import relativedelta
import requests
import json
import numpy as np

poi = [34.4,34.8,135.4,135.8]
sepi = 50
di = (poi[1]-poi[0])/sepi
sepj = 50
dj = (poi[3]-poi[2])/sepj

snah = int(round((poi[1]-poi[0]) / 0.1, 0)) #エアロゾルデータ取得のための縦のデータ数
snaw = int(round((poi[3]-poi[2]) / 0.1, 0)) #エアロゾルデータ取得のための横のデータ数

print('snah = ',snah)
print('snaw = ',snaw)

url = 'https://www.jpmap-jaxa.jp/jpmap/api/v1/rect/' #aerpsplの光学的厚さのリクエストurl
today = datetime.date.today()
ty = today.strftime('%Y%m%d')

lastyear = today - relativedelta.relativedelta(years=1)
ly = lastyear.strftime('%Y%m%d')


aerosol_score = np.zeros((snah, snaw))

for k in range(snah):
    lat_min_round = poi[1] - 0.1* (k+1)
    lat_max_round = poi[1] -0.1* k
    for l in range(snaw):
        lon_min_round = poi[2] + 0.1* l
        lon_max_round = poi[2] + 0.1* (l + 1)
        
        params = {'product':'4',  
          'interval':'3',
          'nlat': lat_max_round,
          'wlon': lon_min_round,
          'slat':lat_min_round,
          'elon':lon_max_round,
          'start':ly,
          'end': ty }
    
        a = []
        res = requests.get(url, params=params)
        json_load = json.loads(res.text)
        for m in range(13):
            
            if json_load['data'][m]['value'] == -9999:
                a.append(json_load['data'][m-1]['value'])
            else:
                a.append(json_load['data'][m]['value']) 
            print(a)
        aerosol_score[k][l] = np.exp(-2.72 * a[-1])

print(aerosol_score)
