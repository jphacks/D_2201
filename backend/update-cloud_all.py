from dotenv import load_dotenv
load_dotenv()
import os

from pyowm.owm import OWM
from pyowm.utils import formatting
from pyowm.utils.config import get_default_config
import time
from geojson import Polygon
from geojson import Point, Feature, FeatureCollection, dump
import pandas as pd


#  PyOWMのコンフィグ設定
config_dict = get_default_config()
config_dict["language"] = "ja" # 取得データの言語設定

# PyOWMライブラリの初期化
owm = OWM(os.getenv('OWM_KEY'), config_dict)
mgr = owm.weather_manager()

#区分けの元となるデータ。3,4は除外
csvlist = {
    'level1' : "https://jphacks.github.io/D_2201/data/building_all_level1.csv",
    'level2' : "https://jphacks.github.io/D_2201/data/building_all_level2.csv",
    #'level3' : "https://jphacks.github.io/D_2201/data/building_all_level3.csv",
    #'level4' : "https://jphacks.github.io/D_2201/data/building_all_level4.csv",
}

#timestamp設定
import datetime
dt_now = datetime.datetime.now()
timestamp = str(dt_now.year) +"-"+ str(dt_now.month) +"-"+ str(dt_now.day) +"-"+str(dt_now.hour)

#取得と出力
for level in csvlist.keys():
    outfilename_geojson0 = os.getenv('DATA_PATH') + "cloud_all_" + timestamp + "_" + level + ".geojson"
    outfilename_geojson1 = os.getenv('DATA_PATH') + "cloud_all_latest_" + level + ".geojson"
    outfilename_csv = os.getenv('DATA_PATH') + "cloud_all_latest_" + level + ".csv"
    df = pd.read_csv(csvlist[level])
    lat_min = list(df["lat1"])
    lat_max = list(df["lat2"])
    lon_min = list(df["lon1"])
    lon_max = list(df["lon2"])
    scores = []
    ft_all = []
    for i in range(len(lat_min)):
        geopoly = Polygon([[
            (lon_min[i], lat_min[i]),
            (lon_min[i], lat_max[i]),
            (lon_max[i], lat_max[i]),
            (lon_max[i], lat_min[i])
        ]])
        lat = (lat_min[i] + lat_max[i])/2
        lon = (lon_min[i] + lon_max[i])/2
        w = mgr.weather_at_coords(lat, lon).weather 
        prescore = 100 - int(w.clouds)
        scores.append(prescore)
        ft = Feature(geometry = geopoly, properties = {'score': prescore})
        ft_all.append(ft)
        time.sleep(1) #APIの制限に抵触しないように1秒待つ
    ft_colct = FeatureCollection(ft_all)
    with open(outfilename_geojson0, 'w') as f:
        dump(ft_colct, f, separators=(',', ':'))
    with open(outfilename_geojson1, 'w') as f:
        dump(ft_colct, f, separators=(',', ':'))
    df["score"] = scores
    df.to_csv(outfilename_csv,index=True)