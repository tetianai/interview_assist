import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopicsRecord extends FirestoreRecord {
  TopicsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  void _initializeFields() {}

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('topics');

  static Stream<TopicsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TopicsRecord.fromSnapshot(s));

  static Future<TopicsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TopicsRecord.fromSnapshot(s));

  static TopicsRecord fromSnapshot(DocumentSnapshot snapshot) => TopicsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TopicsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TopicsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TopicsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TopicsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTopicsRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class TopicsRecordDocumentEquality implements Equality<TopicsRecord> {
  const TopicsRecordDocumentEquality();

  @override
  bool equals(TopicsRecord? e1, TopicsRecord? e2) {
    return;
  }

  @override
  int hash(TopicsRecord? e) => const ListEquality().hash([]);

  @override
  bool isValidKey(Object? o) => o is TopicsRecord;
}
