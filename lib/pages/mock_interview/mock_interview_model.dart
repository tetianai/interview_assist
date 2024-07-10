import '/components/topic_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/flutter_flow/permissions_util.dart';
import 'mock_interview_widget.dart' show MockInterviewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class MockInterviewModel extends FlutterFlowModel<MockInterviewWidget> {
  ///  Local state fields for this page.

  bool showPlayer = false;

  bool isRecording = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  AudioRecorder? audioRecorder;
  String? recording;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for TopicNav component.
  late TopicNavModel topicNavModel;

  @override
  void initState(BuildContext context) {
    topicNavModel = createModel(context, () => TopicNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    topicNavModel.dispose();
  }
}
