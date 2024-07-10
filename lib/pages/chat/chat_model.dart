import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  String answer =
      'Upload your PDF and ask any questions about the uploaded document';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for askinput widget.
  FocusNode? askinputFocusNode;
  TextEditingController? askinputTextController;
  String? Function(BuildContext, String?)? askinputTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in askinput widget.
  FlowiseMessagesRecord? userMessageCopy;
  // Stores action output result for [Backend Call - API (universalQuery)] action in askinput widget.
  ApiCallResponse? apiResultlqdCopy;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FlowiseMessagesRecord? userMessage;
  // Stores action output result for [Backend Call - API (universalQuery)] action in Button widget.
  ApiCallResponse? apiResultlqd;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    askinputFocusNode?.dispose();
    askinputTextController?.dispose();
  }
}
