import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlowiseMessagesRecord extends FirestoreRecord {
  FlowiseMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "linked_user" field.
  DocumentReference? _linkedUser;
  DocumentReference? get linkedUser => _linkedUser;
  bool hasLinkedUser() => _linkedUser != null;

  // "is_user" field.
  bool? _isUser;
  bool get isUser => _isUser ?? false;
  bool hasIsUser() => _isUser != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "linked_session" field.
  DocumentReference? _linkedSession;
  DocumentReference? get linkedSession => _linkedSession;
  bool hasLinkedSession() => _linkedSession != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _linkedUser = snapshotData['linked_user'] as DocumentReference?;
    _isUser = snapshotData['is_user'] as bool?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _linkedSession = snapshotData['linked_session'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('flowise_messages');

  static Stream<FlowiseMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FlowiseMessagesRecord.fromSnapshot(s));

  static Future<FlowiseMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FlowiseMessagesRecord.fromSnapshot(s));

  static FlowiseMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FlowiseMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FlowiseMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FlowiseMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FlowiseMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FlowiseMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFlowiseMessagesRecordData({
  String? message,
  DocumentReference? linkedUser,
  bool? isUser,
  DateTime? createdTime,
  DocumentReference? linkedSession,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'linked_user': linkedUser,
      'is_user': isUser,
      'created_time': createdTime,
      'linked_session': linkedSession,
    }.withoutNulls,
  );

  return firestoreData;
}

class FlowiseMessagesRecordDocumentEquality
    implements Equality<FlowiseMessagesRecord> {
  const FlowiseMessagesRecordDocumentEquality();

  @override
  bool equals(FlowiseMessagesRecord? e1, FlowiseMessagesRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.linkedUser == e2?.linkedUser &&
        e1?.isUser == e2?.isUser &&
        e1?.createdTime == e2?.createdTime &&
        e1?.linkedSession == e2?.linkedSession;
  }

  @override
  int hash(FlowiseMessagesRecord? e) => const ListEquality().hash(
      [e?.message, e?.linkedUser, e?.isUser, e?.createdTime, e?.linkedSession]);

  @override
  bool isValidKey(Object? o) => o is FlowiseMessagesRecord;
}
