from tqdm.notebook import tqdm
outfile = "osaka-data2score.geojson"
import pandas as pd
import csv
from geojson import Polygon
from geojson import Point, Feature, FeatureCollection, dump
import datetime
from dateutil import relativedelta
import requests
import json
import numpy as np

def remove_specified_values(arr, value):
    while value in arr:
        arr.remove(value)
        
poi = [33.6, 34.4, 134.6, 135.4]

for c in range(2):  
   
   poi[0] = round(poi[0]+0.8, 1) 
   poi[1] = round(poi[1]+0.8, 1)  
   for d in range(9) :  
      poi[2] = round(poi[2]+0.8, 1)
      poi[3] = round(poi[3]+0.8, 1)
      print(poi)
      
      PARAM = 600
      JLLfile = "https://jphacks.github.io/D_2201/data/JLL_Data_Osaka.csv"
      #JLLfile.encode("cp437").decode("utf-8")
      df = pd.read_csv(JLLfile, encoding="utf-8")
      longitudes= list(df.iloc[:,0])
      latitudes = list(df.iloc[:,1])
      buildings = list(df.iloc[:,20])
      def Point(building):
            
            if '小中規模' in  building :
                return 3 
            if '中層' in  building :
                return 5   
            elif '中高層' in building :
                return 5
            elif '中規模' in building :
                return 5
            elif '駅前商業地域' in building :
                return 5
            elif '高層' in building :
                return 10
            elif '大規模' in  building :
                return 10
            else: 
                return 1
            

        #print("score="+str(score)) #スコア出力
      sepi = 50
      di = (poi[1]-poi[0])/sepi
      sepj = 50
      dj = (poi[3]-poi[2])/sepj
      url = 'https://www.jpmap-jaxa.jp/jpmap/api/v1/rect/' #aerpsplの光学的厚さのリクエストurl
      today = datetime.date.today()
      ty = today.strftime('%Y%m%d')

      lastyear = today - relativedelta.relativedelta(years=1)
      ly = lastyear.strftime('%Y%m%d')

      snah = int(round((poi[1]-poi[0]) / 0.2, 0)) #エアロゾルデータ取得のための縦のデータ数
      snaw = int(round((poi[3]-poi[2]) / 0.2, 0)) #エアロゾルデータ取得のための横のデータ数

      url = 'https://www.jpmap-jaxa.jp/jpmap/api/v1/rect/' #aerpsplの光学的厚さのリクエストurl
      today = datetime.date.today()
      ty = today.strftime('%Y%m%d')

      lastyear = today - relativedelta.relativedelta(years=1)
      ly = lastyear.strftime('%Y%m%d')

      aerosol_score = np.zeros((snah, snaw))

      bar0 = tqdm(total=snah*snaw)
        #エアロゾルスコア
      for k in range(snah):
            lat_min_round = poi[1] - 0.2* (k+1)
            lat_max_round = poi[1] -0.2* k
            for l in range(snaw):
                lon_min_round = poi[2] + 0.2* l
                lon_max_round = poi[2] + 0.2* (l + 1)
                
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
                    if json_load['data'][m-1]['value'] == -9999:
                        a.append(json_load['data'][m-2]['value'])
                    else:
                        a.append(json_load['data'][m-1]['value'])
                
                remove_specified_values(a, -9999)
                bar0.update(1)
                aerosol_score[k][l] = np.exp(-2.72 * a[-1])
                

      print("all")
      bar = tqdm(total = sepi * sepj)
      ft_all = []
      for i in range(sepi):
            lat_min = poi[1] - di*(i+1)
            lat_max = poi[1] - di*i
            for j in range(sepj):
                building_score = 0
                lon_min = poi[2] + dj*j
                lon_max = poi[2] + dj*(j+1)
                geopoly = Polygon([[(lon_min, lat_min), (lon_min, lat_max), (lon_max, lat_max), (lon_max, lat_min)]])
                
            
                ##建物スコア計算
                for row in range (len(df)):
                    longitude= longitudes[row]
                    #address = df.iat[row,4]
                    #print(type(longitude))
                    ##画像の座標範囲に入っているか
                    if( lon_min <= longitude and  longitude<= lon_max): 
                        latitude= latitudes[row]
                        if( lat_min <= latitude and latitude<= lat_max):
                            building = buildings[row]
                            ##スコア割り当て
                            building_score = building_score + Point(building)
                        
                if i>=0 and i<=11:
                    m=0
                elif i>=12 and i<=24:
                    m=1
                elif i>=25 and i<=36:
                    m=2
                else:
                    m=3

                if j>=0 and j<=11:
                    n=0
                elif j>=12 and j<=24:
                    n=1
                elif j>=25 and j<=36:
                    n=2
                else:
                    n=3
                if(building_score>=PARAM):
                    bu_score = 0
                else:
                    bu_score = 1 - (building_score / PARAM)
                    
                prescore = bu_score *  aerosol_score[m][n]
                if np.isnan(prescore):
                    prescore = 0
                
                ft = Feature(geometry = geopoly, properties = {'score': prescore})
                ft_all.append(ft)
                bar.update(1)
      ft_colct = FeatureCollection(ft_all)
      with open(outfile, 'w') as f:
            dump(ft_colct, f, separators=(',', ':'))
