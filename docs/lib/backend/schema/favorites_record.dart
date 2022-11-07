import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'favorites_record.g.dart';

abstract class FavoritesRecord
    implements Built<FavoritesRecord, FavoritesRecordBuilder> {
  static Serializer<FavoritesRecord> get serializer =>
      _$favoritesRecordSerializer;

  DocumentReference? get propatyRef;

  bool? get visited;

  DocumentReference? get userRef;

  DateTime? get checkDate;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FavoritesRecordBuilder builder) =>
      builder..visited = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favorites');

  static Stream<FavoritesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FavoritesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FavoritesRecord._();
  factory FavoritesRecord([void Function(FavoritesRecordBuilder) updates]) =
      _$FavoritesRecord;

  static FavoritesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFavoritesRecordData({
  DocumentReference? propatyRef,
  bool? visited,
  DocumentReference? userRef,
  DateTime? checkDate,
}) {
  final firestoreData = serializers.toFirestore(
    FavoritesRecord.serializer,
    FavoritesRecord(
      (f) => f
        ..propatyRef = propatyRef
        ..visited = visited
        ..userRef = userRef
        ..checkDate = checkDate,
    ),
  );

  return firestoreData;
}
