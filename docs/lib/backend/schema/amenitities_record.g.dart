// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amenitities_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AmenititiesRecord> _$amenititiesRecordSerializer =
    new _$AmenititiesRecordSerializer();

class _$AmenititiesRecordSerializer
    implements StructuredSerializer<AmenititiesRecord> {
  @override
  final Iterable<Type> types = const [AmenititiesRecord, _$AmenititiesRecord];
  @override
  final String wireName = 'AmenititiesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AmenititiesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.ac;
    if (value != null) {
      result
        ..add('AC')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.heater;
    if (value != null) {
      result
        ..add('Heater')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.pool;
    if (value != null) {
      result
        ..add('Pool')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.dogFriendly;
    if (value != null) {
      result
        ..add('DogFriendly')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.washer;
    if (value != null) {
      result
        ..add('Washer')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.dryer;
    if (value != null) {
      result
        ..add('Dryer')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.workout;
    if (value != null) {
      result
        ..add('Workout')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hip;
    if (value != null) {
      result
        ..add('Hip')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.nightLife;
    if (value != null) {
      result
        ..add('NightLife')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.propertyRef;
    if (value != null) {
      result
        ..add('propertyRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.extraOutlets;
    if (value != null) {
      result
        ..add('extraOutlets')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.evCharger;
    if (value != null) {
      result
        ..add('evCharger')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  AmenititiesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AmenititiesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'AC':
          result.ac = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Heater':
          result.heater = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Pool':
          result.pool = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'DogFriendly':
          result.dogFriendly = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Washer':
          result.washer = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Dryer':
          result.dryer = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Workout':
          result.workout = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Hip':
          result.hip = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'NightLife':
          result.nightLife = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'propertyRef':
          result.propertyRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'extraOutlets':
          result.extraOutlets = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'evCharger':
          result.evCharger = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$AmenititiesRecord extends AmenititiesRecord {
  @override
  final bool? ac;
  @override
  final bool? heater;
  @override
  final bool? pool;
  @override
  final bool? dogFriendly;
  @override
  final bool? washer;
  @override
  final bool? dryer;
  @override
  final bool? workout;
  @override
  final bool? hip;
  @override
  final bool? nightLife;
  @override
  final DocumentReference<Object?>? propertyRef;
  @override
  final bool? extraOutlets;
  @override
  final bool? evCharger;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AmenititiesRecord(
          [void Function(AmenititiesRecordBuilder)? updates]) =>
      (new AmenititiesRecordBuilder()..update(updates))._build();

  _$AmenititiesRecord._(
      {this.ac,
      this.heater,
      this.pool,
      this.dogFriendly,
      this.washer,
      this.dryer,
      this.workout,
      this.hip,
      this.nightLife,
      this.propertyRef,
      this.extraOutlets,
      this.evCharger,
      this.ffRef})
      : super._();

  @override
  AmenititiesRecord rebuild(void Function(AmenititiesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AmenititiesRecordBuilder toBuilder() =>
      new AmenititiesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AmenititiesRecord &&
        ac == other.ac &&
        heater == other.heater &&
        pool == other.pool &&
        dogFriendly == other.dogFriendly &&
        washer == other.washer &&
        dryer == other.dryer &&
        workout == other.workout &&
        hip == other.hip &&
        nightLife == other.nightLife &&
        propertyRef == other.propertyRef &&
        extraOutlets == other.extraOutlets &&
        evCharger == other.evCharger &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, ac.hashCode),
                                                    heater.hashCode),
                                                pool.hashCode),
                                            dogFriendly.hashCode),
                                        washer.hashCode),
                                    dryer.hashCode),
                                workout.hashCode),
                            hip.hashCode),
                        nightLife.hashCode),
                    propertyRef.hashCode),
                extraOutlets.hashCode),
            evCharger.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AmenititiesRecord')
          ..add('ac', ac)
          ..add('heater', heater)
          ..add('pool', pool)
          ..add('dogFriendly', dogFriendly)
          ..add('washer', washer)
          ..add('dryer', dryer)
          ..add('workout', workout)
          ..add('hip', hip)
          ..add('nightLife', nightLife)
          ..add('propertyRef', propertyRef)
          ..add('extraOutlets', extraOutlets)
          ..add('evCharger', evCharger)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AmenititiesRecordBuilder
    implements Builder<AmenititiesRecord, AmenititiesRecordBuilder> {
  _$AmenititiesRecord? _$v;

  bool? _ac;
  bool? get ac => _$this._ac;
  set ac(bool? ac) => _$this._ac = ac;

  bool? _heater;
  bool? get heater => _$this._heater;
  set heater(bool? heater) => _$this._heater = heater;

  bool? _pool;
  bool? get pool => _$this._pool;
  set pool(bool? pool) => _$this._pool = pool;

  bool? _dogFriendly;
  bool? get dogFriendly => _$this._dogFriendly;
  set dogFriendly(bool? dogFriendly) => _$this._dogFriendly = dogFriendly;

  bool? _washer;
  bool? get washer => _$this._washer;
  set washer(bool? washer) => _$this._washer = washer;

  bool? _dryer;
  bool? get dryer => _$this._dryer;
  set dryer(bool? dryer) => _$this._dryer = dryer;

  bool? _workout;
  bool? get workout => _$this._workout;
  set workout(bool? workout) => _$this._workout = workout;

  bool? _hip;
  bool? get hip => _$this._hip;
  set hip(bool? hip) => _$this._hip = hip;

  bool? _nightLife;
  bool? get nightLife => _$this._nightLife;
  set nightLife(bool? nightLife) => _$this._nightLife = nightLife;

  DocumentReference<Object?>? _propertyRef;
  DocumentReference<Object?>? get propertyRef => _$this._propertyRef;
  set propertyRef(DocumentReference<Object?>? propertyRef) =>
      _$this._propertyRef = propertyRef;

  bool? _extraOutlets;
  bool? get extraOutlets => _$this._extraOutlets;
  set extraOutlets(bool? extraOutlets) => _$this._extraOutlets = extraOutlets;

  bool? _evCharger;
  bool? get evCharger => _$this._evCharger;
  set evCharger(bool? evCharger) => _$this._evCharger = evCharger;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AmenititiesRecordBuilder() {
    AmenititiesRecord._initializeBuilder(this);
  }

  AmenititiesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ac = $v.ac;
      _heater = $v.heater;
      _pool = $v.pool;
      _dogFriendly = $v.dogFriendly;
      _washer = $v.washer;
      _dryer = $v.dryer;
      _workout = $v.workout;
      _hip = $v.hip;
      _nightLife = $v.nightLife;
      _propertyRef = $v.propertyRef;
      _extraOutlets = $v.extraOutlets;
      _evCharger = $v.evCharger;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AmenititiesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AmenititiesRecord;
  }

  @override
  void update(void Function(AmenititiesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AmenititiesRecord build() => _build();

  _$AmenititiesRecord _build() {
    final _$result = _$v ??
        new _$AmenititiesRecord._(
            ac: ac,
            heater: heater,
            pool: pool,
            dogFriendly: dogFriendly,
            washer: washer,
            dryer: dryer,
            workout: workout,
            hip: hip,
            nightLife: nightLife,
            propertyRef: propertyRef,
            extraOutlets: extraOutlets,
            evCharger: evCharger,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
