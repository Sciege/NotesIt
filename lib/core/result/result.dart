// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:notes_it/core/error/failures.dart';
//
// part 'result.freezed.dart';
//
// class Result<T, F extends Failure> with _$Result<T, F> {
//   const factory Result(T value) = Success<T, F>;
//
//   const factory Result.failure(F failure) = Failure<T, F>;
// }
/// Review?
/// https://docs.flutter.dev/app-architecture/design-patterns/result
import 'package:notes_it/core/error/failures.dart';

sealed class Result<T> {
  const Result();

  factory Result.ok(T value) => Ok(value);

  factory Result.error(Failure failure) => Error(failure);
}

final class Ok<T> extends Result<T> {
  const Ok(this.value);

  final T value;
}

final class Error<T> extends Result<T> {
  const Error(this.failure);

  final Failure failure;
}
