import datetime
from dateutil import relativedelta
import requests
import json
import numpy as np

def remove_specified_values(arr, value):
    while value in arr:
        arr.remove(value)

poi = [33.6,38.0,134.0,137.0]
sepi = 50
di = (poi[1]-poi[0])/sepi
sepj = 50
dj = (poi[3]-poi[2])/sepj

url = 'https://www.jpmap-jaxa.jp/jpmap/api/v1/rect/' #aerpsplの光学的厚さのリクエストurl
today = datetime.date.today()
ty = today.strftime('%Y%m%d')

lastyear = today - relativedelta.relativedelta(years=1)
ly = lastyear.strftime('%Y%m%d')

for i in range(sepi):
    lat_min = poi[1] - di*(i+1)
    lat_max = poi[1] - di*i
    for j in range(sepj):
        building_score = 0
        lon_min = poi[2] + dj*j
        lon_max = poi[2] + dj*(j+1)
        
        if lat_min % 0.01 == 0.0:
            lat_min_round = lat_min
        else :
            lat_min_round = round(lat_min,1)
            
        if lat_max % 0.01 == 0.0:
            lat_max_round = lat_max
        else :
            lat_max_round = round(lat_max,1)
            
        if lat_max_round == lat_min_round :
            lat_max_round = lat_min_round + 0.1
            

        if lon_min % 0.01 == 0.0:
            lon_min_round = lon_min
        else :
            lon_min_round = round(lon_min,1)
            
        if lon_max % 0.01 == 0.0:
            lon_max_round = lon_max
        else :
            lon_max_round = round(lon_max,1)
            
        if lon_max_round == lon_min_round :
            lon_max_round = lon_min_round + 0.1
        
        ##エアロゾルスコア検出
        params = {'product':'4',
          'interval':'3',
          'nlat': lat_max_round,
          'wlon': lon_min_round,
          'slat':lat_min_round,
          'elon':lon_max_round,
          'start':ly,
          'end': ty }
        
        print("lat_min_round = ",lat_min_round)
        print("lat_max_round = ",lat_max_round)
        print("lon_min_round = ",lon_min_round)
        print("lon_max_round = ",lon_max_round)
        
        a=[]
        res = requests.get(url, params=params)
        json_load = json.loads(res.text)
        for k in range(0,13):
            a.append(json_load['data'][k]['value'])
            k = k + 1
        remove_specified_values(a, -9999)
        print(a)
        aerosol_score = np.exp( -2.72 * a[-1])
        print(aerosol_score)
        a.clear
