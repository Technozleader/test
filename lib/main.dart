import 'package:flutter/material.dart';
import 'package:nesma/core/service_locator.dart';

import 'core/app.dart';

void main() {

  initServiceLocator();
  runApp( MyApp.instance);
}

