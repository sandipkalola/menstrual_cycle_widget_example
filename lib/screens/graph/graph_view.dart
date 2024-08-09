import 'package:flutter/material.dart';

class GraphView extends StatelessWidget {
  final String title;
  Widget graphView;

  GraphView({super.key, this.title = "", required this.graphView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: graphView,
    );
  }
}
