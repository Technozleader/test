import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

extension ContextEx on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  Future<void> pushNamed(String route, {dynamic arguments}) async {
    Logger().v("Pushing $route into stack with arguments $arguments");
    await Navigator.of(this).pushNamed(route, arguments: arguments);
  }

  Future<void> replaceAll(String routeName, {dynamic arguments}) async {
    Logger().v("Replacing all pages with $routeName into stack with arguments $arguments");
    await Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => route.settings.name == routeName,
      arguments: arguments,
    );
  }

  Future<void> pushReplacementNamed(String route, {dynamic arguments}) async {
    Logger().v("Replacing  page with $route into stack with arguments $arguments");
    await Navigator.of(this).pushReplacementNamed(route, arguments: arguments);
  }

  Future<void> pop() async {
    Logger().v("Pop <--");
    Navigator.of(this).pop();
  }
}
