import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'collected_stamps_record.g.dart';

abstract class CollectedStampsRecord
    implements Built<CollectedStampsRecord, CollectedStampsRecordBuilder> {
  static Serializer<CollectedStampsRecord> get serializer =>
      _$collectedStampsRecordSerializer;

  @BuiltValueField(wireName: 'StampName')
  String? get stampName;

  @BuiltValueField(wireName: 'StampDate')
  DateTime? get stampDate;

  @BuiltValueField(wireName: 'Stampmage')
  String? get stampmage;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CollectedStampsRecordBuilder builder) =>
      builder
        ..stampName = ''
        ..stampmage = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('CollectedStamps')
          : FirebaseFirestore.instance.collectionGroup('CollectedStamps');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('CollectedStamps').doc();

  static Stream<CollectedStampsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CollectedStampsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CollectedStampsRecord._();
  factory CollectedStampsRecord(
          [void Function(CollectedStampsRecordBuilder) updates]) =
      _$CollectedStampsRecord;

  static CollectedStampsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCollectedStampsRecordData({
  String? stampName,
  DateTime? stampDate,
  String? stampmage,
}) {
  final firestoreData = serializers.toFirestore(
    CollectedStampsRecord.serializer,
    CollectedStampsRecord(
      (c) => c
        ..stampName = stampName
        ..stampDate = stampDate
        ..stampmage = stampmage,
    ),
  );

  return firestoreData;
}
