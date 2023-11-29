import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nesma/core/common/enum/exceptions_enum.dart';
import 'package:nesma/core/common/models/model_base.dart';
import 'package:nesma/core/exceptions/exceptions.dart';

abstract class _Mapper {
  List<T> mapFromList<T extends Model>(
      List jsonList, T Function(Map json) toModel);

  T mapFromJson<T extends Model>(
      Map<String, dynamic> json, T Function(Map json) toModel);
}

class Mapper extends _Mapper {
  @override
  T mapFromJson<T extends Model>(Map<String, dynamic> json,
      T Function(Map<String, dynamic> json) toModel) {
    try {
      Logger().d("Mapping on json $json");
      Map<String, dynamic> convertedJson = json['data'] ?? {};
      return toModel(convertedJson);
    } catch (e) {
      Logger().e(e);
      throw AppException(
        ExceptionCode.mappingToModelException,
        message: e.toString(),
      );
    }
  }

  @override
  List<T> mapFromList<T extends Model>(
      List<dynamic> jsonList, T Function(Map json) toModel) {
    try {
      Logger().d("Mapping on list $jsonList");
      List<T> res = [];
      for (Map json in jsonList) {
        final convertingModel = toModel(json);
        res.add(convertingModel);
      }
      return res;
    } catch (e) {
      Logger().e(e);
      throw AppException(
        ExceptionCode.mappingToModelException,
        message: e.toString(),
      );
    }
  }

  static double toDouble(dynamic value) {
    if(value is num) {
      return value.toDouble();
    }else if(value is String) {
      return double.tryParse(value)??0.0;
    }else {
      return 0;
    }
  }
  static String toConvertedString(dynamic value) {
    if(value == null || value == 'null'){
      return '';
    }else if(value is String) {
      return value;
    }else {
      return "";
    }
  }

  static Color toColor(dynamic value) {
    if(value == null || value == 'null'){
      return Colors.transparent;
    }else if(value is String) {
      final rgbString = value.replaceAll(' ', '').split(',');
      final rgbInt = rgbString.map((e) => int.parse(e)).toList();
      return Color.fromRGBO(rgbInt[0], rgbInt[1], rgbInt[2], 1);
    }else {
      return Colors.transparent;
    }
  }
}
