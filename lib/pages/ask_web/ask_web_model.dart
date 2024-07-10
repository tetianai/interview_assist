import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'ask_web_widget.dart' show AskWebWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AskWebModel extends FlutterFlowModel<AskWebWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for url widget.
  FocusNode? urlFocusNode;
  TextEditingController? urlTextController;
  String? Function(BuildContext, String?)? urlTextControllerValidator;
  // Stores action output result for [Backend Call - API (webUpsert)] action in Button widget.
  ApiCallResponse? apiResultt6a;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatSessionsRecord? createdSession;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    urlFocusNode?.dispose();
    urlTextController?.dispose();
  }
}
