import 'package:mini_app/constant/index.dart';
import 'package:mini_app/utils/dio_utils.dart';
import 'package:mini_app/viewmodels/User/guess_like.dart';

DioUtils dio = DioUtils();

Future<UserGuessLikeResult> createUserGuessLikeResult(
  Map<String, int> params,
) async {
  final data = await dio.get(
    HttpConstants.GUESS_LIKE,
    params: params,
  ) as Map<String, dynamic>;
  return UserGuessLikeResult.fromJSON(data);
}
