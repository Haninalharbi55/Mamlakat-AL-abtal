import '../error/exceptions.dart';
import '../error/failures.dart';

Failure mapExceptionToFailure(Exception exception) {
  if (exception is ServerException) {
    return ServerFailure(exception.message);
  } else if (exception is NetworkException) {
    return NetworkFailure(exception.message);
  } else if (exception is CacheException) {
    return CacheFailure(exception.message);
  } else if (exception is ValidationException) {
    return ValidationFailure(exception.message);
  } else if (exception is UnauthorizedException) {
    return UnauthorizedFailure(exception.message);
  } else {
    return ServerFailure('حدث خطأ غير متوقع');
  }
}

String getFailureMessage(Failure failure) {
  return failure.message;
}
