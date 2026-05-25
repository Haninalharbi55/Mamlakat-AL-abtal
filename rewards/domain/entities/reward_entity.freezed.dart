// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RewardEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get titleEn => throw _privateConstructorUsedError;
  bool get earned => throw _privateConstructorUsedError;
  DateTime? get earnedDate => throw _privateConstructorUsedError;

  /// Create a copy of RewardEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardEntityCopyWith<RewardEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardEntityCopyWith<$Res> {
  factory $RewardEntityCopyWith(
          RewardEntity value, $Res Function(RewardEntity) then) =
      _$RewardEntityCopyWithImpl<$Res, RewardEntity>;
  @useResult
  $Res call(
      {int id,
      String title,
      String titleEn,
      bool earned,
      DateTime? earnedDate});
}

/// @nodoc
class _$RewardEntityCopyWithImpl<$Res, $Val extends RewardEntity>
    implements $RewardEntityCopyWith<$Res> {
  _$RewardEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? titleEn = null,
    Object? earned = null,
    Object? earnedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleEn: null == titleEn
          ? _value.titleEn
          : titleEn // ignore: cast_nullable_to_non_nullable
              as String,
      earned: null == earned
          ? _value.earned
          : earned // ignore: cast_nullable_to_non_nullable
              as bool,
      earnedDate: freezed == earnedDate
          ? _value.earnedDate
          : earnedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RewardEntityImplCopyWith<$Res>
    implements $RewardEntityCopyWith<$Res> {
  factory _$$RewardEntityImplCopyWith(
          _$RewardEntityImpl value, $Res Function(_$RewardEntityImpl) then) =
      __$$RewardEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String titleEn,
      bool earned,
      DateTime? earnedDate});
}

/// @nodoc
class __$$RewardEntityImplCopyWithImpl<$Res>
    extends _$RewardEntityCopyWithImpl<$Res, _$RewardEntityImpl>
    implements _$$RewardEntityImplCopyWith<$Res> {
  __$$RewardEntityImplCopyWithImpl(
      _$RewardEntityImpl _value, $Res Function(_$RewardEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RewardEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? titleEn = null,
    Object? earned = null,
    Object? earnedDate = freezed,
  }) {
    return _then(_$RewardEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleEn: null == titleEn
          ? _value.titleEn
          : titleEn // ignore: cast_nullable_to_non_nullable
              as String,
      earned: null == earned
          ? _value.earned
          : earned // ignore: cast_nullable_to_non_nullable
              as bool,
      earnedDate: freezed == earnedDate
          ? _value.earnedDate
          : earnedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$RewardEntityImpl implements _RewardEntity {
  const _$RewardEntityImpl(
      {required this.id,
      required this.title,
      required this.titleEn,
      required this.earned,
      required this.earnedDate});

  @override
  final int id;
  @override
  final String title;
  @override
  final String titleEn;
  @override
  final bool earned;
  @override
  final DateTime? earnedDate;

  @override
  String toString() {
    return 'RewardEntity(id: $id, title: $title, titleEn: $titleEn, earned: $earned, earnedDate: $earnedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleEn, titleEn) || other.titleEn == titleEn) &&
            (identical(other.earned, earned) || other.earned == earned) &&
            (identical(other.earnedDate, earnedDate) ||
                other.earnedDate == earnedDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, titleEn, earned, earnedDate);

  /// Create a copy of RewardEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardEntityImplCopyWith<_$RewardEntityImpl> get copyWith =>
      __$$RewardEntityImplCopyWithImpl<_$RewardEntityImpl>(this, _$identity);
}

abstract class _RewardEntity implements RewardEntity {
  const factory _RewardEntity(
      {required final int id,
      required final String title,
      required final String titleEn,
      required final bool earned,
      required final DateTime? earnedDate}) = _$RewardEntityImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get titleEn;
  @override
  bool get earned;
  @override
  DateTime? get earnedDate;

  /// Create a copy of RewardEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardEntityImplCopyWith<_$RewardEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
