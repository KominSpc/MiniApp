import 'package:flutter/material.dart';

class SearchPageHot extends StatefulWidget {
  const SearchPageHot({super.key});

  @override
  State<SearchPageHot> createState() => _SearchPageHotState();
}

class _SearchPageHotState extends State<SearchPageHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 160, 162, 23),
      alignment: Alignment.center,
      width: 100,
      height: 100,
      child: Text("热点"),
    );
  }
}
