import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// general error messages for all network errors for production and debug.
String handleDioError(DioError error) {
  String errorDescription = "";
  // in debug mode return directly the error from the server else form a user friendly message.
  if (kDebugMode) {
    return (error.response?.data["message"] ?? error.message ?? error.response);
  }
  switch (error.type) {
    case DioErrorType.cancel:
      errorDescription = "Request to server was cancelled";
      break;
    case DioErrorType.connectTimeout:
      errorDescription = "Connection timeout with server";
      break;
    case DioErrorType.other:
      errorDescription =
          "Connection to API server failed due to internet connection";
      break;
    case DioErrorType.receiveTimeout:
      errorDescription = "Receive timeout in connection with server";
      break;
    case DioErrorType.response:
      {
        errorDescription = "Oops! Something went wrong.. try again.";
        break;
      }

    case DioErrorType.sendTimeout:
      errorDescription = "Send timeout in connection with server";
      break;
  }

  return errorDescription;
}
