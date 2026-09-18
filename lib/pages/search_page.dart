import 'package:flutter/material.dart';
import 'package:mini_app/api/home.dart';
import 'package:mini_app/utils/bottom_msg_box.dart';
import 'package:mini_app/viewmodels/category_head_pic.dart';
import 'package:mini_app/viewmodels/home_products.dart';
import 'package:mini_app/viewmodels/hot_all.dart';
import 'package:mini_app/viewmodels/hot_preference.dart';
import 'package:mini_app/viewmodels/slider_pic.dart';
import 'package:mini_app/widgets/search/category.dart';
import 'package:mini_app/widgets/search/hot.dart';
import 'package:mini_app/widgets/search/more_list.dart';
import 'package:mini_app/widgets/search/recommends.dart';
import 'package:mini_app/widgets/search/slider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //可空组件
  Widget nullBox = SizedBox.shrink();

  List<SliderPic> sliderPicLists = [];
  List<CategoryItem> categoryItems = [];
  RecommendResult? recommendResult;
  HotResultData? inVogueResult;
  HotResultData? oneStopResult;
  List<Product> products = [];
  final ScrollController _searchPageController = ScrollController();
  bool _haveNextPage = true;
  bool _isBlock = false;
  int _page = 1;
  int freshNum = 10;

  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> _createSliderPicLists() async {
    List<SliderPic> lists = await getSliderPic();
    sliderPicLists = lists;
    setState(() {});
  }

  Future<void> _createcategoryItems() async {
    categoryItems = await getCategoryItems();
    setState(() {});
  }

  Future<void> _createRecommendResults() async {
    recommendResult = await getRecommendResult();
    setState(() {});
  }

  Future<void> _createInVogueResult() async {
    inVogueResult = await getInVogueResult();
    setState(() {});
  }

  Future<void> _createOneStopResult() async {
    oneStopResult = await getOneStopResult();
    setState(() {});
  }

  Future<void> _createProductsResults(int page) async {
    int fullPage = page * freshNum;
    products = await getProducts({"limit": "$fullPage"});
  }

  Future<void> _addScrollerListener() async {
    _searchPageController.addListener(() {
      _bottomFresh();
    });
  }

  void _bottomFresh() {
    if (_searchPageController.position.pixels >=
        _searchPageController.position.maxScrollExtent - 100) {
      if (products.length < _page * freshNum) {
        _haveNextPage = false;
        return;
      }
      _page += 1;

      if (!_isBlock || _haveNextPage) {
        _isBlock = true;
        _createProductsResults(_page);
        setState(() {});
        _isBlock = false;
      }
    }
  }

  List<Widget> _createCustomScrollViewWidgets() {
    List<Widget> lists = [
      SliverToBoxAdapter(child: SearchPageSlider(sliderPics: sliderPicLists)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: SearchPageCategory(categoryItems: categoryItems),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
          child: recommendResult == null
              ? nullBox
              : RecommendWidget(recommendResult: recommendResult!),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 10,
                child: inVogueResult == null
                    ? nullBox
                    : SearchPageHot(hotResult: inVogueResult!),
              ),
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 10,
                child: oneStopResult == null
                    ? nullBox
                    : SearchPageHot(hotResult: oneStopResult!), //
              ),
            ],
          ),
        ),
      ),
      SliverPadding(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
        sliver: SearchPageMoreList(products: products),
      ),
    ];
    return lists;
  }

  @override
  initState() {
    super.initState();
    _addScrollerListener();
    Future.microtask(() {
      _refreshKey.currentState?.show();
    });
  }

  Future<void> refreshSearchPage() async {
    _haveNextPage = true;
    _isBlock = false;
    _page = 1;
    freshNum = 10;

    await _createInVogueResult();
    await _createOneStopResult();
    await _createSliderPicLists();
    await _createcategoryItems();
    await _createRecommendResults();
    await _createProductsResults(_page);
    BottomMsgBox.bottomInfo("刷新一下", context);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshKey,
      onRefresh: refreshSearchPage,
      child: CustomScrollView(
        slivers: _createCustomScrollViewWidgets(),
        controller: _searchPageController,
      ),
    );
  }
}
