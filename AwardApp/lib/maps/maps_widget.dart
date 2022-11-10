import 'dart:async';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart' as globals;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:io';

class MapsWidget extends StatefulWidget {
  const MapsWidget({Key? key}) : super(key: key);

  @override
  _MapsWidgetState createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  /*Future<List<List>> csvImport() async {
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
  }*/

  Position? currentPosition;
  late GoogleMaps.GoogleMapController _controller;
  late StreamSubscription<Position> positionStream;
  //初期位置
  final GoogleMaps.CameraPosition _kGooglePlex =
      const GoogleMaps.CameraPosition(
          target: GoogleMaps.LatLng(34.54919625630112, 135.5063116098694),
          zoom: 17, //ズーム
          bearing: 0.0);

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high, //正確性:highはAndroid(0-100m),iOS(10m)
    distanceFilter: 100,
  );
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));

    //位置情報が許可されていない時に許可をリクエストする
    Future(() async {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }
    });

    //現在位置を更新し続ける
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      currentPosition = position;
      print(position == null
          ? 'Unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<List> csvlist = globals.csvlist;
    List<List> cloudslist = globals.cloudslist;
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
                  mapType: GoogleMaps.MapType.normal,
                  initialCameraPosition: GoogleMaps.CameraPosition(
                      //マップの初期位置を指定
                      zoom: 17, //ズーム
                      target: GoogleMaps.LatLng(
                          34.54919625630112, 135.5063116098694), //経度,緯度
                      bearing: 0.0),
                  myLocationEnabled: true, //現在位置をマップ上に表示
                  onMapCreated: (GoogleMaps.GoogleMapController controller) {
                    _controller = controller;
                  },
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
                    for (int i = 0; i < 2664; i++) //光量
                      GoogleMaps.Polygon(
                          strokeColor: Color.fromARGB(
                                  double.parse(csvlist[i][5]).round(),
                                  255,
                                  255 - double.parse(csvlist[i][5]).round(),
                                  0)
                              .withOpacity(double.parse(csvlist[i][5]).round() /
                                  255), //Colors.pink.withOpacity(0.8), //線の色
                          fillColor: Color.fromARGB(
                                  double.parse(csvlist[i][5]).round(),
                                  255,
                                  255 - double.parse(csvlist[i][5]).round(),
                                  0)
                              .withOpacity(double.parse(csvlist[i][5]).round() /
                                  255), // Colors.pink.withOpacity(0.2), //塗りつぶし色
                          strokeWidth: 2, //線の太さ
                          points: [
                            //ポリゴンで囲う地点
                            GoogleMaps.LatLng(double.parse(csvlist[i][2]),
                                double.parse(csvlist[i][4])),
                            GoogleMaps.LatLng(double.parse(csvlist[i][2]),
                                double.parse(csvlist[i][3])),
                            GoogleMaps.LatLng(double.parse(csvlist[i][1]),
                                double.parse(csvlist[i][3])),
                            GoogleMaps.LatLng(double.parse(csvlist[i][1]),
                                double.parse(csvlist[i][4])),
                          ],
                          polygonId: GoogleMaps.PolygonId(
                            //一意なID
                            'polygon1',
                          )),
                    for (int i = 0; i < 2664; i++) //雲部分 2664
                      GoogleMaps.Polygon(
                          strokeColor: Color.fromARGB(
                                  double.parse(cloudslist[i][5]).round(),
                                  255,
                                  255,
                                  255)
                              .withOpacity(double.parse(cloudslist[i][5])
                                      .round() /
                                  255), //Colors.pink.withOpacity(0.8), //線の色
                          fillColor: Color.fromARGB(
                                  double.parse(csvlist[i][5]).round(),
                                  255,
                                  255,
                                  255)
                              .withOpacity(double.parse(cloudslist[i][5])
                                      .round() /
                                  255), // Colors.pink.withOpacity(0.2), //塗りつぶし色
                          strokeWidth: 1, //線の太さ
                          points: [
                            //ポリゴンで囲う地点
                            GoogleMaps.LatLng(double.parse(cloudslist[i][2]),
                                double.parse(cloudslist[i][4])),
                            GoogleMaps.LatLng(double.parse(cloudslist[i][2]),
                                double.parse(cloudslist[i][3])),
                            GoogleMaps.LatLng(double.parse(cloudslist[i][1]),
                                double.parse(cloudslist[i][3])),
                            GoogleMaps.LatLng(double.parse(cloudslist[i][1]),
                                double.parse(cloudslist[i][4])),
                          ],
                          polygonId: GoogleMaps.PolygonId(
                            //一意なID
                            'polygon2',
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
            ],
          ),
        ),
      ),
    );
  }
}
