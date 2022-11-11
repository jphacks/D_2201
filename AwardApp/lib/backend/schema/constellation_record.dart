import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'constellation_record.g.dart';

abstract class ConstellationRecord
    implements Built<ConstellationRecord, ConstellationRecordBuilder> {
  static Serializer<ConstellationRecord> get serializer =>
      _$constellationRecordSerializer;

  String? get altitude;

  String? get confirmed;

  String? get content;

  String? get direction;

  String? get drowing;

  String? get eclipticalFlag;

  String? get enName;

  String? get id;

  String? get jpName;

  String? get origin;

  String? get ptolemyFlag;

  String? get roughly;

  String? get starIcon;

  String? get starImage;

  double? get altitudeNum;

  double? get directionNum;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ConstellationRecordBuilder builder) => builder
    ..altitude = ''
    ..confirmed = ''
    ..content = ''
    ..direction = ''
    ..drowing = ''
    ..eclipticalFlag = ''
    ..enName = ''
    ..id = ''
    ..jpName = ''
    ..origin = ''
    ..ptolemyFlag = ''
    ..roughly = ''
    ..starIcon = ''
    ..starImage = ''
    ..altitudeNum = 0.0
    ..directionNum = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('constellation');

  static Stream<ConstellationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ConstellationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ConstellationRecord._();
  factory ConstellationRecord(
          [void Function(ConstellationRecordBuilder) updates]) =
      _$ConstellationRecord;

  static ConstellationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createConstellationRecordData({
  String? altitude,
  String? confirmed,
  String? content,
  String? direction,
  String? drowing,
  String? eclipticalFlag,
  String? enName,
  String? id,
  String? jpName,
  String? origin,
  String? ptolemyFlag,
  String? roughly,
  String? starIcon,
  String? starImage,
  double? altitudeNum,
  double? directionNum,
}) {
  final firestoreData = serializers.toFirestore(
    ConstellationRecord.serializer,
    ConstellationRecord(
      (c) => c
        ..altitude = altitude
        ..confirmed = confirmed
        ..content = content
        ..direction = direction
        ..drowing = drowing
        ..eclipticalFlag = eclipticalFlag
        ..enName = enName
        ..id = id
        ..jpName = jpName
        ..origin = origin
        ..ptolemyFlag = ptolemyFlag
        ..roughly = roughly
        ..starIcon = starIcon
        ..starImage = starImage
        ..altitudeNum = altitudeNum
        ..directionNum = directionNum,
    ),
  );

  return firestoreData;
}
