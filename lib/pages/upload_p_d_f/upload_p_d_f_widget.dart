import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/topic_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upload_p_d_f_model.dart';
export 'upload_p_d_f_model.dart';

class UploadPDFWidget extends StatefulWidget {
  const UploadPDFWidget({super.key});

  @override
  State<UploadPDFWidget> createState() => _UploadPDFWidgetState();
}

class _UploadPDFWidgetState extends State<UploadPDFWidget> {
  late UploadPDFModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadPDFModel());

    _model.sessionNameTextController ??= TextEditingController();
    _model.sessionNameFocusNode ??= FocusNode();

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
            'Upload PDF for AI to analyse',
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
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: AlignmentDirectional(0.0, -1.0),
                  image: Image.asset(
                    'assets/images/Frame_186.jpg',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                  ),
                  if (_model.uploadedLocalFile != null &&
                      (_model.uploadedLocalFile.bytes?.isNotEmpty ?? false))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: FlutterFlowPdfViewer(
                        fileBytes: _model.uploadedLocalFile.bytes,
                        width: 320.0,
                        height: MediaQuery.sizeOf(context).height * 0.239,
                        horizontalScroll: true,
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 32.0),
                      child: Container(
                        constraints: BoxConstraints(
                          minWidth: 375.0,
                          maxWidth: 500.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.uploadedLocalFile != null &&
                                (_model.uploadedLocalFile.bytes?.isNotEmpty ??
                                    false))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 16.0),
                                child: TextFormField(
                                  controller: _model.sessionNameTextController,
                                  focusNode: _model.sessionNameFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.sessionNameTextController',
                                    Duration(milliseconds: 1000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  textInputAction: TextInputAction.go,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Name this PDF',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x93E0E3E7),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
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
                                  validator: _model
                                      .sessionNameTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            if ((valueOrDefault<bool>(
                                        currentUserDocument?.unlimitedAsk,
                                        false) ==
                                    true) ||
                                (valueOrDefault(
                                        currentUserDocument?.dittoTrials, 0) >
                                    0))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: (_model.sessionNameTextController
                                                    .text ==
                                                null ||
                                            _model.sessionNameTextController
                                                    .text ==
                                                '')
                                        ? null
                                        : () async {
                                            _model.apiupsert =
                                                await FlowiseGroup.pdfUpsertCall
                                                    .call(
                                              files: _model.uploadedLocalFile,
                                              metadata:
                                                  '{\"namespace\": \"${_model.sessionNameTextController.text}_${currentUserReference?.id}\"}',
                                            );

                                            if ((_model.apiupsert?.succeeded ??
                                                true)) {
                                              var chatSessionsRecordReference =
                                                  ChatSessionsRecord.collection
                                                      .doc();
                                              await chatSessionsRecordReference
                                                  .set({
                                                ...createChatSessionsRecordData(
                                                  linkedUser:
                                                      currentUserReference,
                                                  type: 'pdf',
                                                  queryNamespace:
                                                      '${_model.sessionNameTextController.text}_${currentUserReference?.id}',
                                                  name: _model
                                                      .sessionNameTextController
                                                      .text,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'upserted_date': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                              _model.createdSessionPdf =
                                                  ChatSessionsRecord
                                                      .getDocumentFromData({
                                                ...createChatSessionsRecordData(
                                                  linkedUser:
                                                      currentUserReference,
                                                  type: 'pdf',
                                                  queryNamespace:
                                                      '${_model.sessionNameTextController.text}_${currentUserReference?.id}',
                                                  name: _model
                                                      .sessionNameTextController
                                                      .text,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'upserted_date':
                                                        DateTime.now(),
                                                  },
                                                ),
                                              }, chatSessionsRecordReference);

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'ditto_trials':
                                                        FieldValue.increment(
                                                            -(1)),
                                                  },
                                                ),
                                              });

                                              context.goNamed(
                                                'Chat',
                                                queryParameters: {
                                                  'sessionRef': serializeParam(
                                                    _model.createdSessionPdf
                                                        ?.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'We are having trouble processing your document, please try again.'),
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
                                    text: 'Start Asking',
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
                                            color: FlutterFlowTheme.of(context)
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
                                      disabledColor: Color(0x3A57636C),
                                      disabledTextColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 0.0),
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
                                            color: FlutterFlowTheme.of(context)
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
                                      8.0, 8.0, 8.0, 16.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        final selectedFiles = await selectFiles(
                                          allowedExtensions: ['pdf'],
                                          multiFile: false,
                                        );
                                        if (selectedFiles != null) {
                                          setState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedFiles
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                        ))
                                                    .toList();
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedFiles.length) {
                                            setState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                            });
                                            showUploadMessage(
                                              context,
                                              'Success!',
                                            );
                                          } else {
                                            setState(() {});
                                            showUploadMessage(
                                              context,
                                              'Failed to upload file',
                                            );
                                            return;
                                          }
                                        }
                                      },
                                      text: 'Upload PDF',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 32.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x00F1F4F8),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 350.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.topicNavModel,
                      updateCallback: () => setState(() {}),
                      child: TopicNavWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
