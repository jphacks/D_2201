// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constellation_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConstellationRecord> _$constellationRecordSerializer =
    new _$ConstellationRecordSerializer();

class _$ConstellationRecordSerializer
    implements StructuredSerializer<ConstellationRecord> {
  @override
  final Iterable<Type> types = const [
    ConstellationRecord,
    _$ConstellationRecord
  ];
  @override
  final String wireName = 'ConstellationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ConstellationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.altitude;
    if (value != null) {
      result
        ..add('altitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.confirmed;
    if (value != null) {
      result
        ..add('confirmed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.direction;
    if (value != null) {
      result
        ..add('direction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.drowing;
    if (value != null) {
      result
        ..add('drowing')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eclipticalFlag;
    if (value != null) {
      result
        ..add('eclipticalFlag')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.enName;
    if (value != null) {
      result
        ..add('enName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jpName;
    if (value != null) {
      result
        ..add('jpName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.origin;
    if (value != null) {
      result
        ..add('origin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ptolemyFlag;
    if (value != null) {
      result
        ..add('ptolemyFlag')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.roughly;
    if (value != null) {
      result
        ..add('roughly')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.starIcon;
    if (value != null) {
      result
        ..add('starIcon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.starImage;
    if (value != null) {
      result
        ..add('starImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.altitudeNum;
    if (value != null) {
      result
        ..add('altitudeNum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.directionNum;
    if (value != null) {
      result
        ..add('directionNum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  ConstellationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConstellationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'altitude':
          result.altitude = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'confirmed':
          result.confirmed = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'direction':
          result.direction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'drowing':
          result.drowing = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'eclipticalFlag':
          result.eclipticalFlag = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'enName':
          result.enName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'jpName':
          result.jpName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'origin':
          result.origin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ptolemyFlag':
          result.ptolemyFlag = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'roughly':
          result.roughly = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'starIcon':
          result.starIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'starImage':
          result.starImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'altitudeNum':
          result.altitudeNum = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'directionNum':
          result.directionNum = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$ConstellationRecord extends ConstellationRecord {
  @override
  final String? altitude;
  @override
  final String? confirmed;
  @override
  final String? content;
  @override
  final String? direction;
  @override
  final String? drowing;
  @override
  final String? eclipticalFlag;
  @override
  final String? enName;
  @override
  final String? id;
  @override
  final String? jpName;
  @override
  final String? origin;
  @override
  final String? ptolemyFlag;
  @override
  final String? roughly;
  @override
  final String? starIcon;
  @override
  final String? starImage;
  @override
  final double? altitudeNum;
  @override
  final double? directionNum;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ConstellationRecord(
          [void Function(ConstellationRecordBuilder)? updates]) =>
      (new ConstellationRecordBuilder()..update(updates))._build();

  _$ConstellationRecord._(
      {this.altitude,
      this.confirmed,
      this.content,
      this.direction,
      this.drowing,
      this.eclipticalFlag,
      this.enName,
      this.id,
      this.jpName,
      this.origin,
      this.ptolemyFlag,
      this.roughly,
      this.starIcon,
      this.starImage,
      this.altitudeNum,
      this.directionNum,
      this.ffRef})
      : super._();

  @override
  ConstellationRecord rebuild(
          void Function(ConstellationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConstellationRecordBuilder toBuilder() =>
      new ConstellationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConstellationRecord &&
        altitude == other.altitude &&
        confirmed == other.confirmed &&
        content == other.content &&
        direction == other.direction &&
        drowing == other.drowing &&
        eclipticalFlag == other.eclipticalFlag &&
        enName == other.enName &&
        id == other.id &&
        jpName == other.jpName &&
        origin == other.origin &&
        ptolemyFlag == other.ptolemyFlag &&
        roughly == other.roughly &&
        starIcon == other.starIcon &&
        starImage == other.starImage &&
        altitudeNum == other.altitudeNum &&
        directionNum == other.directionNum &&
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        altitude
                                                                            .hashCode),
                                                                    confirmed
                                                                        .hashCode),
                                                                content
                                                                    .hashCode),
                                                            direction.hashCode),
                                                        drowing.hashCode),
                                                    eclipticalFlag.hashCode),
                                                enName.hashCode),
                                            id.hashCode),
                                        jpName.hashCode),
                                    origin.hashCode),
                                ptolemyFlag.hashCode),
                            roughly.hashCode),
                        starIcon.hashCode),
                    starImage.hashCode),
                altitudeNum.hashCode),
            directionNum.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConstellationRecord')
          ..add('altitude', altitude)
          ..add('confirmed', confirmed)
          ..add('content', content)
          ..add('direction', direction)
          ..add('drowing', drowing)
          ..add('eclipticalFlag', eclipticalFlag)
          ..add('enName', enName)
          ..add('id', id)
          ..add('jpName', jpName)
          ..add('origin', origin)
          ..add('ptolemyFlag', ptolemyFlag)
          ..add('roughly', roughly)
          ..add('starIcon', starIcon)
          ..add('starImage', starImage)
          ..add('altitudeNum', altitudeNum)
          ..add('directionNum', directionNum)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ConstellationRecordBuilder
    implements Builder<ConstellationRecord, ConstellationRecordBuilder> {
  _$ConstellationRecord? _$v;

  String? _altitude;
  String? get altitude => _$this._altitude;
  set altitude(String? altitude) => _$this._altitude = altitude;

  String? _confirmed;
  String? get confirmed => _$this._confirmed;
  set confirmed(String? confirmed) => _$this._confirmed = confirmed;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _direction;
  String? get direction => _$this._direction;
  set direction(String? direction) => _$this._direction = direction;

  String? _drowing;
  String? get drowing => _$this._drowing;
  set drowing(String? drowing) => _$this._drowing = drowing;

  String? _eclipticalFlag;
  String? get eclipticalFlag => _$this._eclipticalFlag;
  set eclipticalFlag(String? eclipticalFlag) =>
      _$this._eclipticalFlag = eclipticalFlag;

  String? _enName;
  String? get enName => _$this._enName;
  set enName(String? enName) => _$this._enName = enName;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _jpName;
  String? get jpName => _$this._jpName;
  set jpName(String? jpName) => _$this._jpName = jpName;

  String? _origin;
  String? get origin => _$this._origin;
  set origin(String? origin) => _$this._origin = origin;

  String? _ptolemyFlag;
  String? get ptolemyFlag => _$this._ptolemyFlag;
  set ptolemyFlag(String? ptolemyFlag) => _$this._ptolemyFlag = ptolemyFlag;

  String? _roughly;
  String? get roughly => _$this._roughly;
  set roughly(String? roughly) => _$this._roughly = roughly;

  String? _starIcon;
  String? get starIcon => _$this._starIcon;
  set starIcon(String? starIcon) => _$this._starIcon = starIcon;

  String? _starImage;
  String? get starImage => _$this._starImage;
  set starImage(String? starImage) => _$this._starImage = starImage;

  double? _altitudeNum;
  double? get altitudeNum => _$this._altitudeNum;
  set altitudeNum(double? altitudeNum) => _$this._altitudeNum = altitudeNum;

  double? _directionNum;
  double? get directionNum => _$this._directionNum;
  set directionNum(double? directionNum) => _$this._directionNum = directionNum;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ConstellationRecordBuilder() {
    ConstellationRecord._initializeBuilder(this);
  }

  ConstellationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _altitude = $v.altitude;
      _confirmed = $v.confirmed;
      _content = $v.content;
      _direction = $v.direction;
      _drowing = $v.drowing;
      _eclipticalFlag = $v.eclipticalFlag;
      _enName = $v.enName;
      _id = $v.id;
      _jpName = $v.jpName;
      _origin = $v.origin;
      _ptolemyFlag = $v.ptolemyFlag;
      _roughly = $v.roughly;
      _starIcon = $v.starIcon;
      _starImage = $v.starImage;
      _altitudeNum = $v.altitudeNum;
      _directionNum = $v.directionNum;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConstellationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConstellationRecord;
  }

  @override
  void update(void Function(ConstellationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConstellationRecord build() => _build();

  _$ConstellationRecord _build() {
    final _$result = _$v ??
        new _$ConstellationRecord._(
            altitude: altitude,
            confirmed: confirmed,
            content: content,
            direction: direction,
            drowing: drowing,
            eclipticalFlag: eclipticalFlag,
            enName: enName,
            id: id,
            jpName: jpName,
            origin: origin,
            ptolemyFlag: ptolemyFlag,
            roughly: roughly,
            starIcon: starIcon,
            starImage: starImage,
            altitudeNum: altitudeNum,
            directionNum: directionNum,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
