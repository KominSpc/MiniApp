import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_app/api/login.dart';
import 'package:mini_app/pages/login_page.dart';
import 'package:mini_app/pages/market_page.dart';
import 'package:mini_app/pages/search_page.dart';
import 'package:mini_app/pages/user_page.dart';
import 'package:mini_app/stores/token_manager.dart';
import 'package:mini_app/viewmodels/navigationButton.dart';

import '../stores/user_info_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _navNowIndex = 0;
  UserInfoController uic = Get.put(UserInfoController()); //全局用户数据管理器
  List<Navigationbutton> _createNavButtonList() {
    List<Navigationbutton> lists = [];
    lists.add(
      Navigationbutton(
        navName: "search",
        iconPath: r"lib/assets/search.png",
        activeIconPath: r"lib/assets/search_active.png",
        text: "搜索",
      ),
    );
    lists.add(
      Navigationbutton(
        navName: "clock",
        iconPath: r"lib/assets/clock.png",
        activeIconPath: r"lib/assets/clock_active.png",
        text: "时间",
      ),
    );

    lists.add(
      Navigationbutton(
        navName: "clander",
        iconPath: r"lib/assets/calendar-days.png",
        activeIconPath: r"lib/assets/calendar-days_active.png",
        text: "登录",
      ),
    );

    lists.add(
      Navigationbutton(
        navName: "bot",
        iconPath: r"lib/assets/bot_active.png",
        activeIconPath: r"lib/assets/bot.png",
        text: "用户页",
      ),
    );
    return lists;
  }

  Future<void> _initUserPage() async {
    await tokenManager.init();
    if (tokenManager.getToken().isNotEmpty) {
      uic.updateUserInfo(await catchUserInfoWithToken());
    }
  }

  @override
  void initState() {
    super.initState();
    _initUserPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _navNowIndex,
          children: [SearchPage(), MarketPage(), LoginPage(), UserPage()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _navNowIndex = index;
          setState(() {});
        },
        currentIndex: _navNowIndex,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black12,
        items: _createBottomNavigatonBar(),
      ),
    );
  }

  List<BottomNavigationBarItem> _createBottomNavigatonBar() {
    List<Navigationbutton> lists = _createNavButtonList();
    List<BottomNavigationBarItem> bnLists = List.generate(lists.length, (
      index,
    ) {
      BottomNavigationBarItem item = BottomNavigationBarItem(
        icon: Image.asset(lists[index].iconPath),
        activeIcon: Image.asset(lists[index].activeIconPath),
        label: lists[index].text,
      );
      return item;
    });
    return bnLists;
  }
}
