import 'package:flutter/material.dart';

import '../util/custom_widgets.dart';

class CustomErrorView extends StatelessWidget {
  final FlutterErrorDetails details;

  const CustomErrorView(this.details, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Custom Error view",
      home: MainView(
        errorMessage: details.exceptionAsString(),
      ),
    );
  }
}

class MainView extends StatelessWidget {
  final String errorMessage;

  const MainView({this.errorMessage = "", super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Error View"),
      body: Center(
        child: Text("Error:\n\n $errorMessage"),
      ),
    );
  }
}
