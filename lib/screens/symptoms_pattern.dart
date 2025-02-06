import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';
import 'package:menstrual_cycle_widget/ui/model/symptoms_pattern.dart';
import '../model/menstrual_summary.dart';
import '../util/custom_widgets.dart';

class SymptomsPatternScreen extends StatefulWidget {
  const SymptomsPatternScreen({super.key});

  @override
  State<SymptomsPatternScreen> createState() => _SymptomsPatternState();
}

class _SymptomsPatternState extends State<SymptomsPatternScreen> {
  final instance = MenstrualCycleWidget.instance!;
  MenstrualCycleSummaryData menstrualCycleSummaryData =
      MenstrualCycleSummaryData();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    List<SymptomsPattern> dataList =
        await instance.getSymptomsPatternBasedOnCycle();
    for (SymptomsPattern symptomsPattern in dataList) {
      String data =
          "Name : ${symptomsPattern.symptomsName}\n${symptomsPattern.numberOfCount} times Found";
      /* printMenstrualCycleLogs(
          "symptomsPattern : ${symptomsPattern.symptomsName} : ${symptomsPattern.numberOfCount} times");*/
      for (CycleData cycleData in symptomsPattern.cycleData!) {
        data =
            "$data\nCycle Start Date : ${cycleData.cycleStartDate}\nCycle End Date:${cycleData.cycleEndDate}\nIs Current Cycle:${cycleData.isCurrentCycle} ";
        for (CycleDates cycleDates in cycleData.cycleDates!) {
          bool isFound = cycleDates.isFoundSymptoms ?? false;
          if (isFound) {
            /*  printMenstrualCycleLogs(
                "Found Symptoms : ${cycleDates.cycleDate} ");*/
            data = "$data\n Symptoms Found:${cycleDates.cycleDate} ";
          }
        }
      }
      printMenstrualCycleLogs("Data: $data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Symptoms Pattern"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (menstrualCycleSummaryData.keyMatrix != null)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              )
            : const Text(
                "No data found",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
