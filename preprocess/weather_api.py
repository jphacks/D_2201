import requests
import json
from datetime import datetime, timezone, timedelta

lat_max = 34.45
lon_min = 135.4
lat_min = 34.4
lon_max = 135.45

lat = str(0.5* (lat_max + lat_min))
lon = str(0.5* (lon_max + lon_min))
exclude = 'current,minutely,daily,alerts'
APIkey = '95cd7e2b3f4ca31997623bd2eb7bd0b4'
units = 'metric'

url= 'https://api.openweathermap.org/data/2.5/onecall?lat='+lat+'&lon='+lon+'&exclude='+exclude+'&appid='+APIkey+'&units='+units+'&lang=ja'

response = requests.get(url)
print(response)

JST = timezone(timedelta(hours=+9), 'JST')

for data in response.json()['hourly']:
    
    # 時刻をJSTに変換して取得
    dt = datetime.fromtimestamp(data['dt']).replace(tzinfo=timezone.utc).astimezone(tz=JST)
    time = dt.strftime('%Y-%m-%d %H:%M:%S')
    # その他のデータをkeyで指定して取得
    temp = data['temp']
    humidity = data['humidity']
    weather = data['weather'][0]['description']

    # 出力
    print(time,temp,humidity,weather)