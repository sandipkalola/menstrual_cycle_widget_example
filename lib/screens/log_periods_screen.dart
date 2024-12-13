import 'dart:math';

import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';
import 'package:menstrual_cycle_widget/ui/menstrual_log_period_view.dart';
import 'package:menstrual_cycle_widget/ui/model/display_symptoms_data.dart';

import '../util/colors.dart';
import '../util/custom_widgets.dart';

class LogPeriodsScreen extends StatefulWidget {
  @override
  State<LogPeriodsScreen> createState() => _LogPeriodsScreenState();
}

class _LogPeriodsScreenState extends State<LogPeriodsScreen> {
  final instance = MenstrualCycleWidget.instance!;
  List<UserLogReportData> userSymptomsLogData = [];
  final _random = Random();

  onSuccess() {
    printMenstrualCycleLogs("onSuccess");
    init();
  }

  int next(int min, int max) {
    return -(min + _random.nextInt(max - min));
  }

  onError() {
    printMenstrualCycleLogs("onError");
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
      appBar: getAppBar("Log Periods"),
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
                    "Cycle Day : ${userSymptomsLogData[index].cycleDay} ",
                    style: const TextStyle(fontWeight: FontWeight.normal),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MenstrualLogPeriodView(
                                  displaySymptomsData: DisplaySymptomsData(),
                                  onError: () {},
                                  isShowCustomSymptomsOnly: false,
                                  onSuccess: (int id) {
                                    onSuccess();
                                  },
                                  symptomsLogDate:
                                      userSymptomsLogData[index].logDate!),
                            ),
                          );
                        },
                        child: getButton("Edit"),
                      ),
                      /*GestureDetector(
                        onTap: () async {

                        },
                        child: getButton("Delete"),
                      ),*/
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
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
                symptomsLogDate: DateTime.now(),
                themeColor: themeColor,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget getButton(title) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(width: 1.0, color: Colors.black),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      height: 30,
      width: 100,
      child: Center(
        child: Text(
          title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
