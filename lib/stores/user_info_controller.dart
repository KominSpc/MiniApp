import 'package:get/get.dart';
import 'package:mini_app/viewmodels/login/user_info.dart';

class UserInfoController extends GetxController {
  var userInfo = UserInfo.fromJSON({}).obs;
  void updateUserInfo(UserInfo info) {
    userInfo.value = info;
  }
}
