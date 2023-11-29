import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Failure extends Equatable {
  final String message;
  final String title;
  final Widget? errorWidget;

  const Failure({
    required this.message,
    required this.title,
    this.errorWidget,
  });

  @override
  List<Object?> get props => [
        message,
        title,
        errorWidget,
      ];
}
