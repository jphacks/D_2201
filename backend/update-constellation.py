from dotenv import load_dotenv
load_dotenv()
import os

#サーバーのタイムゾーンは、Asia/Tokyo (JST, +0900)に設定してください
import requests
import json
import datetime
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# firebaseのデータベース設定
cred = credentials.Certificate(os.getenv('FIREBASE_KEY_PATH'))
app = firebase_admin.initialize_app(cred) 
db = firestore.client()

# 地点の定義
city2pos = {
    #地点 : [lat,lon]
    #"hamudai": [34.5450379, 135.5066057],
    "sapporo" :[43.06417,141.34694],
    "sendai" : [35.85694,139.64889],
    "tokyo" : [35.68944,139.69167],
    "nagoya" : [35.18028,136.90667],
    "osaka" : [34.7338219, 135.5014056],
    "hiroshima" : [34.39639, 132.45944],
    "fukuoka" : [33.60639, 130.41806],
    "naha" : [26.231408, 127.685525]
}

# 時間の設定
dt_now = datetime.datetime.now()

day = datetime.date.today()
nowhour = dt_now.hour
hour = dt_now.hour + 1 # 時間の切り上げ
if(hour>=24):
  hour -= 24
if( hour>6 and hour<18): # 昼間の場合は日没時(18時)のデータを取得
  hour = 18
min =0

# データの取得とfirebaseへの書き込み
for city in ["tokyo"]:
    # 取得
    url = 'https://livlog.xyz/hoshimiru/constellation?lat='+str(city2pos[city][0])+'&lng='+str(city2pos[city][1])+'&date='+str(day)+'&hour='+str(hour)+'&min='+str(min)+'&id=&disp=off'
    res = requests.get(url)
    data = json.loads(res.text)
    stardata = {}
    '''
    for j in range(len(data['result'])):
        stardata[data['result'][j]['jpName']] = data['result'][j]['direction']
        print( data['result'][j])
        break
    print(city)
    print(stardata)
    '''
    output = {
        u'Name': city,
        u'update': dt_now.strftime('%Y-%m-%d ') + str(nowhour),
        u'time': dt_now.strftime('%Y-%m-%d ') + str(hour),
        u'latitude': city2pos[city][0],
        u'longitude': city2pos[city][1],
    }
    db.collection(u'ccity').document(city).set(output)
    notfound = set(range(1,89))
    for astar in range(len(data['result'])):
      db.collection(u'constellation').document(data['result'][astar]['id']).set(data['result'][astar])
      #db.collection(u'constellation').document(city).collection(u'constellation').document(data['result'][astar]['id']).set(data['result'][astar])
      notfound.remove(int(data['result'][astar]['id']))
    for astar in notfound:
      db.collection(u'constellation').document(str(astar)).delete()
      #db.collection(u'constellation').document(city).collection(u'constellation').document(str(astar)).delete()