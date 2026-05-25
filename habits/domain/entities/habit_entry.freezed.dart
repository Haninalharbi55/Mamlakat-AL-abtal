// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HabitEntry {
  HabitType get type => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitEntryCopyWith<HabitEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitEntryCopyWith<$Res> {
  factory $HabitEntryCopyWith(
          HabitEntry value, $Res Function(HabitEntry) then) =
      _$HabitEntryCopyWithImpl<$Res, HabitEntry>;
  @useResult
  $Res call({HabitType type, double value, String unit, DateTime date});
}

/// @nodoc
class _$HabitEntryCopyWithImpl<$Res, $Val extends HabitEntry>
    implements $HabitEntryCopyWith<$Res> {
  _$HabitEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
    Object? unit = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HabitType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitEntryImplCopyWith<$Res>
    implements $HabitEntryCopyWith<$Res> {
  factory _$$HabitEntryImplCopyWith(
          _$HabitEntryImpl value, $Res Function(_$HabitEntryImpl) then) =
      __$$HabitEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HabitType type, double value, String unit, DateTime date});
}

/// @nodoc
class __$$HabitEntryImplCopyWithImpl<$Res>
    extends _$HabitEntryCopyWithImpl<$Res, _$HabitEntryImpl>
    implements _$$HabitEntryImplCopyWith<$Res> {
  __$$HabitEntryImplCopyWithImpl(
      _$HabitEntryImpl _value, $Res Function(_$HabitEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
    Object? unit = null,
    Object? date = null,
  }) {
    return _then(_$HabitEntryImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HabitType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$HabitEntryImpl implements _HabitEntry {
  const _$HabitEntryImpl(
      {required this.type,
      required this.value,
      required this.unit,
      required this.date});

  @override
  final HabitType type;
  @override
  final double value;
  @override
  final String unit;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'HabitEntry(type: $type, value: $value, unit: $unit, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitEntryImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, value, unit, date);

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitEntryImplCopyWith<_$HabitEntryImpl> get copyWith =>
      __$$HabitEntryImplCopyWithImpl<_$HabitEntryImpl>(this, _$identity);
}

abstract class _HabitEntry implements HabitEntry {
  const factory _HabitEntry(
      {required final HabitType type,
      required final double value,
      required final String unit,
      required final DateTime date}) = _$HabitEntryImpl;

  @override
  HabitType get type;
  @override
  double get value;
  @override
  String get unit;
  @override
  DateTime get date;

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitEntryImplCopyWith<_$HabitEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
