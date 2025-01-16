import 'package:flutter/material.dart';

import 'colors.dart';

getAppBarText(String title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 20, color: Colors.white),
  );
}

PreferredSizeWidget getAppBar(String title) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: themeColor,
    title: getAppBarText(title),
  );
}

getBoxDecoration() {
  return const BoxDecoration(
    color: themeColor,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
}

Widget textView(String title) {
  return Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.only(left: 5),
    decoration: getBoxDecoration(),
    child: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

Widget getButton(title) {
  return Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.only(left: 5),
    decoration: getBoxDecoration(),
    height: 40,
    child: Center(
      child: Text(
        title,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}
