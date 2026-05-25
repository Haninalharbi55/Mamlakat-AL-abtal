// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizEntity {
  int get id => throw _privateConstructorUsedError;
  int get regionId => throw _privateConstructorUsedError;
  List<QuestionEntity> get questions => throw _privateConstructorUsedError;

  /// Create a copy of QuizEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizEntityCopyWith<QuizEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizEntityCopyWith<$Res> {
  factory $QuizEntityCopyWith(
          QuizEntity value, $Res Function(QuizEntity) then) =
      _$QuizEntityCopyWithImpl<$Res, QuizEntity>;
  @useResult
  $Res call({int id, int regionId, List<QuestionEntity> questions});
}

/// @nodoc
class _$QuizEntityCopyWithImpl<$Res, $Val extends QuizEntity>
    implements $QuizEntityCopyWith<$Res> {
  _$QuizEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? regionId = null,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizEntityImplCopyWith<$Res>
    implements $QuizEntityCopyWith<$Res> {
  factory _$$QuizEntityImplCopyWith(
          _$QuizEntityImpl value, $Res Function(_$QuizEntityImpl) then) =
      __$$QuizEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int regionId, List<QuestionEntity> questions});
}

/// @nodoc
class __$$QuizEntityImplCopyWithImpl<$Res>
    extends _$QuizEntityCopyWithImpl<$Res, _$QuizEntityImpl>
    implements _$$QuizEntityImplCopyWith<$Res> {
  __$$QuizEntityImplCopyWithImpl(
      _$QuizEntityImpl _value, $Res Function(_$QuizEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? regionId = null,
    Object? questions = null,
  }) {
    return _then(_$QuizEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as int,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionEntity>,
    ));
  }
}

/// @nodoc

class _$QuizEntityImpl implements _QuizEntity {
  const _$QuizEntityImpl(
      {required this.id,
      required this.regionId,
      required final List<QuestionEntity> questions})
      : _questions = questions;

  @override
  final int id;
  @override
  final int regionId;
  final List<QuestionEntity> _questions;
  @override
  List<QuestionEntity> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'QuizEntity(id: $id, regionId: $regionId, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, regionId,
      const DeepCollectionEquality().hash(_questions));

  /// Create a copy of QuizEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizEntityImplCopyWith<_$QuizEntityImpl> get copyWith =>
      __$$QuizEntityImplCopyWithImpl<_$QuizEntityImpl>(this, _$identity);
}

abstract class _QuizEntity implements QuizEntity {
  const factory _QuizEntity(
      {required final int id,
      required final int regionId,
      required final List<QuestionEntity> questions}) = _$QuizEntityImpl;

  @override
  int get id;
  @override
  int get regionId;
  @override
  List<QuestionEntity> get questions;

  /// Create a copy of QuizEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizEntityImplCopyWith<_$QuizEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
