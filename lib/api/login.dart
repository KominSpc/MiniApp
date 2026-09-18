import 'package:mini_app/constant/index.dart';
import 'package:mini_app/utils/dio_utils.dart';
import 'package:mini_app/viewmodels/login/user_info.dart';

DioUtils _dio = DioUtils();

Future<UserInfo> catchUserInfo(Map<String, dynamic>? data) async {
  Map<String, dynamic> info =
      await _dio.post(HttpConstants.LOGIN, data: data) as Map<String, dynamic>;
  return UserInfo.fromJSON(info);
}
