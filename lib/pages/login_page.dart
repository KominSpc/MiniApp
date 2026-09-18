import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/api/login.dart';
import 'package:mini_app/stores/user_info_controller.dart';
import 'package:mini_app/utils/bottom_msg_box.dart';
import 'package:mini_app/stores/token_manager.dart';
import 'package:mini_app/utils/loading.dart';
import 'package:mini_app/viewmodels/login/user_info.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _accController = TextEditingController();
  bool _accChecked = false;
  final TextEditingController _passwordController = TextEditingController();
  bool _passChecked = false;
  UserInfo? _userInfo;
  UserInfoController uic = Get.find();

  void _login() async {
    try {
      Map<String, String> data = {
        "account": _accController.text,
        "password": _passwordController.text,
      };
      InfoDialog.show(context);
      _userInfo = await catchUserInfo(data);
      InfoDialog.hide(context);
      Navigator.pop(context);
      BottomMsgBox.bottomInfo("用户登陆成功", context);
      if (_userInfo == null) {
        return;
      } else {
        uic.updateUserInfo(_userInfo!);
        tokenManager.init();
        tokenManager.set(_userInfo!.token);

        print(tokenManager.getToken());
      }
    } catch (e) {
      Navigator.pop(context);
      BottomMsgBox.bottomInfo((e as DioException).message ?? "未知异常", context);
    }
  }

  Widget _createAccTextForm() {
    return TextFormField(
      controller: _accController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          _accChecked = false;
          return "不可输入空信息";
        }
        if (!RegExp(r"^[0-9a-zA-Z]{8,16}$").hasMatch(value)) {
          _accChecked = false;
          return "请输入正确的账号";
        }
        _accChecked = true;
      },
      decoration: InputDecoration(
        hint: Text("请输入账号"),
        fillColor: const Color.fromARGB(153, 255, 211, 211),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _createPasswordTextForm() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          _passChecked = false;
          return "不可输入空密码";
        }

        if (!RegExp(r"^[0-9a-zA-Z]{5,16}$").hasMatch(value)) {
          _passChecked = false;
          return "密码格式不正确";
        }
        _passChecked = true;
      },
      decoration: InputDecoration(
        hint: Text("请输入密码"),
        fillColor: const Color.fromARGB(153, 255, 211, 211),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _createInfoText() {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Checkbox(
            value: _isChecked,
            onChanged: (bool? value) {
              _isChecked = value ?? false;
              setState(() {});
            },
            shape: CircleBorder(side: BorderSide(width: 1)),
          ),
          Text.rich(
            style: TextStyle(),
            TextSpan(
              children: [
                TextSpan(text: "点击代表您已经阅读了"),
                TextSpan(
                  text: "《用户手册》",
                  style: TextStyle(color: Colors.lightBlue),
                ),
                TextSpan(text: "和"),
                TextSpan(
                  text: "《技术手册》",
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createSendButton() {
    return SizedBox(
      width: 500,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(115, 0, 0, 0),
        ),
        onPressed: () {
          _key.currentState?.validate();
          if (!_isChecked && _key.currentState!.validate()) {
            BottomMsgBox.bottomInfo("请勾选用户协议", context);
            return;
          }
          if (_accChecked && _passChecked) {
            _login();
          }
        },
        child: Text(
          "登录",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("登录页")),
      body: Form(
        key: _key,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            spacing: 20,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 50,
                child: _createAccTextForm(),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 50,
                child: _createPasswordTextForm(),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 20,
                child: _createInfoText(),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 37,
                child: _createSendButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
