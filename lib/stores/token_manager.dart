import 'package:mini_app/constant/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  SharedPreferences? tokenManager;
  String? _token = "";

  Future<SharedPreferences> getTokenManager() {
    return SharedPreferences.getInstance();
  }

  Future<void> init() async {
    tokenManager = await getTokenManager();
    _token = tokenManager?.getString(GlobalConstants.USER_TOKEN);
  }

  Future<void> set(String? val) async {
    tokenManager = await getTokenManager();
    await tokenManager?.setString(GlobalConstants.USER_TOKEN, val ?? "");
  }

  String getToken() {
    return _token ?? "";
  }

  Future<void> remove() async {
    tokenManager = await getTokenManager();
    await tokenManager?.remove(GlobalConstants.USER_TOKEN);
    _token = "";
  }
}

final tokenManager = TokenManager();
