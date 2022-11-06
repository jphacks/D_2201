import datetime
from dateutil import relativedelta
import requests
import json
import numpy as np

def remove_specified_values(arr, value):
    while value in arr:
        arr.remove(value)

url = 'https://www.jpmap-jaxa.jp/jpmap/api/v1/rect/' #aerpsplの光学的厚さのリクエストurl
today = datetime.date.today()
ty = today.strftime('%Y%m%d')

lastyear = today - relativedelta.relativedelta(years=1)
ly = lastyear.strftime('%Y%m%d')

poi = [23.6,24.0,123.4,123.8]

for i in range(54):  
   
   poi[0] = round(poi[0]+0.4, 1) 
   poi[1] = round(poi[1]+0.4, 1)  
   for j in range(55) : 
      poi[2] = round(poi[2]+0.4, 1)
      poi[3] = round(poi[3]+0.4, 1)
      lat_max = poi[3]
      lon_min = poi[0]
      lat_min = poi[2]
      lon_max = poi[1]
      lat_max_round = round(lat_max,1)
      lon_min_round = round(lon_min,1)
      lat_min_round = round(lat_min,1)
      lon_max_round = round(lon_max,1)
      params = {'product':'4',
                'interval':'3',
                'nlat': lat_max_round,
                'wlon': lon_min_round,
                'slat':lat_min_round,
                'elon':lon_max_round,
                'start':ly,
                'end': ty }
      print(poi)
      
      a = []

      
      print("lat_min_round = ",lat_min_round)
      print("lat_max_round = ",lat_max_round)
      print("lon_min_round = ",lon_min_round)
      print("lon_max_round = ",lon_max_round)
      
      res = requests.get(url, params=params)
      json_load = json.loads(res.text)
      for k in range(0,13):
            a.append(json_load['data'][k]['value'])
            k = k + 1
      remove_specified_values(a, -9999)
      aerosol_score = np.exp( -2.72 * a[-1])
      print(aerosol_score)
      a.clear
      
   poi[2] = 123.4
   poi[3] = 123.8
