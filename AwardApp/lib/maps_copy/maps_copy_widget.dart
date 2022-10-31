import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapsCopyWidget extends StatefulWidget {
  const MapsCopyWidget({Key? key}) : super(key: key);

  @override
  _MapsCopyWidgetState createState() => _MapsCopyWidgetState();
}

class _MapsCopyWidgetState extends State<MapsCopyWidget> {
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
          'Astronomical observation',
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
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: SelectionArea(
              child: Text(
            '星座マップ',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Urbanist',
                  fontSize: 80,
                ),
          )),
        ),
      ),
    );
  }
}
