import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ask_web_model.dart';
export 'ask_web_model.dart';

class AskWebWidget extends StatefulWidget {
  const AskWebWidget({super.key});

  @override
  State<AskWebWidget> createState() => _AskWebWidgetState();
}

class _AskWebWidgetState extends State<AskWebWidget> {
  late AskWebModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AskWebModel());

    _model.urlTextController ??= TextEditingController(text: 'https://');
    _model.urlFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0x8714181B),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 32.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.goNamed(
                'Home',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                  ),
                },
              );
            },
          ),
          title: Text(
            'Provide URL for AI to analyse',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Frame_186.jpg',
              ).image,
            ),
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).secondaryText,
                FlutterFlowTheme.of(context).primaryText
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Container(
                      height: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 500.0,
                        maxHeight: 500.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if ((valueOrDefault<bool>(
                                        currentUserDocument?.unlimitedAsk,
                                        false) ==
                                    true) ||
                                (valueOrDefault(
                                        currentUserDocument?.dittoTrials, 0) >
                                    0))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 32.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => TextFormField(
                                    controller: _model.urlTextController,
                                    focusNode: _model.urlFocusNode,
                                    autofocus: true,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    textInputAction: TextInputAction.go,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'URL',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          'Insert target website with https://',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0x91E0E3E7),
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x93E0E3E7),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      filled: true,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.url,
                                    validator: _model.urlTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            if ((valueOrDefault<bool>(
                                        currentUserDocument?.unlimitedAsk,
                                        false) ==
                                    true) ||
                                (valueOrDefault(
                                        currentUserDocument?.dittoTrials, 0) >
                                    0))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 16.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        _model.apiResultt6a = await FlowiseGroup
                                            .webUpsertCall
                                            .call(
                                          url: _model.urlTextController.text,
                                          namespace:
                                              '${_model.urlTextController.text}_${currentUserReference?.id}',
                                        );

                                        if ((_model.apiResultt6a?.succeeded ??
                                            true)) {
                                          var chatSessionsRecordReference =
                                              ChatSessionsRecord.collection
                                                  .doc();
                                          await chatSessionsRecordReference
                                              .set({
                                            ...createChatSessionsRecordData(
                                              linkedUser: currentUserReference,
                                              type: 'web',
                                              queryNamespace:
                                                  '${_model.urlTextController.text}_${currentUserReference?.id}',
                                              name:
                                                  _model.urlTextController.text,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'upserted_date': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                          _model.createdSession =
                                              ChatSessionsRecord
                                                  .getDocumentFromData({
                                            ...createChatSessionsRecordData(
                                              linkedUser: currentUserReference,
                                              type: 'web',
                                              queryNamespace:
                                                  '${_model.urlTextController.text}_${currentUserReference?.id}',
                                              name:
                                                  _model.urlTextController.text,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'upserted_date': DateTime.now(),
                                              },
                                            ),
                                          }, chatSessionsRecordReference);

                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'ditto_trials':
                                                    FieldValue.increment(-(1)),
                                              },
                                            ),
                                          });

                                          context.goNamed(
                                            'Chat',
                                            queryParameters: {
                                              'sessionRef': serializeParam(
                                                _model
                                                    .createdSession?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                              ),
                                            },
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Please double check your link format'),
                                                content: Text(
                                                    'Our AI does not recognize your link or some unknown error occurred, please try again. We apologize for the inconvenience.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }

                                        setState(() {});
                                      },
                                      text: 'Analyse Website',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 36.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(999.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if ((valueOrDefault<bool>(
                                        currentUserDocument?.unlimitedAsk,
                                        false) !=
                                    true) &&
                                (valueOrDefault(
                                        currentUserDocument?.dittoTrials, 0) ==
                                    0))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 16.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {},
                                      text: 'Upgrade to Unlimited to continue',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 36.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(999.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
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
