import 'package:flutter/material.dart';

import 'util/custom_widgets.dart';

class DisplayWidget extends StatefulWidget {
  final Widget? displayWidget;
  final String? title;

  const DisplayWidget(
      {super.key, required this.displayWidget, required this.title});

  @override
  State<DisplayWidget> createState() => _DisplayWidgetState();
}

class _DisplayWidgetState extends State<DisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(widget.title!),
      body: Center(child: widget.displayWidget),
    );
  }
}
