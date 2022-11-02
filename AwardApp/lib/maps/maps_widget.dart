import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

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
                child: GoogleMaps.GoogleMap(
                  initialCameraPosition: GoogleMaps.CameraPosition(
                      //マップの初期位置を指定
                      zoom: 17, //ズーム
                      target: GoogleMaps.LatLng(35.0, 135.0), //経度,緯度
                      tilt: 45.0, //上下の角度
                      bearing: 90.0),
                  mapType: GoogleMaps.MapType.hybrid, //指定した角度だけ回転する
                  markers: {
                    GoogleMaps.Marker(
                      markerId: (GoogleMaps.MarkerId('marker1')),
                      position: GoogleMaps.LatLng(35.0, 135.0),
                      infoWindow: GoogleMaps.InfoWindow(
                          title: '日本のヘソ', snippet: '35度と135度の交点は日本のヘソ'),
                    )
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
