import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'topic_nav_model.dart';
export 'topic_nav_model.dart';

class TopicNavWidget extends StatefulWidget {
  const TopicNavWidget({super.key});

  @override
  State<TopicNavWidget> createState() => _TopicNavWidgetState();
}

class _TopicNavWidgetState extends State<TopicNavWidget> {
  late TopicNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopicNavModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FFButtonWidget(
            onPressed: () async {
              context.pushNamed('Home');
            },
            text: '',
            icon: FaIcon(
              FontAwesomeIcons.home,
            ),
            options: FFButtonOptions(
              padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    letterSpacing: 0.0,
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('Topic');
              },
              text: 'Lessons',
              icon: FaIcon(
                FontAwesomeIcons.bookOpen,
              ),
              options: FFButtonOptions(
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('Mock_Interview');
              },
              text: 'Interview',
              icon: FaIcon(
                FontAwesomeIcons.rocket,
              ),
              options: FFButtonOptions(
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('Study_Cards');
              },
              text: 'Cards',
              icon: FaIcon(
                FontAwesomeIcons.star,
              ),
              options: FFButtonOptions(
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 13.0,
                      letterSpacing: 0.0,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: FFButtonWidget(
                  onPressed: () async {},
                  text: '',
                  icon: Icon(
                    Icons.settings_sharp,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                              letterSpacing: 0.0,
                            ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
