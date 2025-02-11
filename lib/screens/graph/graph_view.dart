import 'package:flutter/material.dart';

import '../../util/custom_widgets.dart';

class GraphView extends StatefulWidget {
  final String title;
  Widget graphView;

  GraphView({super.key, this.title = "", required this.graphView});

  @override
  State<GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(widget.title),
      body: widget.graphView,
    );
  }
}
