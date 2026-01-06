// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todolist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodolistState {
  List<Todolist> get todos => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodolistStateCopyWith<TodolistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodolistStateCopyWith<$Res> {
  factory $TodolistStateCopyWith(
          TodolistState value, $Res Function(TodolistState) then) =
      _$TodolistStateCopyWithImpl<$Res, TodolistState>;
  @useResult
  $Res call({List<Todolist> todos, bool isLoading, String? errorMessage});
}

/// @nodoc
class _$TodolistStateCopyWithImpl<$Res, $Val extends TodolistState>
    implements $TodolistStateCopyWith<$Res> {
  _$TodolistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todolist>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodolistStateImplCopyWith<$Res>
    implements $TodolistStateCopyWith<$Res> {
  factory _$$TodolistStateImplCopyWith(
          _$TodolistStateImpl value, $Res Function(_$TodolistStateImpl) then) =
      __$$TodolistStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Todolist> todos, bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$TodolistStateImplCopyWithImpl<$Res>
    extends _$TodolistStateCopyWithImpl<$Res, _$TodolistStateImpl>
    implements _$$TodolistStateImplCopyWith<$Res> {
  __$$TodolistStateImplCopyWithImpl(
      _$TodolistStateImpl _value, $Res Function(_$TodolistStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$TodolistStateImpl(
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todolist>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TodolistStateImpl implements _TodolistState {
  const _$TodolistStateImpl(
      {final List<Todolist> todos = const [],
      this.isLoading = false,
      this.errorMessage})
      : _todos = todos;

  final List<Todolist> _todos;
  @override
  @JsonKey()
  List<Todolist> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'TodolistState(todos: $todos, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodolistStateImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_todos), isLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodolistStateImplCopyWith<_$TodolistStateImpl> get copyWith =>
      __$$TodolistStateImplCopyWithImpl<_$TodolistStateImpl>(this, _$identity);
}

abstract class _TodolistState implements TodolistState {
  const factory _TodolistState(
      {final List<Todolist> todos,
      final bool isLoading,
      final String? errorMessage}) = _$TodolistStateImpl;

  @override
  List<Todolist> get todos;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$TodolistStateImplCopyWith<_$TodolistStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
