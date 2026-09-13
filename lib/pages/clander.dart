import 'package:flutter/material.dart';

class Clander extends StatefulWidget {
  const Clander({super.key});

  @override
  State<Clander> createState() => _ClanderState();
}

class _ClanderState extends State<Clander> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("日历页")),
      body: Container(alignment: Alignment.center, child: Text("这个是日历显示")),
    );
  }
}
