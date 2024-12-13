import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';

import 'period_range_list.dart';
import '../util/custom_widgets.dart';

class CustomFunctions extends StatefulWidget {
  const CustomFunctions({super.key});

  @override
  State<CustomFunctions> createState() => _CustomFunctionsState();
}

class _CustomFunctionsState extends State<CustomFunctions> {
  final instance = MenstrualCycleWidget.instance!;
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  DateTime? lastPeriodDate;
  String? lastPeriodDateRangeString;
  String? lastPeriodDateDuration;

  String? periodDateRangeString;
  int previousCycleLength = 0;
  String? avgPeriodDuration;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Custom Functions"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                Fluttertoast.showToast(
                  msg: "Adding dummy data. please wait",
                  toastLength: Toast.LENGTH_SHORT,
                );
                instance.addDummyData(
                    onSuccess: () {
                      Fluttertoast.showToast(
                        msg: "Successfully added dummy data",
                        toastLength: Toast.LENGTH_LONG,
                      );
                    },
                    onError: () {
                      Fluttertoast.showToast(
                        msg: "Error while adding dummy data",
                        toastLength: Toast.LENGTH_LONG,
                      );
                    },
                    numberOfDay: 200);
              },
              child: getButton("Add Dummy Data"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                "Previous Period Date: ${(lastPeriodDate == null) ? "N/A" : _dateFormat.format(lastPeriodDate!)}"),
            GestureDetector(
              onTap: () async {
                printMenstrualCycleLogs(
                    "Json Data ${await instance.getMenstrualCycleSummary()}");
                lastPeriodDate = await instance.getPreviousPeriodDate();
                if (lastPeriodDate!.year == 1971) {
                  if (kDebugMode) {
                    print(
                        "No last period date was provided. Returning default date: 1971-01-01.");
                  }
                } else {
                  if (kDebugMode) {
                    print("Last period date is: ${lastPeriodDate!.toLocal()}");
                  }
                }
                setState(() {});
              },
              child: getButton("Get Previous Period Day"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                "Previous Period Date Range: ${(lastPeriodDateRangeString == null) ? "N/A" : lastPeriodDateRangeString}"),
            GestureDetector(
              onTap: () async {
                PeriodsDateRange lastPeriodDateRange =
                    await instance.getPreviousPeriodDateRange();
                if (lastPeriodDateRange.allPeriodDates!.isNotEmpty) {
                  lastPeriodDateRangeString =
                      lastPeriodDateRange.allPeriodDates!.toString();
                } else {
                  lastPeriodDateRangeString = "N/A";
                }
                setState(() {});
              },
              child: getButton("Get Previous Period Dates"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                "Previous Period Duration: ${(lastPeriodDateDuration == null) ? "N/A" : lastPeriodDateDuration}"),
            GestureDetector(
              onTap: () async {
                int lastPeriodDuration =
                    await instance.getPreviousPeriodDuration();
                lastPeriodDateDuration = lastPeriodDuration.toString();
                setState(() {});
              },
              child: getButton("Get Previous Period Duration"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Previous Cycle Length: $previousCycleLength"),
            GestureDetector(
              onTap: () async {
                int lastPeriodDuration =
                    await instance.getPreviousCycleLength();
                previousCycleLength = lastPeriodDuration;
                setState(() {});
              },
              child: getButton("Get Previous Cycle Length"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                "Period Range: ${(periodDateRangeString == null) ? "N/A" : periodDateRangeString}"),
            GestureDetector(
              onTap: () async {
                List<PeriodsDateRange> periodDateRange =
                    await instance.getAllPeriodsDetails();
                if (periodDateRange.isNotEmpty) {
                  periodDateRangeString = "${periodDateRange.length}";
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PeriodRangeList(
                        periodDateRange: periodDateRange,
                      ),
                    ),
                  );
                } else {
                  periodDateRangeString = "Not Found";
                }
                setState(() {});
              },
              child: getButton("Get All Period Range"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                "Avg Period Duration: ${(avgPeriodDuration == null) ? "N/A" : avgPeriodDuration}"),
            GestureDetector(
              onTap: () async {
                int periodDateDuration = await instance.getAvgPeriodDuration();
                avgPeriodDuration = "$periodDateDuration";
                setState(() {});
              },
              child: getButton("Get Avg Period Duration"),
            ),
          ],
        ),
      ),
    );
  }
}
