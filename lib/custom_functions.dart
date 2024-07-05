import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';

class CustomFunctions extends StatefulWidget {
  const CustomFunctions({super.key});

  @override
  State<CustomFunctions> createState() => _CustomFunctionsState();
}

class _CustomFunctionsState extends State<CustomFunctions> {
  final instance = MenstrualCycleWidget.instance!;
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  DateTime? lastPeriodDate;

  @override
  void initState() {
    super.initState();
  }

  Widget getButton(title) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.rectangle,
        border: Border.all(width: 1.0, color: Colors.black),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Functions"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                  "Last Period Date: ${(lastPeriodDate == null) ? "N/A" : _dateFormat.format(lastPeriodDate!)}"),
              GestureDetector(
                onTap: () async {
                  lastPeriodDate = await instance.getLastPeriodDate();
                  setState(() {});
                },
                child: getButton("Get Last Period Date"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
