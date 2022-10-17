import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

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
      body: FlutterMap(
        // マップ表示設定
        options: MapOptions(
          center: latLng.LatLng(35.681, 139.767),
          zoom: 14.0,
        ),
        layers: [
          //背景地図読み込み (Maptiler)
          TileLayerOptions(
            urlTemplate:
                'https://cyberjapandata.gsi.go.jp/xyz/std/{z}/{x}/{y}.png?key=[0b81cf4555b245a6ae3ff3af63c1665d]',
          ),
          // サークルマーカー設定
          CircleLayerOptions(
            circles: [
              // サークルマーカー1設定
              CircleMarker(
                color: Colors.indigo.withOpacity(0.9),
                radius: 10,
                borderColor: Colors.white.withOpacity(0.9),
                borderStrokeWidth: 3,
                point: latLng.LatLng(35.681, 139.760),
              ),
              // サークルマーカー2設定
              CircleMarker(
                color: Colors.teal.withOpacity(0.5),
                radius: 15,
                borderColor: Colors.white.withOpacity(0.5),
                borderStrokeWidth: 5,
                point: latLng.LatLng(35.685, 139.770),
              ),
              // サークルマーカー3設定
              CircleMarker(
                color: Colors.yellow.withOpacity(0.7),
                radius: 20,
                borderColor: Colors.white.withOpacity(0.7),
                borderStrokeWidth: 6,
                point: latLng.LatLng(35.687, 139.775),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
