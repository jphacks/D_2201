import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:flutter/material.dart';
import 'package:open_weather_api_client/open_weather_api_client.dart';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

//import 'constants.dart' as k;
import 'dart:convert';

const OPEN_WEATHER_MAP_API_KEY = 'b458648f89ed5c73cf71c630a8f31e47';
const OPEN_WEATHER_MAP_DOMAIN = 'api.openweathermap.org';

void main(List<String> args) async {
  // Open Weather Mapへ通信開始

  var client = http.Client();
  var lat = 34.7055051; //緯度
  var long = 135.4983028; //経度
  var uri =
      'https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&appid=${OPEN_WEATHER_MAP_API_KEY}';
  //'${k.domain}lat=${lat}&lon=${long}&appid=${OPEN_WEATHER_MAP_API_KEY}';
  var url = Uri.parse(uri);
  var response = await client.get(url);
  if (response.statusCode == 200) {
    var data = response.body;
    print(data);
  } else {
    print(response.statusCode);
  }
}

class MapsWidget extends StatefulWidget {
  const MapsWidget({Key? key}) : super(key: key);

  @override
  _MapsWidgetState createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).dark600,
        automaticallyImplyLeading: false,
        title: Text(
          'MAP',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Urbanist',
                color: FlutterFlowTheme.of(context).tertiaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FlutterMap(
                  // マップ表示設定
                  options: MapOptions(
                    center: latLng.LatLng(34.7055051, 135.4983028),
                    zoom: 14.0,
                  ),

                  nonRotatedChildren: [
                    AttributionWidget.defaultWidget(
                      source: 'OpenStreetMap contributors',
                      onSourceTapped: null,
                    ),
                  ],

                  layers: [
                    //背景地図読み込み (Maptiler)
                    TileLayerOptions(
                      urlTemplate:
                          'https://cyberjapandata.gsi.go.jp/xyz/std/{z}/{x}/{y}.png?key=[0b81cf4555b245a6ae3ff3af63c1665d]',
                    ),

                    MarkerLayerOptions(
                      markers: [
                        Marker(
                          width: 100.0,
                          height: 100.0,
                          point: latLng.LatLng(
                              34.54721681342538, 135.50656910226675),
                          builder: (ctx) => Container(
                            child: FlutterLogo(),
                          ),
                        ),
                      ],
                    ),

                    CircleLayerOptions(
                      circles: [
                        // サークルマーカー1設定
                        if (FFAppState().MapSelect) // 街の明かり
                          CircleMarker(
                            color: Colors.indigo.withOpacity(0.9),
                            radius: 10,
                            borderColor: Colors.white.withOpacity(0.9),
                            borderStrokeWidth: 3,
                            point: latLng.LatLng(34.708, 135.498),
                          ),
                        // サークルマーカー2設定
                        if (FFAppState().MapSelect == false) // 天気フィルター
                          CircleMarker(
                            color: Colors.teal.withOpacity(0.5),
                            radius: 15,
                            borderColor: Colors.white.withOpacity(0.5),
                            borderStrokeWidth: 5,
                            point: latLng.LatLng(34.708, 135.5),
                          ),
                        // サークルマーカー3設定
                        CircleMarker(
                          color: Colors.yellow.withOpacity(0.7),
                          radius: 20,
                          borderColor: Colors.white.withOpacity(0.7),
                          borderStrokeWidth: 6,
                          point: latLng.LatLng(34.7055051, 135.4983028),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // 以下のブロックは動作確認用
              // セレクトボタンを押しなおして画像が変更されれば正常に動作してるのでマーカーorフィルターに問題あり
              //本番では削除
              if (FFAppState().MapSelect) // 街の明かり
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Image.network(
                      'https://picsum.photos/seed/777/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              if (FFAppState().MapSelect == false) // 天気フィルター
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(-0.91, -0.91),
                    child: Image.network(
                      'https://picsum.photos/seed/46/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              Align(
                alignment: AlignmentDirectional(0.8, 0.85),
                child: Container(
                  width: 40,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xFF1D2429),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ToggleIcon(
                        onPressed: () async {
                          setState(() =>
                              FFAppState().MapSelect = !FFAppState().MapSelect);
                        },
                        value: FFAppState().MapSelect,
                        onIcon: Icon(
                          Icons.wb_sunny_outlined,
                          color: Color(0xFF95A1AC),
                          size: 25,
                        ),
                        offIcon: Icon(
                          Icons.wb_sunny,
                          color: Color(0xFF95A1AC),
                          size: 25,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                        child: ToggleIcon(
                          onPressed: () async {
                            setState(() => FFAppState().MapSelect =
                                !FFAppState().MapSelect);
                          },
                          value: FFAppState().MapSelect,
                          onIcon: Icon(
                            Icons.star,
                            color: Color(0xFF95A1AC),
                            size: 25,
                          ),
                          offIcon: Icon(
                            Icons.star_outline,
                            color: Color(0xFF95A1AC),
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
