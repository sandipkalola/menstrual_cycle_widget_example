import 'package:flutter/material.dart';

import '../../util/custom_widgets.dart';

class GraphView extends StatelessWidget {
  final String title;
  Widget graphView;

  GraphView({super.key, this.title = "", required this.graphView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title),
      body: graphView,
    );
  }
}
