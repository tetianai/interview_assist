import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    required this.sessionRef,
  });

  final DocumentReference? sessionRef;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    _model.askinputTextController ??= TextEditingController();
    _model.askinputFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
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
              context.safePop();
            },
          ),
          title: StreamBuilder<ChatSessionsRecord>(
            stream: ChatSessionsRecord.getDocument(widget!.sessionRef!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }

              final textChatSessionsRecord = snapshot.data!;

              return Text(
                textChatSessionsRecord.name,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              );
            },
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: StreamBuilder<List<FlowiseMessagesRecord>>(
                        stream: queryFlowiseMessagesRecord(
                          queryBuilder: (flowiseMessagesRecord) =>
                              flowiseMessagesRecord
                                  .where(
                                    'linked_session',
                                    isEqualTo: widget!.sessionRef,
                                  )
                                  .where(
                                    'linked_user',
                                    isEqualTo: currentUserReference,
                                  )
                                  .orderBy('created_time', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<FlowiseMessagesRecord>
                              listViewFlowiseMessagesRecordList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            reverse: true,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewFlowiseMessagesRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewFlowiseMessagesRecord =
                                  listViewFlowiseMessagesRecordList[
                                      listViewIndex];
                              return Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 16.0, 32.0, 16.0),
                                  child: Container(
                                    width: 500.0,
                                    constraints: BoxConstraints(
                                      maxWidth: 800.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          listViewFlowiseMessagesRecord.isUser
                                              ? Color(0x0057636C)
                                              : Color(0x8F57636C),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(36.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  listViewFlowiseMessagesRecord
                                                      .message,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    letterSpacing: 0.0,
                                                  ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
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
                        child: StreamBuilder<ChatSessionsRecord>(
                          stream: ChatSessionsRecord.getDocument(
                              widget!.sessionRef!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }

                            final columnChatSessionsRecord = snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 16.0),
                                  child: TextFormField(
                                    controller: _model.askinputTextController,
                                    focusNode: _model.askinputFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.askinputTextController',
                                      Duration(milliseconds: 500),
                                      () => setState(() {}),
                                    ),
                                    onFieldSubmitted: (_) async {
                                      var flowiseMessagesRecordReference1 =
                                          FlowiseMessagesRecord.collection
                                              .doc();
                                      await flowiseMessagesRecordReference1
                                          .set({
                                        ...createFlowiseMessagesRecordData(
                                          message: _model
                                              .askinputTextController.text,
                                          linkedUser: currentUserReference,
                                          isUser: true,
                                          linkedSession: widget!.sessionRef,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created_time':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.userMessageCopy =
                                          FlowiseMessagesRecord
                                              .getDocumentFromData({
                                        ...createFlowiseMessagesRecordData(
                                          message: _model
                                              .askinputTextController.text,
                                          linkedUser: currentUserReference,
                                          isUser: true,
                                          linkedSession: widget!.sessionRef,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created_time': DateTime.now(),
                                          },
                                        ),
                                      }, flowiseMessagesRecordReference1);
                                      _model.apiResultlqdCopy =
                                          await FlowiseGroup.universalQueryCall
                                              .call(
                                        question:
                                            _model.askinputTextController.text,
                                        namespace: columnChatSessionsRecord
                                            .queryNamespace,
                                      );

                                      if ((_model.apiResultlqdCopy?.succeeded ??
                                          true)) {
                                        setState(() {
                                          _model.askinputTextController
                                              ?.clear();
                                        });

                                        await FlowiseMessagesRecord.collection
                                            .doc()
                                            .set({
                                          ...createFlowiseMessagesRecordData(
                                            message: FlowiseGroup
                                                .universalQueryCall
                                                .response(
                                              (_model.apiResultlqdCopy
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            linkedUser: currentUserReference,
                                            isUser: false,
                                            linkedSession: widget!.sessionRef,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'created_time':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                      } else {
                                        await _model.userMessageCopy!.reference
                                            .delete();
                                      }

                                      setState(() {});
                                    },
                                    autofocus: true,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    textInputAction: TextInputAction.go,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Chat with AI',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Your questions here',
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
                                    validator: _model
                                        .askinputTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var flowiseMessagesRecordReference1 =
                                          FlowiseMessagesRecord.collection
                                              .doc();
                                      await flowiseMessagesRecordReference1
                                          .set({
                                        ...createFlowiseMessagesRecordData(
                                          message: _model
                                              .askinputTextController.text,
                                          linkedUser: currentUserReference,
                                          isUser: true,
                                          linkedSession: widget!.sessionRef,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created_time':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.userMessage = FlowiseMessagesRecord
                                          .getDocumentFromData({
                                        ...createFlowiseMessagesRecordData(
                                          message: _model
                                              .askinputTextController.text,
                                          linkedUser: currentUserReference,
                                          isUser: true,
                                          linkedSession: widget!.sessionRef,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created_time': DateTime.now(),
                                          },
                                        ),
                                      }, flowiseMessagesRecordReference1);
                                      _model.apiResultlqd = await FlowiseGroup
                                          .universalQueryCall
                                          .call(
                                        question:
                                            _model.askinputTextController.text,
                                        namespace: columnChatSessionsRecord
                                            .queryNamespace,
                                      );

                                      if ((_model.apiResultlqd?.succeeded ??
                                          true)) {
                                        setState(() {
                                          _model.askinputTextController
                                              ?.clear();
                                        });

                                        await FlowiseMessagesRecord.collection
                                            .doc()
                                            .set({
                                          ...createFlowiseMessagesRecordData(
                                            message: FlowiseGroup
                                                .universalQueryCall
                                                .response(
                                              (_model.apiResultlqd?.jsonBody ??
                                                  ''),
                                            ),
                                            linkedUser: currentUserReference,
                                            isUser: false,
                                            linkedSession: widget!.sessionRef,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'created_time':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                      } else {
                                        await _model.userMessage!.reference
                                            .delete();
                                      }

                                      setState(() {});
                                    },
                                    text: 'Ask',
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
                              ],
                            );
                          },
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
    );
  }
}
