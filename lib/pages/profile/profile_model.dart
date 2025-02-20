import '/auth/firebase_auth/auth_util.dart';
import '/components/edit_profile_widget.dart';
import '/components/topic_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
