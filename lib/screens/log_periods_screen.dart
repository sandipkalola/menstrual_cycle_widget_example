import 'dart:math';

import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';
import 'package:menstrual_cycle_widget/ui/menstrual_log_period_view.dart';
import 'package:menstrual_cycle_widget/ui/model/display_symptoms_data.dart';

class LogPeriodsScreen extends StatefulWidget {
  @override
  State<LogPeriodsScreen> createState() => _LogPeriodsScreenState();
}

class _LogPeriodsScreenState extends State<LogPeriodsScreen> {
  final instance = MenstrualCycleWidget.instance!;
  List<UserLogReportData> userSymptomsLogData = [];
  final _random = Random();

  onSuccess() {
    printLogs("onSuccess");
    init();
  }

  int next(int min, int max) {
    return -(min + _random.nextInt(max - min));
  }

  onError() {
    printLogs("onError");
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    userSymptomsLogData = await instance.getSymptomsLogReport(
        startDate: DateTime.now().add(const Duration(days: -1000)),
        endDate: DateTime.now());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Periods"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: userSymptomsLogData.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Log Date :  ${CalenderDateUtils.dateDayFormat(userSymptomsLogData[index].logDate!)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Symptoms Data: ",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: userSymptomsLogData[index].symptomsData!.map(
                      (item) {
                        return Text(
                          "${item.symptomName} , ",
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  Text(
                    "Body Temperature  : ${userSymptomsLogData[index].bodyTemperature}  ${userSymptomsLogData[index].bodyTemperatureUnit}",
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Water  : ${userSymptomsLogData[index].waterValue}  ${userSymptomsLogData[index].waterUnit}",
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Meditation Time  : ${userSymptomsLogData[index].meditationTime}",
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Weight  : ${userSymptomsLogData[index].weight}  ${userSymptomsLogData[index].weightUnit}",
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Sleep Time  : ${userSymptomsLogData[index].sleepTime} ",
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Notes  : ${userSymptomsLogData[index].notes} ",
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MenstrualLogPeriodView(
                displaySymptomsData: DisplaySymptomsData(),
                onError: onError(),
                onSuccess: (int id) {
                  onSuccess();
                },
                symptomsLogDate:
                    DateTime.now().add(Duration(days: next(1, 500))),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
