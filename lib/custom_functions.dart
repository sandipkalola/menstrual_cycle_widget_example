import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';

import 'screens/period_range_list.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Previous Period Date: ${(lastPeriodDate == null) ? "N/A" : _dateFormat.format(lastPeriodDate!)}"),
            GestureDetector(
              onTap: () async {
                lastPeriodDate = await instance.getPreviousPeriodDate();
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
                int lastPeriodDuration = instance.getPreviousCycleLength();
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
                int periodDateRange = await instance.getAvgPeriodDuration();
                avgPeriodDuration = "$periodDateRange";
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
