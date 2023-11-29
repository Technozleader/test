import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:nesma/core/common/enum/api_enums.dart';
import 'package:nesma/core/common/enum/exceptions_enum.dart';
import 'package:nesma/core/exceptions/exceptions.dart';
import 'package:nesma/features/account/parameters/signup_parameters.dart';
import 'package:nesma/features/profile/data/parameters/parameters.dart';
import 'package:path_provider/path_provider.dart';

part 'api_request.dart';

part 'api_parameters.dart';

part 'api_response.dart';

abstract class Api {
  Future<ApiResponse> request(ApiRequest request);

  Future<String> download(String url, [String fileName]);
}

class ApiImpl implements Api {
  final Dio dio = Dio();

  static ValueNotifier<double> downloadProgress = ValueNotifier(0);

  @override
  Future<ApiResponse> request(ApiRequest request) async {
    try {
      final Response response;
      FormData? formData;
      if (request.media != null) {
        final formDataMap = await request.toMultiPart();
        formData = FormData.fromMap(formDataMap);
      }
      final options = Options(
        headers: request.headers,
      );
      Logger().i(
        {
          "url": request.url,
          "method": request.requestType,
          "headers": request.headers,
          "body": request.body,
          "media": request.media,
          "params": request.params ?? {},
        },
      );
      switch (request.requestType) {
        case RequestType.get:
          response = await dio.get(
            request.url,
            data: formData,
            queryParameters: request.params,
            options: options,
          );
          break;
        case RequestType.post:
          response = await dio.post<Map<String, dynamic>>(
            request.url,
            data: formData,
            queryParameters: request.params,
            options: options,
          );
          break;
        case RequestType.put:
          response = await dio.put<Map<String, dynamic>>(
            request.url,
            data: formData,
            queryParameters: request.params,
            options: options,
          );
          break;
        case RequestType.delete:
          response = await dio.delete<Map<String, dynamic>>(
            request.url,
            data: formData,
            queryParameters: request.params,
            options: options,
          );
          break;
      }

      Logger().d({
        ...{
          'status': response.statusCode,
          "URL": request.url,
        },
        ...response.data ??
            {
              'data': null,
            },
      });
      return ApiResponse.fromResponse(response);
    } on DioException catch (e) {
      Logger().e(
        e,
      );
      throw DioException(
          response: e.response,
          message: e.response?.data['message'] ?? e.message,
          error: e.response?.data['message'] ?? e.message,
          requestOptions: e.requestOptions);
    } on Exception catch (e) {
      Logger().e(
        e,
      );
      rethrow;
    }
  }

  @override
  Future<String> download(String url, [String? fileName]) async {
    try {
      final savePath = (await getApplicationDocumentsDirectory()).path;
      Logger().i('downloading $url in $savePath/$fileName');
      await dio.download(
        url,
        "$savePath/${fileName ?? 'file'}",
        onReceiveProgress: (received, total) {
          downloadProgress.value = received / total;
          Logger(
              output: ConsoleOutput(),
              printer: PrettyPrinter(
                methodCount: 5,
                colors: false,
                printTime: false,
              )).i(
            '${downloadProgress.value}',
          );
        },
      );
      Logger(
          printer: PrettyPrinter(
        printTime: false,
      )).i(
        'downloading complete',
      );
      return savePath;
    } catch (e) {
      Logger().e(e);
      throw const AppException(ExceptionCode.downloadFailed);
    }
  }
}
