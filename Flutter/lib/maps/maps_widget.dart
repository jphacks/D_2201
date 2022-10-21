import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
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
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
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
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FlutterMap(
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
                  ],
                ),
              ),
              if (FFAppState().MapSelect) // 天気フィルター
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
              if (FFAppState().MapSelect == false) //街の明かり
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
