import 'package:flutter/material.dart';
import 'package:mini_app/api/home.dart';
import 'package:mini_app/viewmodels/category_head_pic.dart';
import 'package:mini_app/viewmodels/slider_pic.dart';
import 'package:mini_app/widgets/search/category.dart';
import 'package:mini_app/widgets/search/hot.dart';
import 'package:mini_app/widgets/search/more_list.dart';
import 'package:mini_app/widgets/search/slider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SliderPic> sliderPicLists = [];
  List<CategoryItem> categoryItems = [];

  void _createSliderPicLists() async {
    List<SliderPic> lists = await getSliderPic();
    sliderPicLists = lists;
    setState(() {});
    // lists.add(
    //   SliderPic(
    //     imgUrl: "https://th.bing.com/th?id=OIF.T6ry83CkbbRAVC2mZ%2bdKLg&r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
    //     id: 1,
    //   ),
    // );
    // lists.add(
    //   SliderPic(
    //     imgUrl: "https://tse2.mm.bing.net/th/id/OIP.wmW2KcEVSNPfmfw67XZ15QHaEl?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
    //     id: 2,
    //   ),
    // );
    // lists.add(
    //   SliderPic(
    //     imgUrl: "https://tse1.mm.bing.net/th/id/OIP.6Fgl7hjiuosKjqWpZ9nWtAAAAA?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
    //     id: 3,
    //   ),
    // );
  }

  void _createcategoryItems() async {
    categoryItems = await getCategoryItems();
    setState(() {});
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
          child: Container(height: 300, color: Colors.amber),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(flex: 10, child: SearchPageHot()),
              Expanded(flex: 1, child: Container()),
              Expanded(flex: 10, child: SearchPageHot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
          child: SearchPageMoreList(),
        ),
      ),
    ];
    return lists;
  }

  @override
  void initState() {
    super.initState();
    _createSliderPicLists();
    _createcategoryItems();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _createCustomScrollViewWidgets());
  }
}
