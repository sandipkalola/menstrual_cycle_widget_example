import 'dart:io';

import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';
import 'package:menstrual_cycle_widget_example/util/custom_widgets.dart';
import 'graph_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AllGraphScreen extends StatelessWidget {
  const AllGraphScreen({super.key});

  imageView({BuildContext? context, File? file}) async {
    await Navigator.of(context!).push<dynamic>(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("View Image"),
            ),
            body: Center(
              child: Container(
                color: Colors.white,
                child: Image.file(file!),
              ),
            ),
          );
        },
      ),
    );
  }

  pdfView({BuildContext? context, File? file}) async {
    await Navigator.of(context!).push<dynamic>(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text("View PDF"),
            ),
            body: SfPdfViewer.file(file!),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("All graph examples"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              child: textView("Cycle trends graph"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GraphView(
                      title: "Cycle trends graph",
                      graphView: SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          child: MenstrualCycleTrendsGraph(
                            isShowMoreOptions: true,
                            onPdfDownloadCallback: (file) async {
                              pdfView(context: context, file: file!);
                            },
                            onImageDownloadCallback: (file) async {
                              imageView(context: context, file: file!);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: textView("Period cycle graph"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GraphView(
                      title: "Period cycle graph",
                      graphView: SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          child: MenstrualCyclePeriodsGraph(
                            isShowMoreOptions: true,
                            onPdfDownloadCallback: (file) async {
                              pdfView(context: context, file: file!);
                            },
                            onImageDownloadCallback: (file) async {
                              imageView(context: context, file: file!);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: textView("Cycle history graph"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GraphView(
                      title: "Cycle history graph",
                      graphView: SizedBox(
                        height: 270,
                        width: MediaQuery.of(context).size.width,
                        child: const MenstrualCycleHistoryGraph(),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: textView("Body temperature graph"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GraphView(
                      title: "Body Temperature graph",
                      graphView: SizedBox(
                        height: 270,
                        width: MediaQuery.of(context).size.width,
                        child: MenstrualBodyTemperatureGraph(
                          bodyTemperatureUnits: BodyTemperatureUnits.celsius,
                          isShowMoreOptions: true,
                          onPdfDownloadCallback: (file) async {
                            pdfView(context: context, file: file!);
                          },
                          onImageDownloadCallback: (file) async {
                            imageView(context: context, file: file!);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: textView("Water graph"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GraphView(
                      title: "Water graph",
                      graphView: SizedBox(
                        height: 270,
                        width: MediaQuery.of(context).size.width,
                        child: MenstrualCycleWaterGraph(
                          waterUnits: WaterUnits.liters,
                          isShowMoreOptions: true,
                          onPdfDownloadCallback: (file) async {
                            pdfView(context: context, file: file!);
                          },
                          onImageDownloadCallback: (file) async {
                            imageView(context: context, file: file!);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: textView("Sleep graph"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GraphView(
                      title: "Sleep  graph",
                      graphView: SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: MenstrualSleepGraph(
                          isShowYAxisGridLine: true,
                          isShowMoreOptions: true,
                          onPdfDownloadCallback: (file) async {
                            pdfView(context: context, file: file!);
                          },
                          onImageDownloadCallback: (file) async {
                            imageView(context: context, file: file!);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: textView("Weight log graph"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GraphView(
                      title: "Weight log graph",
                      graphView: SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: MenstrualWeightGraph(
                          weightUnits: WeightUnits.kg,
                          isShowMoreOptions: true,
                          onPdfDownloadCallback: (file) async {
                            pdfView(context: context, file: file!);
                          },
                          onImageDownloadCallback: (file) async {
                            imageView(context: context, file: file!);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: textView("Meditation graph"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GraphView(
                      title: "Meditation graph",
                      graphView: SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: MenstrualMeditationGraph(
                          isShowMoreOptions: true,
                          onPdfDownloadCallback: (file) async {
                            pdfView(context: context, file: file!);
                          },
                          onImageDownloadCallback: (file) async {
                            imageView(context: context, file: file!);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: textView("Estrogen/Progesterone graph"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GraphView(
                      title: "Estrogen/Progesterone graph",
                      graphView: SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: EstrogenProgesteroneGraph(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
