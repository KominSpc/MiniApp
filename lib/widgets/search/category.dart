import 'package:flutter/material.dart';
import 'package:mini_app/viewmodels/category_head_pic.dart';

class SearchPageCategory extends StatefulWidget {
  List<CategoryItem> categoryItems = [];
  SearchPageCategory({required this.categoryItems, super.key});

  @override
  State<SearchPageCategory> createState() => _SearchPageCategoryState();
}

class _SearchPageCategoryState extends State<SearchPageCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.categoryItems.length,
          itemBuilder: (context, index) {
            return Container(
              width: 60,
              height: 70,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(179, 232, 220, 220),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Image.network(
                    widget.categoryItems[index].imgUrl,
                    webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                    height: 50,
                    width: 60,
                  ),
                  Text(
                    widget.categoryItems[index].name,
                    style: TextStyle(
                      fontFamily: "楷体",
                      fontSize: 11,
                      fontWeight: FontWeight(3),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
