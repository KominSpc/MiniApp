import 'package:flutter/material.dart';

class SearchPageCategory extends StatefulWidget {
  const SearchPageCategory({super.key});

  @override
  State<SearchPageCategory> createState() => _SearchPageCategoryState();
}

class _SearchPageCategoryState extends State<SearchPageCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              color: Colors.blueAccent,
              alignment: Alignment.center,
              width: 60,
              height: 50,
              child: Text("品类$index"),
            );
          },
        ),
      ),
    );
  }
}
