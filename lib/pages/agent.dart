import 'package:flutter/material.dart';

class Agent extends StatefulWidget {
  const Agent({super.key});

  @override
  State<Agent> createState() => _AgentState();
}

class _AgentState extends State<Agent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("智能体页")),
      body: Container(alignment: Alignment.center, child: Text("这个是智能体显示")),
    );
  }
}
