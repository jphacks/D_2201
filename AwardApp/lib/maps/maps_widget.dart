import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart' as globals;
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({Key? key}) : super(key: key);

  @override
  _MapsWidgetState createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<List<dynamic>> _data = [];

  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/osaka-score.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });
  }

  Future<List<List>> csvImport() async {
    final String importPath = 'osaka-score.csv';
    final File importFile = File(importPath);
    List<List> importList = [];

    Stream fread = importFile.openRead();

    // Read lines one by one, and split each ','
    await fread.transform(utf8.decoder).transform(LineSplitter()).listen(
      (String line) {
        importList.add(line.split(','));
      },
    ).asFuture();

    return importList;
  }

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
                child: GoogleMaps.GoogleMap(
                  initialCameraPosition: GoogleMaps.CameraPosition(
                      //マップの初期位置を指定
                      zoom: 17, //ズーム
                      target: GoogleMaps.LatLng(
                          34.54919625630112, 135.5063116098694), //経度,緯度
                      tilt: 45.0, //上下の角度
                      bearing: 90.0), //指定した角度だけ回転する
                  mapType: GoogleMaps.MapType.hybrid,
                  markers: {
                    GoogleMaps.Marker(
                      markerId: (GoogleMaps.MarkerId('marker1')),
                      position: GoogleMaps.LatLng(
                          34.54919625630112, 135.5063116098694),
                      infoWindow:
                          GoogleMaps.InfoWindow(title: '日本のヘソ', snippet: 'ハム大'),
                    )
                  },

                  polygons: {
                    for (int i = 0; i < 1250; i++)
                      GoogleMaps.Polygon(
                          strokeColor: Colors.pink.withOpacity(0.8), //線の色
                          fillColor: Colors.pink.withOpacity(0.2), //塗りつぶし色
                          strokeWidth: 2, //線の太さ
                          points: [
                            //ポリゴンで囲う地点
                            GoogleMaps.LatLng(35.0, 135.0),
                            GoogleMaps.LatLng(35.0, 135.005),
                            GoogleMaps.LatLng(35.01, 134.999),
                            GoogleMaps.LatLng(35.01, 134.994),
                          ],
                          polygonId: GoogleMaps.PolygonId(
                            //一意なID
                            'polygon1',
                          ))
                  },
                  tileOverlays: {
                    GoogleMaps.TileOverlay(
                      //表示するタイルのProvider(別途作成する)
                      transparency: 0.5, //透過度0〜1
                      tileOverlayId:
                          GoogleMaps.TileOverlayId('overlay1'), //一意なID
                    )
                  },
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ToggleIcon(
                            onPressed: () async {
                              setState(() => FFAppState().MapSelect =
                                  !FFAppState().MapSelect);
                            },
                            value: FFAppState().MapSelect,
                            onIcon: Icon(
                              Icons.wb_sunny_outlined,
                              color: Color(0xFF95A1AC),
                              size: 20,
                            ),
                            offIcon: Icon(
                              Icons.wb_sunny,
                              color: Color(0xFF95A1AC),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ToggleIcon(
                            onPressed: () async {
                              setState(() => FFAppState().MapSelect =
                                  !FFAppState().MapSelect);
                            },
                            value: FFAppState().MapSelect,
                            onIcon: Icon(
                              Icons.star,
                              color: Color(0xFF95A1AC),
                              size: 20,
                            ),
                            offIcon: Icon(
                              Icons.star_outline,
                              color: Color(0xFF95A1AC),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (FFAppState().MapSelect)
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
              if (FFAppState().MapSelect == false)
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
            ],
          ),
        ),
      ),
    );
  }
}
