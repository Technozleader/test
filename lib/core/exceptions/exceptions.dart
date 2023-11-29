import 'package:equatable/equatable.dart';
import 'package:nesma/core/common/enum/exceptions_enum.dart';

class AppException extends Equatable implements Exception {
  final ExceptionCode code;
  final String? message;

  const AppException(this.code, {this.message});

  @override
  List<Object?> get props => [
        code,
        message,
      ];
}
