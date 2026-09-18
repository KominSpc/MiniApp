import 'package:flutter/material.dart';
import 'package:mini_app/viewmodels/hot_preference.dart';

class RecommendWidget extends StatefulWidget {
  RecommendResult recommendResult;
  RecommendWidget({required this.recommendResult, super.key});

  @override
  State<RecommendWidget> createState() => _RecommendWidgetState();
}

class _RecommendWidgetState extends State<RecommendWidget> {
  List<GoodsItem> _getGoodsItems(int nums) {
    if (widget.recommendResult.subTypes.isEmpty) {
      return [];
    }
    return widget.recommendResult.subTypes.first.goodsItems.items
        .take(nums)
        .toList();
  }

  List<Container> _createRecommendResults(int nums) {
    List<GoodsItem> goodsLists = _getGoodsItems(nums);
    List<Container> lists = List.generate(nums, (index) {
      return Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                width: 110,
                height: 130,
                goodsLists[index].imgUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "lib/assets/bg.png",
                    width: 110,
                    height: 130,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                alignment: Alignment.center,
                width: 110,
                height: 30,
                color: const Color.fromARGB(255, 207, 146, 146),
                child: Text("${goodsLists[index].price}元"),
              ),
            ),
          ],
        ),
      );
    });
    return lists;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/bg.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Padding(
              padding: EdgeInsets.only(top: 13, left: 19),
              child: Row(
                spacing: 20,
                children: [
                  Text(
                    "今日特惠",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: "黑体",
                    ),
                  ),
                  Text(
                    "xxxxxxxxx",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight(500),
                      color: Colors.black87,
                      fontFamily: "黑体",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _createRecommendResults(4),
            ),
          ),
        ],
      ),
    );
  }
}
