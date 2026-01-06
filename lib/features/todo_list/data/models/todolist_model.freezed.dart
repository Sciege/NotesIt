// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todolist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodolistModel _$TodolistModelFromJson(Map<String, dynamic> json) {
  return _TodolistModel.fromJson(json);
}

/// @nodoc
mixin _$TodolistModel {
  int get id => throw _privateConstructorUsedError;
  String get todoList => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodolistModelCopyWith<TodolistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodolistModelCopyWith<$Res> {
  factory $TodolistModelCopyWith(
          TodolistModel value, $Res Function(TodolistModel) then) =
      _$TodolistModelCopyWithImpl<$Res, TodolistModel>;
  @useResult
  $Res call({int id, String todoList, String description, bool isDone});
}

/// @nodoc
class _$TodolistModelCopyWithImpl<$Res, $Val extends TodolistModel>
    implements $TodolistModelCopyWith<$Res> {
  _$TodolistModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? todoList = null,
    Object? description = null,
    Object? isDone = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      todoList: null == todoList
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodolistModelImplCopyWith<$Res>
    implements $TodolistModelCopyWith<$Res> {
  factory _$$TodolistModelImplCopyWith(
          _$TodolistModelImpl value, $Res Function(_$TodolistModelImpl) then) =
      __$$TodolistModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String todoList, String description, bool isDone});
}

/// @nodoc
class __$$TodolistModelImplCopyWithImpl<$Res>
    extends _$TodolistModelCopyWithImpl<$Res, _$TodolistModelImpl>
    implements _$$TodolistModelImplCopyWith<$Res> {
  __$$TodolistModelImplCopyWithImpl(
      _$TodolistModelImpl _value, $Res Function(_$TodolistModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? todoList = null,
    Object? description = null,
    Object? isDone = null,
  }) {
    return _then(_$TodolistModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      todoList: null == todoList
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodolistModelImpl implements _TodolistModel {
  const _$TodolistModelImpl(
      {required this.id,
      required this.todoList,
      required this.description,
      required this.isDone});

  factory _$TodolistModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodolistModelImplFromJson(json);

  @override
  final int id;
  @override
  final String todoList;
  @override
  final String description;
  @override
  final bool isDone;

  @override
  String toString() {
    return 'TodolistModel(id: $id, todoList: $todoList, description: $description, isDone: $isDone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodolistModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.todoList, todoList) ||
                other.todoList == todoList) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, todoList, description, isDone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodolistModelImplCopyWith<_$TodolistModelImpl> get copyWith =>
      __$$TodolistModelImplCopyWithImpl<_$TodolistModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodolistModelImplToJson(
      this,
    );
  }
}

abstract class _TodolistModel implements TodolistModel {
  const factory _TodolistModel(
      {required final int id,
      required final String todoList,
      required final String description,
      required final bool isDone}) = _$TodolistModelImpl;

  factory _TodolistModel.fromJson(Map<String, dynamic> json) =
      _$TodolistModelImpl.fromJson;

  @override
  int get id;
  @override
  String get todoList;
  @override
  String get description;
  @override
  bool get isDone;
  @override
  @JsonKey(ignore: true)
  _$$TodolistModelImplCopyWith<_$TodolistModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
