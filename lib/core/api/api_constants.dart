import 'package:atmosfer/core/system/system_controller.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class APIConstants {
  static const String url = "http://185.126.217.205:8080/api";

  static String get getRegisterUrl => "$url/account-service/v1/users";
  static String get getLoginUrl => "$url/account-service/v1/token";
  static String get getPasswordResetUrl => "$url/account-service/v1/users/password-reset";
  static String get getJobsUrl => "$url/advertisement-service/v1/advertisements/summary/open";
  static String get getJobDetailUrl => "$url/advertisement-service/v1/advertisements/<id>";
  static String get getJobApplyUrl => "$url/advertisement-service/v1/advertisements/<id>/apply";

  static Future<dio.Response<dynamic>> sendPost(
    String path, {
    data,
    Map<String, dynamic>? queryHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    final systemController = Get.find<SystemController>();
    Map<String, dynamic> headers = {
      "x-is-mobile": true,
    };

    if (systemController.loginResponseModel != null) {
      headers["authorization"] = "Bearer ${systemController.loginResponseModel!.accessToken}";
    }

    if (queryHeaders != null) {
      for (var element in queryHeaders.keys) {
        if (!headers.containsKey(element)) {
          headers[element] = queryHeaders[element];
        }
      }
    }

    return dio.Dio().post(
      path,
      data: data,
      options: dio.Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
      queryParameters: queryParameters,
    );
  }

  static Future<dio.Response<dynamic>> sendPut(
    String path, {
    data,
    Map<String, dynamic>? queryHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    final systemController = Get.find<SystemController>();
    Map<String, dynamic> headers = {
      "x-is-mobile": true,
    };

    if (systemController.loginResponseModel != null) {
      headers["authorization"] = "Bearer ${systemController.loginResponseModel!.accessToken}";
    }

    if (queryHeaders != null) {
      for (var element in queryHeaders.keys) {
        if (!headers.containsKey(element)) {
          headers[element] = queryHeaders[element];
        }
      }
    }

    return dio.Dio().put(
      path,
      data: data,
      options: dio.Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
      queryParameters: queryParameters,
    );
  }

  static Future<dio.Response<dynamic>> sendGet(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? queryHeaders,
  }) async {
    final systemController = Get.find<SystemController>();
    Map<String, dynamic> headers = {
      "x-is-mobile": true,
    };

    if (systemController.loginResponseModel != null) {
      headers["authorization"] = "Bearer ${systemController.loginResponseModel!.accessToken}";
    }

    if (queryHeaders != null) {
      for (var element in queryHeaders.keys) {
        if (!headers.containsKey(element)) {
          headers[element] = queryHeaders[element];
        }
      }
    }

    return dio.Dio().get(
      path,
      options: dio.Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
      queryParameters: queryParameters,
    );
  }
}
