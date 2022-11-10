import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class StarmapsWidget extends StatefulWidget {
  const StarmapsWidget({Key? key}) : super(key: key);

  @override
  _StarmapsWidgetState createState() => _StarmapsWidgetState();
}

class _StarmapsWidgetState extends State<StarmapsWidget> {
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
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'starmaps',
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    labelColor: FlutterFlowTheme.of(context).turquoise,
                    unselectedLabelColor: FlutterFlowTheme.of(context).grayIcon,
                    labelStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w500,
                        ),
                    indicatorColor: FlutterFlowTheme.of(context).turquoise,
                    indicatorWeight: 4,
                    tabs: [
                      Tab(
                        text: 'starmap',
                      ),
                      Tab(
                        text: '星座(constellation)',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Stack(children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Transform.rotate(
                                      angle: 45 * pi / 180,
                                      child: Image.asset(
                                          'assets/images/EveryStarryNightPlanisphere_Jewelry_Disk_4000px.png'),
                                    ),
                                    SelectionArea(
                                        child: Text(
                                      '星座早見盤:Every Starry Night Planisphere ( hoshifuru.jp )',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    )),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Transform.rotate(
                                      angle: 0 * pi / 180,
                                      child: Image.asset(
                                          'assets/images/EveryStarryNightPlanisphere_Jewelry_Window_4000px.png'),
                                    ),
                                    SelectionArea(
                                        child: Text(
                                      '星座早見盤:Every Starry Night Planisphere ( hoshifuru.jp )',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    )),
                                  ],
                                ),
                              ])),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectionArea(
                                    child: Text(
                                  '星座早見盤:Every Starry Night Planisphere ( hoshifuru.jp )',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                )),
                                FlutterFlowWebView(
                                  url: '',
                                  bypass: false,
                                  height: 640,
                                  verticalScroll: false,
                                  horizontalScroll: false,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
