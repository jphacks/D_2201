import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'amenitities_record.g.dart';

abstract class AmenititiesRecord
    implements Built<AmenititiesRecord, AmenititiesRecordBuilder> {
  static Serializer<AmenititiesRecord> get serializer =>
      _$amenititiesRecordSerializer;

  @BuiltValueField(wireName: 'AC')
  bool? get ac;

  @BuiltValueField(wireName: 'Heater')
  bool? get heater;

  @BuiltValueField(wireName: 'Pool')
  bool? get pool;

  @BuiltValueField(wireName: 'DogFriendly')
  bool? get dogFriendly;

  @BuiltValueField(wireName: 'Washer')
  bool? get washer;

  @BuiltValueField(wireName: 'Dryer')
  bool? get dryer;

  @BuiltValueField(wireName: 'Workout')
  bool? get workout;

  @BuiltValueField(wireName: 'Hip')
  bool? get hip;

  @BuiltValueField(wireName: 'NightLife')
  bool? get nightLife;

  DocumentReference? get propertyRef;

  bool? get extraOutlets;

  bool? get evCharger;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AmenititiesRecordBuilder builder) => builder
    ..ac = false
    ..heater = false
    ..pool = false
    ..dogFriendly = false
    ..washer = false
    ..dryer = false
    ..workout = false
    ..hip = false
    ..nightLife = false
    ..extraOutlets = false
    ..evCharger = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('amenitities');

  static Stream<AmenititiesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AmenititiesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AmenititiesRecord._();
  factory AmenititiesRecord([void Function(AmenititiesRecordBuilder) updates]) =
      _$AmenititiesRecord;

  static AmenititiesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAmenititiesRecordData({
  bool? ac,
  bool? heater,
  bool? pool,
  bool? dogFriendly,
  bool? washer,
  bool? dryer,
  bool? workout,
  bool? hip,
  bool? nightLife,
  DocumentReference? propertyRef,
  bool? extraOutlets,
  bool? evCharger,
}) {
  final firestoreData = serializers.toFirestore(
    AmenititiesRecord.serializer,
    AmenititiesRecord(
      (a) => a
        ..ac = ac
        ..heater = heater
        ..pool = pool
        ..dogFriendly = dogFriendly
        ..washer = washer
        ..dryer = dryer
        ..workout = workout
        ..hip = hip
        ..nightLife = nightLife
        ..propertyRef = propertyRef
        ..extraOutlets = extraOutlets
        ..evCharger = evCharger,
    ),
  );

  return firestoreData;
}
