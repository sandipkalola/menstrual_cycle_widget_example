import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';
import '../model/menstrual_summary.dart';
import '../util/custom_widgets.dart';

class SummaryView extends StatefulWidget {
  const SummaryView({super.key});

  @override
  State<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  final instance = MenstrualCycleWidget.instance!;
  MenstrualCycleSummaryData menstrualCycleSummaryData =
      MenstrualCycleSummaryData();

  @override
  void initState() {
    super.initState();
    printMenstrualCycleLogs("summaryData initState");
    init();
  }

  init() async {
    Map<String, dynamic> summaryData =
        await instance.getMenstrualCycleSummary();
    printMenstrualCycleLogs("summaryData ${summaryData.toString()}");
    if (summaryData.isNotEmpty) {
      menstrualCycleSummaryData =
          MenstrualCycleSummaryData.fromJson(summaryData);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Summary View"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (menstrualCycleSummaryData.keyMatrix != null)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Current Cycle Day:  ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "${menstrualCycleSummaryData.keyMatrix!.currentDayCycle}"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Avg Cycle Length:  ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "${menstrualCycleSummaryData.keyMatrix!.avgCycleLength}"),
                    ],
                  ),
                ],
              )
            : const Text(
                "No data found",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
