import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';
import '../model/menstrual_summary.dart';
import '../util/colors.dart';
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
    // printMenstrualCycleLogs("summaryData ${summaryData.toString()}");
    if (summaryData.isNotEmpty) {
      menstrualCycleSummaryData =
          MenstrualCycleSummaryData.fromJson(summaryData);
      setState(() {});
    }
  }

  getRowData({
    String title = "",
    String data = "",
  }) {
    return Row(
      children: [
        Text(
          "$title:  ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(data),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Summary View"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (menstrualCycleSummaryData.keyMatrix != null)
            ? SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Key matrix of cycle",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: themeColor),
                    ),
                    getRowData(
                        title: "Current cycle day",
                        data:
                            "${menstrualCycleSummaryData.keyMatrix!.currentDayCycle}"),
                    getRowData(
                        title: "Current phase",
                        data:
                            "${menstrualCycleSummaryData.keyMatrix!.currentPhase}"),
                    getRowData(
                        title: "Avg cycle length",
                        data:
                            "${menstrualCycleSummaryData.keyMatrix!.avgCycleLength}"),
                    getRowData(
                        title: "Avg period duration",
                        data:
                            "${menstrualCycleSummaryData.keyMatrix!.avgPeriodDuration}"),
                    getRowData(
                        title: "Period start",
                        data:
                            "${menstrualCycleSummaryData.keyMatrix!.isPeriodStart}"),
                    getRowData(
                        title: "Current period day",
                        data:
                            "${menstrualCycleSummaryData.keyMatrix!.periodDay}"),
                    getRowData(
                        title: "Today is ovulation day",
                        data:
                            "${menstrualCycleSummaryData.keyMatrix!.isOvulationDay}"),
                    getRowData(
                        title: "Prev cycle length",
                        data:
                            "${menstrualCycleSummaryData.keyMatrix!.prevCycleLength}"),
                    getRowData(
                        title: "Prev period duration",
                        data:
                            "${menstrualCycleSummaryData.keyMatrix!.prevPeriodDuration}"),
                    getRowData(
                        title: "Cycle regularity score status",
                        data:
                            "${menstrualCycleSummaryData.keyMatrix!.cycleRegularityScoreStatus}"),
                    getRowData(
                        title: "Cycle regularity score",
                        data:
                            "${menstrualCycleSummaryData.keyMatrix!.cycleRegularityScore}"),
                    getRowData(
                        title: "Period regularity score status",
                        data:
                            "${menstrualCycleSummaryData.keyMatrix!.periodRegularityScoreStatus}"),
                    getRowData(
                        title: "Period regularity score",
                        data:
                            "${menstrualCycleSummaryData.keyMatrix!.periodRegularityScore}"),
                    SizedBox(),
                    Text(
                      "Prediction Matrix",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: themeColor),
                    ),
                    getRowData(
                        title: "Next period day",
                        data:
                            "${menstrualCycleSummaryData.predictionMatrix!.nextPeriodDay}"),
                    getRowData(
                        title: "Next Ovulation_day",
                        data:
                            "${menstrualCycleSummaryData.predictionMatrix!.ovulationDay}"),
                    getRowData(
                        title: "Is period start from today",
                        data:
                            "${menstrualCycleSummaryData.predictionMatrix!.isPeriodStartFromToday}"),
                    getRowData(
                        title: "Is period start from tomorrow",
                        data:
                            "${menstrualCycleSummaryData.predictionMatrix!.isPeriodStartFromTomorrow}"),
                    SizedBox(),
                    Text(
                      "Predicted symptoms for today",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: themeColor),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: menstrualCycleSummaryData
                          .predictedSymptomsPatternToday!
                          .map(
                        (item) {
                          return Text(
                            "${item.symptomName} (${item.occurrences}) , ",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    SizedBox(),
                    Text(
                      "Predicted symptoms for tomorrow",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: themeColor),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: menstrualCycleSummaryData
                          .predictedSymptomsPatternTomorrow!
                          .map(
                        (item) {
                          return Text(
                            "${item.symptomName} (${item.accuracy!}%)",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 10,
                            ),
                          );
                        },
                      ).toList(),
                    )
                  ],
                ),
              )
            : const Text(
                "No data found",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
