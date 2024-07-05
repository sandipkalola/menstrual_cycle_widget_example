import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: widget.displayWidget,
    );
  }
}
