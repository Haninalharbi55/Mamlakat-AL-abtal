// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegionEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  RegionStatus get status => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Create a copy of RegionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegionEntityCopyWith<RegionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionEntityCopyWith<$Res> {
  factory $RegionEntityCopyWith(
          RegionEntity value, $Res Function(RegionEntity) then) =
      _$RegionEntityCopyWithImpl<$Res, RegionEntity>;
  @useResult
  $Res call(
      {int id,
      String name,
      String nameEn,
      String description,
      RegionStatus status,
      String image});
}

/// @nodoc
class _$RegionEntityCopyWithImpl<$Res, $Val extends RegionEntity>
    implements $RegionEntityCopyWith<$Res> {
  _$RegionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameEn = null,
    Object? description = null,
    Object? status = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegionStatus,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegionEntityImplCopyWith<$Res>
    implements $RegionEntityCopyWith<$Res> {
  factory _$$RegionEntityImplCopyWith(
          _$RegionEntityImpl value, $Res Function(_$RegionEntityImpl) then) =
      __$$RegionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String nameEn,
      String description,
      RegionStatus status,
      String image});
}

/// @nodoc
class __$$RegionEntityImplCopyWithImpl<$Res>
    extends _$RegionEntityCopyWithImpl<$Res, _$RegionEntityImpl>
    implements _$$RegionEntityImplCopyWith<$Res> {
  __$$RegionEntityImplCopyWithImpl(
      _$RegionEntityImpl _value, $Res Function(_$RegionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameEn = null,
    Object? description = null,
    Object? status = null,
    Object? image = null,
  }) {
    return _then(_$RegionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegionStatus,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegionEntityImpl implements _RegionEntity {
  const _$RegionEntityImpl(
      {required this.id,
      required this.name,
      required this.nameEn,
      required this.description,
      required this.status,
      required this.image});

  @override
  final int id;
  @override
  final String name;
  @override
  final String nameEn;
  @override
  final String description;
  @override
  final RegionStatus status;
  @override
  final String image;

  @override
  String toString() {
    return 'RegionEntity(id: $id, name: $name, nameEn: $nameEn, description: $description, status: $status, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, nameEn, description, status, image);

  /// Create a copy of RegionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionEntityImplCopyWith<_$RegionEntityImpl> get copyWith =>
      __$$RegionEntityImplCopyWithImpl<_$RegionEntityImpl>(this, _$identity);
}

abstract class _RegionEntity implements RegionEntity {
  const factory _RegionEntity(
      {required final int id,
      required final String name,
      required final String nameEn,
      required final String description,
      required final RegionStatus status,
      required final String image}) = _$RegionEntityImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get nameEn;
  @override
  String get description;
  @override
  RegionStatus get status;
  @override
  String get image;

  /// Create a copy of RegionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionEntityImplCopyWith<_$RegionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
