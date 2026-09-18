import 'package:flutter/material.dart';
import 'package:mini_app/api/user.dart';
import 'package:mini_app/viewmodels/User/guess_like.dart';
import 'package:mini_app/widgets/user/guess_you_like.dart';
import 'package:mini_app/widgets/user/guess_you_like_list.dart';
import 'package:mini_app/widgets/user/user_data_info.dart';
import 'package:mini_app/widgets/user/user_function.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  UserGuessLikeResult? _guessYouLike;
  List<GoodsItem> recLists = [];
  Widget nullData = SizedBox.shrink();
  final ScrollController _scrollController = ScrollController();
  bool isBlock = false;
  bool isEnding = false;
  Map<String, int> _params = {"page": 1, "pageSize": 10};

  void _createGuessYouLike(Map<String, int> params) async {
    _guessYouLike = await createUserGuessLikeResult(params);
    recLists.addAll(_guessYouLike!.items);
  }

  void _createControllerListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 40) {
        _bottomRefresh();
        setState(() {});
      }
    });
  }

  void _bottomRefresh() {
    if (_guessYouLike!.pages < _params["page"]!) {
      isEnding = true;
      return;
    }
    if (!isBlock || !isEnding) {
      isBlock = true;
      _createGuessYouLike(_params);
      isBlock = false;
    }
    _params["page"] = _params["page"]! + 1;
  }

  List<Widget> _createUserMsgWidgets() {
    return [
      SliverToBoxAdapter(child: UserDataInfo()),
      SliverToBoxAdapter(child: UserFunction()),
      SliverPersistentHeader(delegate: GuessYouLike(), pinned: true),
      GuessYourLikeList(products: _guessYouLike == null ? [] : recLists),
    ];
  }

  @override
  void initState() {
    super.initState();
    _createGuessYouLike(_params);
    _createControllerListener();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      slivers: _createUserMsgWidgets(),
    );
  }
}
