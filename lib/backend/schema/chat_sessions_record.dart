import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatSessionsRecord extends FirestoreRecord {
  ChatSessionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "linked_user" field.
  DocumentReference? _linkedUser;
  DocumentReference? get linkedUser => _linkedUser;
  bool hasLinkedUser() => _linkedUser != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "query_namespace" field.
  String? _queryNamespace;
  String get queryNamespace => _queryNamespace ?? '';
  bool hasQueryNamespace() => _queryNamespace != null;

  // "upserted_date" field.
  DateTime? _upsertedDate;
  DateTime? get upsertedDate => _upsertedDate;
  bool hasUpsertedDate() => _upsertedDate != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _linkedUser = snapshotData['linked_user'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _queryNamespace = snapshotData['query_namespace'] as String?;
    _upsertedDate = snapshotData['upserted_date'] as DateTime?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_sessions');

  static Stream<ChatSessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatSessionsRecord.fromSnapshot(s));

  static Future<ChatSessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatSessionsRecord.fromSnapshot(s));

  static ChatSessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatSessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatSessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatSessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatSessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatSessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatSessionsRecordData({
  DocumentReference? linkedUser,
  String? type,
  String? queryNamespace,
  DateTime? upsertedDate,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'linked_user': linkedUser,
      'type': type,
      'query_namespace': queryNamespace,
      'upserted_date': upsertedDate,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatSessionsRecordDocumentEquality
    implements Equality<ChatSessionsRecord> {
  const ChatSessionsRecordDocumentEquality();

  @override
  bool equals(ChatSessionsRecord? e1, ChatSessionsRecord? e2) {
    return e1?.linkedUser == e2?.linkedUser &&
        e1?.type == e2?.type &&
        e1?.queryNamespace == e2?.queryNamespace &&
        e1?.upsertedDate == e2?.upsertedDate &&
        e1?.name == e2?.name;
  }

  @override
  int hash(ChatSessionsRecord? e) => const ListEquality().hash(
      [e?.linkedUser, e?.type, e?.queryNamespace, e?.upsertedDate, e?.name]);

  @override
  bool isValidKey(Object? o) => o is ChatSessionsRecord;
}
