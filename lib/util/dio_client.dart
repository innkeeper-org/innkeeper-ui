import 'package:dio/dio.dart';

abstract class DioClient {
  static BaseOptions getOptions() {
    return BaseOptions(
      baseUrl: "http://localhost:5555/api/v1",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
  }

  static final dio = Dio(getOptions());

  static Dio get() {
    return dio;
  }

  Future<T> handleResponse<T>(
      {required Response response,
      required Function(Map<String, dynamic>) fromJson,
      bool isList = false}) async {
    try {
      if (response.statusCode! / 100 == 2) {
        if (isList) {
          if (response.data is List) {
            return (response.data as List)
                .map((item) => {fromJson(item as Map<String, dynamic>)})
                .toList() as T;
          } else {
            throw const FormatException("Expected a list in response!");
          }
        } else {
          if (response.data is Map<String, dynamic>) {
            return fromJson(response.data as Map<String, dynamic>);
          } else {
            throw const FormatException('Expected a map in the response');
          }
        }
      } else {
        throw Exception('Unexpected response status: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      print('DioError: ${dioError.message}');
      throw Exception('Network error occurred');
    } on FormatException catch (formatError) {
      print('FormatException: ${formatError.message}');
      throw Exception('Response data format is incorrect');
    } catch (e) {
      print('Unknown error: $e');
      throw Exception('An unknown error occurred');
    }
  }
}
