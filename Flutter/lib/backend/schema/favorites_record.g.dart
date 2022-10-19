// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FavoritesRecord> _$favoritesRecordSerializer =
    new _$FavoritesRecordSerializer();

class _$FavoritesRecordSerializer
    implements StructuredSerializer<FavoritesRecord> {
  @override
  final Iterable<Type> types = const [FavoritesRecord, _$FavoritesRecord];
  @override
  final String wireName = 'FavoritesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FavoritesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.propatyRef;
    if (value != null) {
      result
        ..add('propatyRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.visited;
    if (value != null) {
      result
        ..add('visited')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.checkDate;
    if (value != null) {
      result
        ..add('checkDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  FavoritesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FavoritesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'propatyRef':
          result.propatyRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'visited':
          result.visited = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'checkDate':
          result.checkDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$FavoritesRecord extends FavoritesRecord {
  @override
  final DocumentReference<Object?>? propatyRef;
  @override
  final bool? visited;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DateTime? checkDate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FavoritesRecord([void Function(FavoritesRecordBuilder)? updates]) =>
      (new FavoritesRecordBuilder()..update(updates))._build();

  _$FavoritesRecord._(
      {this.propatyRef, this.visited, this.userRef, this.checkDate, this.ffRef})
      : super._();

  @override
  FavoritesRecord rebuild(void Function(FavoritesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FavoritesRecordBuilder toBuilder() =>
      new FavoritesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FavoritesRecord &&
        propatyRef == other.propatyRef &&
        visited == other.visited &&
        userRef == other.userRef &&
        checkDate == other.checkDate &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, propatyRef.hashCode), visited.hashCode),
                userRef.hashCode),
            checkDate.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FavoritesRecord')
          ..add('propatyRef', propatyRef)
          ..add('visited', visited)
          ..add('userRef', userRef)
          ..add('checkDate', checkDate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FavoritesRecordBuilder
    implements Builder<FavoritesRecord, FavoritesRecordBuilder> {
  _$FavoritesRecord? _$v;

  DocumentReference<Object?>? _propatyRef;
  DocumentReference<Object?>? get propatyRef => _$this._propatyRef;
  set propatyRef(DocumentReference<Object?>? propatyRef) =>
      _$this._propatyRef = propatyRef;

  bool? _visited;
  bool? get visited => _$this._visited;
  set visited(bool? visited) => _$this._visited = visited;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DateTime? _checkDate;
  DateTime? get checkDate => _$this._checkDate;
  set checkDate(DateTime? checkDate) => _$this._checkDate = checkDate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FavoritesRecordBuilder() {
    FavoritesRecord._initializeBuilder(this);
  }

  FavoritesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _propatyRef = $v.propatyRef;
      _visited = $v.visited;
      _userRef = $v.userRef;
      _checkDate = $v.checkDate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FavoritesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FavoritesRecord;
  }

  @override
  void update(void Function(FavoritesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FavoritesRecord build() => _build();

  _$FavoritesRecord _build() {
    final _$result = _$v ??
        new _$FavoritesRecord._(
            propatyRef: propatyRef,
            visited: visited,
            userRef: userRef,
            checkDate: checkDate,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
