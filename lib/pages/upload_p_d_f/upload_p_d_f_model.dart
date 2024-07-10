import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'upload_p_d_f_widget.dart' show UploadPDFWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadPDFModel extends FlutterFlowModel<UploadPDFWidget> {
  ///  Local state fields for this page.

  dynamic metaJSON;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for session_name widget.
  FocusNode? sessionNameFocusNode;
  TextEditingController? sessionNameTextController;
  String? Function(BuildContext, String?)? sessionNameTextControllerValidator;
  // Stores action output result for [Backend Call - API (pdfUpsert)] action in Button widget.
  ApiCallResponse? apiupsert;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatSessionsRecord? createdSessionPdf;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    sessionNameFocusNode?.dispose();
    sessionNameTextController?.dispose();
  }
}
