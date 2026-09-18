import 'package:flutter/material.dart';

class GuessYouLike extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      alignment: Alignment.center,
      color: Colors.lightBlueAccent,
      child: Text("猜你喜欢"),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
