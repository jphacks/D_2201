import requests
import json
import pprint
import datetime 

lat = 0.0
lat = 35.6581
lng = 0.0
lng = 139.7414
dt_now = datetime.datetime.now()

day = datetime.date.today()
hour = dt_now.hour
min = dt_now.minute


print(day)
print(hour)
print(min)
for e in range(4):
    url = 'https://livlog.xyz/hoshimiru/constellation?lat='+str(lat)+'&lng='+str(lng)+'&date='+str(day)+'&hour='+str(hour)+'&min='+str(min)+'&id=&disp='
    res = requests.get(url)
    data = json.loads(res.text)
    json_load = json.loads(res.text)
    pprint.pprint(data)
    hour = hour + 2