// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collected_stamps_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CollectedStampsRecord> _$collectedStampsRecordSerializer =
    new _$CollectedStampsRecordSerializer();

class _$CollectedStampsRecordSerializer
    implements StructuredSerializer<CollectedStampsRecord> {
  @override
  final Iterable<Type> types = const [
    CollectedStampsRecord,
    _$CollectedStampsRecord
  ];
  @override
  final String wireName = 'CollectedStampsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CollectedStampsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.stampName;
    if (value != null) {
      result
        ..add('StampName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.stampDate;
    if (value != null) {
      result
        ..add('StampDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.stampmage;
    if (value != null) {
      result
        ..add('Stampmage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  CollectedStampsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CollectedStampsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'StampName':
          result.stampName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'StampDate':
          result.stampDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Stampmage':
          result.stampmage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$CollectedStampsRecord extends CollectedStampsRecord {
  @override
  final String? stampName;
  @override
  final DateTime? stampDate;
  @override
  final String? stampmage;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CollectedStampsRecord(
          [void Function(CollectedStampsRecordBuilder)? updates]) =>
      (new CollectedStampsRecordBuilder()..update(updates))._build();

  _$CollectedStampsRecord._(
      {this.stampName, this.stampDate, this.stampmage, this.ffRef})
      : super._();

  @override
  CollectedStampsRecord rebuild(
          void Function(CollectedStampsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectedStampsRecordBuilder toBuilder() =>
      new CollectedStampsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollectedStampsRecord &&
        stampName == other.stampName &&
        stampDate == other.stampDate &&
        stampmage == other.stampmage &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, stampName.hashCode), stampDate.hashCode),
            stampmage.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CollectedStampsRecord')
          ..add('stampName', stampName)
          ..add('stampDate', stampDate)
          ..add('stampmage', stampmage)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CollectedStampsRecordBuilder
    implements Builder<CollectedStampsRecord, CollectedStampsRecordBuilder> {
  _$CollectedStampsRecord? _$v;

  String? _stampName;
  String? get stampName => _$this._stampName;
  set stampName(String? stampName) => _$this._stampName = stampName;

  DateTime? _stampDate;
  DateTime? get stampDate => _$this._stampDate;
  set stampDate(DateTime? stampDate) => _$this._stampDate = stampDate;

  String? _stampmage;
  String? get stampmage => _$this._stampmage;
  set stampmage(String? stampmage) => _$this._stampmage = stampmage;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CollectedStampsRecordBuilder() {
    CollectedStampsRecord._initializeBuilder(this);
  }

  CollectedStampsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stampName = $v.stampName;
      _stampDate = $v.stampDate;
      _stampmage = $v.stampmage;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CollectedStampsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollectedStampsRecord;
  }

  @override
  void update(void Function(CollectedStampsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollectedStampsRecord build() => _build();

  _$CollectedStampsRecord _build() {
    final _$result = _$v ??
        new _$CollectedStampsRecord._(
            stampName: stampName,
            stampDate: stampDate,
            stampmage: stampmage,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
