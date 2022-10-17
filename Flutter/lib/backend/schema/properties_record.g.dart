// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PropertiesRecord> _$propertiesRecordSerializer =
    new _$PropertiesRecordSerializer();

class _$PropertiesRecordSerializer
    implements StructuredSerializer<PropertiesRecord> {
  @override
  final Iterable<Type> types = const [PropertiesRecord, _$PropertiesRecord];
  @override
  final String wireName = 'PropertiesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PropertiesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.propertyName;
    if (value != null) {
      result
        ..add('propertyName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.propertyDescription;
    if (value != null) {
      result
        ..add('propertyDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mainImage;
    if (value != null) {
      result
        ..add('mainImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.propertyLocation;
    if (value != null) {
      result
        ..add('propertyLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.propertyAddress;
    if (value != null) {
      result
        ..add('propertyAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isDraft;
    if (value != null) {
      result
        ..add('isDraft')
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
    value = object.propertyNeighborhood;
    if (value != null) {
      result
        ..add('propertyNeighborhood')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ratingSummary;
    if (value != null) {
      result
        ..add('ratingSummary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.taxRate;
    if (value != null) {
      result
        ..add('taxRate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.cleaningFee;
    if (value != null) {
      result
        ..add('cleaningFee')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.notes;
    if (value != null) {
      result
        ..add('notes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.minNightStay;
    if (value != null) {
      result
        ..add('minNightStay')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.lastUpdated;
    if (value != null) {
      result
        ..add('lastUpdated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.minNights;
    if (value != null) {
      result
        ..add('minNights')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isLive;
    if (value != null) {
      result
        ..add('isLive')
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
  PropertiesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PropertiesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'propertyName':
          result.propertyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'propertyDescription':
          result.propertyDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mainImage':
          result.mainImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'propertyLocation':
          result.propertyLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'propertyAddress':
          result.propertyAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isDraft':
          result.isDraft = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'propertyNeighborhood':
          result.propertyNeighborhood = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ratingSummary':
          result.ratingSummary = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'taxRate':
          result.taxRate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'cleaningFee':
          result.cleaningFee = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'notes':
          result.notes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'minNightStay':
          result.minNightStay = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'lastUpdated':
          result.lastUpdated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'minNights':
          result.minNights = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isLive':
          result.isLive = serializers.deserialize(value,
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

class _$PropertiesRecord extends PropertiesRecord {
  @override
  final String? propertyName;
  @override
  final String? propertyDescription;
  @override
  final String? mainImage;
  @override
  final LatLng? propertyLocation;
  @override
  final String? propertyAddress;
  @override
  final bool? isDraft;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? propertyNeighborhood;
  @override
  final double? ratingSummary;
  @override
  final int? price;
  @override
  final double? taxRate;
  @override
  final int? cleaningFee;
  @override
  final String? notes;
  @override
  final double? minNightStay;
  @override
  final DateTime? lastUpdated;
  @override
  final int? minNights;
  @override
  final bool? isLive;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PropertiesRecord(
          [void Function(PropertiesRecordBuilder)? updates]) =>
      (new PropertiesRecordBuilder()..update(updates))._build();

  _$PropertiesRecord._(
      {this.propertyName,
      this.propertyDescription,
      this.mainImage,
      this.propertyLocation,
      this.propertyAddress,
      this.isDraft,
      this.userRef,
      this.propertyNeighborhood,
      this.ratingSummary,
      this.price,
      this.taxRate,
      this.cleaningFee,
      this.notes,
      this.minNightStay,
      this.lastUpdated,
      this.minNights,
      this.isLive,
      this.ffRef})
      : super._();

  @override
  PropertiesRecord rebuild(void Function(PropertiesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PropertiesRecordBuilder toBuilder() =>
      new PropertiesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PropertiesRecord &&
        propertyName == other.propertyName &&
        propertyDescription == other.propertyDescription &&
        mainImage == other.mainImage &&
        propertyLocation == other.propertyLocation &&
        propertyAddress == other.propertyAddress &&
        isDraft == other.isDraft &&
        userRef == other.userRef &&
        propertyNeighborhood == other.propertyNeighborhood &&
        ratingSummary == other.ratingSummary &&
        price == other.price &&
        taxRate == other.taxRate &&
        cleaningFee == other.cleaningFee &&
        notes == other.notes &&
        minNightStay == other.minNightStay &&
        lastUpdated == other.lastUpdated &&
        minNights == other.minNights &&
        isLive == other.isLive &&
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
                                                                        $jc(
                                                                            0,
                                                                            propertyName
                                                                                .hashCode),
                                                                        propertyDescription
                                                                            .hashCode),
                                                                    mainImage
                                                                        .hashCode),
                                                                propertyLocation
                                                                    .hashCode),
                                                            propertyAddress
                                                                .hashCode),
                                                        isDraft.hashCode),
                                                    userRef.hashCode),
                                                propertyNeighborhood.hashCode),
                                            ratingSummary.hashCode),
                                        price.hashCode),
                                    taxRate.hashCode),
                                cleaningFee.hashCode),
                            notes.hashCode),
                        minNightStay.hashCode),
                    lastUpdated.hashCode),
                minNights.hashCode),
            isLive.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PropertiesRecord')
          ..add('propertyName', propertyName)
          ..add('propertyDescription', propertyDescription)
          ..add('mainImage', mainImage)
          ..add('propertyLocation', propertyLocation)
          ..add('propertyAddress', propertyAddress)
          ..add('isDraft', isDraft)
          ..add('userRef', userRef)
          ..add('propertyNeighborhood', propertyNeighborhood)
          ..add('ratingSummary', ratingSummary)
          ..add('price', price)
          ..add('taxRate', taxRate)
          ..add('cleaningFee', cleaningFee)
          ..add('notes', notes)
          ..add('minNightStay', minNightStay)
          ..add('lastUpdated', lastUpdated)
          ..add('minNights', minNights)
          ..add('isLive', isLive)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PropertiesRecordBuilder
    implements Builder<PropertiesRecord, PropertiesRecordBuilder> {
  _$PropertiesRecord? _$v;

  String? _propertyName;
  String? get propertyName => _$this._propertyName;
  set propertyName(String? propertyName) => _$this._propertyName = propertyName;

  String? _propertyDescription;
  String? get propertyDescription => _$this._propertyDescription;
  set propertyDescription(String? propertyDescription) =>
      _$this._propertyDescription = propertyDescription;

  String? _mainImage;
  String? get mainImage => _$this._mainImage;
  set mainImage(String? mainImage) => _$this._mainImage = mainImage;

  LatLng? _propertyLocation;
  LatLng? get propertyLocation => _$this._propertyLocation;
  set propertyLocation(LatLng? propertyLocation) =>
      _$this._propertyLocation = propertyLocation;

  String? _propertyAddress;
  String? get propertyAddress => _$this._propertyAddress;
  set propertyAddress(String? propertyAddress) =>
      _$this._propertyAddress = propertyAddress;

  bool? _isDraft;
  bool? get isDraft => _$this._isDraft;
  set isDraft(bool? isDraft) => _$this._isDraft = isDraft;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _propertyNeighborhood;
  String? get propertyNeighborhood => _$this._propertyNeighborhood;
  set propertyNeighborhood(String? propertyNeighborhood) =>
      _$this._propertyNeighborhood = propertyNeighborhood;

  double? _ratingSummary;
  double? get ratingSummary => _$this._ratingSummary;
  set ratingSummary(double? ratingSummary) =>
      _$this._ratingSummary = ratingSummary;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  double? _taxRate;
  double? get taxRate => _$this._taxRate;
  set taxRate(double? taxRate) => _$this._taxRate = taxRate;

  int? _cleaningFee;
  int? get cleaningFee => _$this._cleaningFee;
  set cleaningFee(int? cleaningFee) => _$this._cleaningFee = cleaningFee;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  double? _minNightStay;
  double? get minNightStay => _$this._minNightStay;
  set minNightStay(double? minNightStay) => _$this._minNightStay = minNightStay;

  DateTime? _lastUpdated;
  DateTime? get lastUpdated => _$this._lastUpdated;
  set lastUpdated(DateTime? lastUpdated) => _$this._lastUpdated = lastUpdated;

  int? _minNights;
  int? get minNights => _$this._minNights;
  set minNights(int? minNights) => _$this._minNights = minNights;

  bool? _isLive;
  bool? get isLive => _$this._isLive;
  set isLive(bool? isLive) => _$this._isLive = isLive;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PropertiesRecordBuilder() {
    PropertiesRecord._initializeBuilder(this);
  }

  PropertiesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _propertyName = $v.propertyName;
      _propertyDescription = $v.propertyDescription;
      _mainImage = $v.mainImage;
      _propertyLocation = $v.propertyLocation;
      _propertyAddress = $v.propertyAddress;
      _isDraft = $v.isDraft;
      _userRef = $v.userRef;
      _propertyNeighborhood = $v.propertyNeighborhood;
      _ratingSummary = $v.ratingSummary;
      _price = $v.price;
      _taxRate = $v.taxRate;
      _cleaningFee = $v.cleaningFee;
      _notes = $v.notes;
      _minNightStay = $v.minNightStay;
      _lastUpdated = $v.lastUpdated;
      _minNights = $v.minNights;
      _isLive = $v.isLive;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PropertiesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PropertiesRecord;
  }

  @override
  void update(void Function(PropertiesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PropertiesRecord build() => _build();

  _$PropertiesRecord _build() {
    final _$result = _$v ??
        new _$PropertiesRecord._(
            propertyName: propertyName,
            propertyDescription: propertyDescription,
            mainImage: mainImage,
            propertyLocation: propertyLocation,
            propertyAddress: propertyAddress,
            isDraft: isDraft,
            userRef: userRef,
            propertyNeighborhood: propertyNeighborhood,
            ratingSummary: ratingSummary,
            price: price,
            taxRate: taxRate,
            cleaningFee: cleaningFee,
            notes: notes,
            minNightStay: minNightStay,
            lastUpdated: lastUpdated,
            minNights: minNights,
            isLive: isLive,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
