import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';
import 'package:menstrual_cycle_widget/ui/model/symptoms_pattern.dart';
import 'package:menstrual_cycle_widget_example/util/colors.dart';
import '../util/custom_widgets.dart';

class SymptomsPatternScreen extends StatefulWidget {
  const SymptomsPatternScreen({super.key});

  @override
  State<SymptomsPatternScreen> createState() => _SymptomsPatternState();
}

class _SymptomsPatternState extends State<SymptomsPatternScreen> {
  final instance = MenstrualCycleWidget.instance!;
  List<SymptomsPattern> dataList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    dataList = await instance.getSymptomsPatternBasedOnCycle();
    setState(() {});
  }

  String getDateFormat(String date) {
    if (date.isEmpty) {
      return "Current";
    }
    return CalenderDateUtils.formatDayMonthShort(DateTime.parse(date));
  }

  String numberOfDay(CycleData cycleData) {
    if (cycleData.cycleEndDate == null) {
      return "Current";
    }
    int difference = DateTime.parse(cycleData.cycleEndDate!)
            .difference(DateTime.parse(cycleData.cycleStartDate!))
            .inDays +
        1;
    return "$difference Days";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Symptoms Pattern"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (dataList.isNotEmpty)
            ? ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemCount: dataList.length,
                itemBuilder: (context, symptomsIndex) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: ${dataList[symptomsIndex].symptomsName}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: themeColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const ClampingScrollPhysics(),
                              itemCount:
                                  dataList[symptomsIndex].cycleData!.length,
                              itemBuilder: (context, cycleIndex) {
                                CycleData cycleData = dataList[symptomsIndex]
                                    .cycleData![cycleIndex];
                                return SizedBox(
                                  height: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Text(
                                      " ${getDateFormat(cycleData.cycleStartDate ?? "")}\n${numberOfDay(cycleData)}",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Center(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const ClampingScrollPhysics(),
                                itemCount:
                                    dataList[symptomsIndex].cycleData!.length,
                                itemBuilder: (context, cycleIndex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: SizedBox(
                                      height: 40,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: dataList[symptomsIndex]
                                            .cycleData![cycleIndex]
                                            .cycleDates!
                                            .length,
                                        itemBuilder: (context, subIndex) {
                                          CycleDates cycleDates =
                                              dataList[symptomsIndex]
                                                  .cycleData![cycleIndex]
                                                  .cycleDates![subIndex];

                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10, right: 5),
                                            child: Container(
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: (cycleDates
                                                        .isFoundSymptoms!)
                                                    ? Color(0xFF4CAF50)
                                                    : Color(0xFFD3D3D3),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "${subIndex + 1}",
                                                  style: TextStyle(fontSize: 5),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
            : const Text(
                "No data found",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
