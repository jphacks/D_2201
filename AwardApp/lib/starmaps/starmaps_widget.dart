import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
                                ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color: Color(0x411D2429),
                                            offset: Offset(0, 1),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 1, 1, 1),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  'https://images.unsplash.com/photo-1574914629385-46448b767aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGF0dGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                                  width: 70,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 4, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '[星座名]',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .subtitle1
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF090F13),
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 8, 0),
                                                        child: AutoSizeText(
                                                          '解説',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF7C8791),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Icon(
                                                    Icons.north_east_sharp,
                                                    color: Color(0xFF57636C),
                                                    size: 48,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 4, 8),
                                                  child: Text(
                                                    '[方角]',
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF4B39EF),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
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
