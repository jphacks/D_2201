from dotenv import load_dotenv
load_dotenv()



from pyowm.owm import OWM
from pyowm.utils import formatting
from pyowm.utils.config import get_default_config
import time
import os

poi = [33.6,35.6,131.4,139.4]
outfile1 = os.getenv('DATA_PATH')+"cloud_latest.geojson"

import datetime
dt_now = datetime.datetime.now()
outfile0 = os.getenv('DATA_PATH')+"cloud_" + str(dt_now.year) +"-"+ str(dt_now.month) +"-"+ str(dt_now.day) +"-"+str(dt_now.hour)+".geojson"

#  PyOWMのコンフィグ設定
config_dict = get_default_config()
config_dict["language"] = "ja" # 取得データの言語設定

# PyOWMライブラリの初期化
owm = OWM(os.getenv('OWM_KEY'), config_dict)
mgr = owm.weather_manager()


from geojson import Polygon
from geojson import Point, Feature, FeatureCollection, dump
sepi = 10
di = (poi[1]-poi[0])/sepi
sepj = 40
dj = (poi[3]-poi[2])/sepj
ft_all = []
for i in range(sepi):
  lat_min = poi[1] - di*(i+1)
  lat_max = poi[1] - di*i
  for j in range(sepj):
    lon_min = poi[2] + dj*j
    lon_max = poi[2] + dj*(j+1)
    geopoly = Polygon([[(lon_min, lat_min), (lon_min, lat_max), (lon_max, lat_max), (lon_max, lat_min)]])
    lat = (lat_min + lat_max)/2
    lon = (lon_min + lon_max)/2
    w = mgr.weather_at_coords(lat, lon).weather 
    prescore = 100 - int(w.clouds)
    ft = Feature(geometry = geopoly, properties = {'score': prescore})
    ft_all.append(ft)
    time.sleep(1) #APIの制限に抵触しないように1秒待つ
    
ft_colct = FeatureCollection(ft_all)
with open(outfile0, 'w') as f:
    dump(ft_colct, f, separators=(',', ':'))
with open(outfile1, 'w') as f:
    dump(ft_colct, f, separators=(',', ':'))
  
#csv出力
import json
import pandas as pd
outfile1_csv =  os.getenv('DATA_PATH')+"cloud_latest.csv"

geojsondata = open(outfile1, 'r')
data = json.load(geojsondata)
scores = []
lat1 = []
lat2 = []
lon1 = []
lon2 = []
for apoly in data["features"]:
  scores.append(apoly["properties"]["score"])
  lats = set()
  lons = set()
  for point in apoly["geometry"]["coordinates"][0]:
    lats.add(point[1])
    lons.add(point[0])
  lats = sorted(list(lats))
  lons = sorted(list(lons))
  lat1.append(lats[0])
  lat2.append(lats[1])
  lon1.append(lons[0])
  lon2.append(lons[1])
df = pd.DataFrame()
df["scores"] = scores
df["lat1"] = lat1
df["lat2"] = lat2
df["lon1"] = lon1
df["lon2"] = lon2
df.to_csv(outfile1_csv,index=False)