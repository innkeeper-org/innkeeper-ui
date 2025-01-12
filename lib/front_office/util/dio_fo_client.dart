import 'package:dio/dio.dart';
import 'package:frontend/util/dio_client.dart';

class DioFOClient extends DioClient {
  static BaseOptions getOptions() {
    BaseOptions options = DioClient.getOptions();
    String newBaseUrl = options.baseUrl;
    newBaseUrl += "/property/";
    BaseOptions newOptions = options.copyWith(baseUrl: newBaseUrl);
    return newOptions;
  }

  static Dio dio = Dio(getOptions());

  @override
  Dio get({propertyId = "1"}) {
    dio.options.baseUrl += propertyId!;
    return dio;
  }
}
