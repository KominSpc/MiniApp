import 'package:flutter/material.dart';

class SearchPageMoreList extends StatefulWidget {
  const SearchPageMoreList({super.key});

  @override
  State<SearchPageMoreList> createState() => _SearchPageMoreListState();
}

class _SearchPageMoreListState extends State<SearchPageMoreList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
          childAspectRatio: 70 / 60,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blueGrey,
            alignment: Alignment.center,
            child: Text("预览$index"),
          );
        },
      ),
    );
  }
}
