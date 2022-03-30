import 'package:aikzykmh/config/config.dart';
import 'package:dio/dio.dart';

class DioTool {
  static DioTool? _instance;
  late Dio dio;

  static DioTool? getInstance() {
    _instance ??= DioTool();
    return _instance;
  }

  DioTool() {
    dio = Dio();
    dio.options = BaseOptions(
        // baseUrl: 'http://01kman.com',
        baseUrl: baseUrl,
        connectTimeout: 5000,
        //连接
        sendTimeout: 5000,
        //发送
        receiveTimeout: 5000,
        //读取
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json);

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      print(e.toString());
      return handler.next(e);
    }));
  }
}
