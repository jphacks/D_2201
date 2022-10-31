import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePhotoWidget extends StatefulWidget {
  const ChangePhotoWidget({Key? key}) : super(key: key);

  @override
  _ChangePhotoWidgetState createState() => _ChangePhotoWidgetState();
}

class _ChangePhotoWidgetState extends State<ChangePhotoWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 600.ms,
          begin: Offset(0, 50),
          end: Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 600.ms,
          begin: 0.6,
          end: 1,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 600.ms,
          begin: Offset(0, 50),
          end: Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 600.ms,
          begin: 0.6,
          end: 1,
        ),
      ],
    ),
  };
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Color(0x35000000),
              offset: Offset(0, -2),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 40,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).grayIcon,
                      size: 24,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Text(
                        'Change Profile Photo',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    valueOrDefault<String>(
                      uploadedFileUrl,
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-property-finder-834ebu/assets/uxii7iwtqpy8/emptyAvatar@2x.png',
                    ),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      allowPhoto: true,
                      backgroundColor:
                          FlutterFlowTheme.of(context).tertiaryColor,
                      textColor: FlutterFlowTheme.of(context).darkText,
                      pickerFontFamily: 'Lexend Deca',
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => isMediaUploading = true);
                      var downloadUrls = <String>[];
                      try {
                        showUploadMessage(
                          context,
                          'Uploading file...',
                          showLoading: true,
                        );
                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        isMediaUploading = false;
                      }
                      if (downloadUrls.length == selectedMedia.length) {
                        setState(() => uploadedFileUrl = downloadUrls.first);
                        showUploadMessage(context, 'Success!');
                      } else {
                        setState(() {});
                        showUploadMessage(context, 'Failed to upload media');
                        return;
                      }
                    }
                  },
                  text: 'Upload Photo',
                  options: FFButtonOptions(
                    width: 150,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ).animateOnPageLoad(
                    animationsMap['buttonOnPageLoadAnimation1']!),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final usersUpdateData = createUsersRecordData(
                      photoUrl: uploadedFileUrl,
                    );
                    await currentUserReference!.update(usersUpdateData);
                  },
                  text: 'Save Photo',
                  options: FFButtonOptions(
                    width: 290,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ).animateOnPageLoad(
                    animationsMap['buttonOnPageLoadAnimation2']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
