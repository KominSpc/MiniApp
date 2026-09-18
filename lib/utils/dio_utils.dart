import 'package:dio/dio.dart';
import 'package:mini_app/constant/index.dart';

class DioUtils {
  final Dio _dio = Dio();
  DioUtils() {
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIMEOUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIMEOUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIMEOUT);
    _addIterceptor();
  }

  void _addIterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          handler.next(request);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
          } else {
            handler.reject(
              DioException(requestOptions: response.requestOptions),
            );
          }
        },
        onError: (error, handler) {
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              message: error.response?.data["msg"] ?? "",
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    Future<Response<dynamic>> res = _dio.get(
      url,
      queryParameters: params ?? {},
    );
    return _processRes(res);
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? data}) {
    Future<Response<dynamic>> res = _dio.post(url, data: data ?? {});
    return _processRes(res);
  }

  Future<dynamic> _processRes(Future<Response<dynamic>> res) async {
    try {
      Response<dynamic> res_d = await res;
      Map<String, dynamic> data = res_d.data as Map<String, dynamic>;
      if (data["code"] == GlobalConstants.SUCCESS_CODE) {
        return data["result"];
      } else {
        throw Exception(data["msg"] ?? "回收数据异常");
      }
    } catch (e) {
      rethrow;
    }
  }
}
