import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatNamesRecord extends FirestoreRecord {
  CatNamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "suitable_for" field.
  String? _suitableFor;
  String get suitableFor => _suitableFor ?? '';
  bool hasSuitableFor() => _suitableFor != null;

  // "is_favorite" field.
  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;
  bool hasIsFavorite() => _isFavorite != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _suitableFor = snapshotData['suitable_for'] as String?;
    _isFavorite = snapshotData['is_favorite'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cat_names');

  static Stream<CatNamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CatNamesRecord.fromSnapshot(s));

  static Future<CatNamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CatNamesRecord.fromSnapshot(s));

  static CatNamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CatNamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CatNamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CatNamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CatNamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CatNamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCatNamesRecordData({
  String? name,
  String? suitableFor,
  bool? isFavorite,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'suitable_for': suitableFor,
      'is_favorite': isFavorite,
    }.withoutNulls,
  );

  return firestoreData;
}

class CatNamesRecordDocumentEquality implements Equality<CatNamesRecord> {
  const CatNamesRecordDocumentEquality();

  @override
  bool equals(CatNamesRecord? e1, CatNamesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.suitableFor == e2?.suitableFor &&
        e1?.isFavorite == e2?.isFavorite;
  }

  @override
  int hash(CatNamesRecord? e) =>
      const ListEquality().hash([e?.name, e?.suitableFor, e?.isFavorite]);

  @override
  bool isValidKey(Object? o) => o is CatNamesRecord;
}
