import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';
import 'package:menstrual_cycle_widget_example/display_widget.dart';
import 'package:menstrual_cycle_widget_example/util/colors.dart';
import 'package:menstrual_cycle_widget_example/util/links.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_functions.dart';
import 'screens/graph/all_graph_screen.dart';
import 'screens/log_periods_screen.dart';
import 'screens/menstrual_cycle_view/menstrual_cycle_view_screen.dart';
import 'util/custom_widgets.dart';

String menstrualCycleDuration = "28";
String periodDuration = "5";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MenstrualCycleWidget.init(
      secretKey: "11a1215l0119a140409p0919", ivKey: "23a1dfr5lyhd9a1404845001");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menstrual Cycle Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Menstrual Cycle Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final instance = MenstrualCycleWidget.instance!;
  String version = "";
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    updateMenstrualData();
    init();
  }

  updateMenstrualData() {
    instance.updateConfiguration(
        cycleLength: int.parse(menstrualCycleDuration),
        periodDuration: int.parse(periodDuration),
        customerId: "1",
        defaultLanguage: Languages.english);
  }

  init() async {
    prefs = await SharedPreferences.getInstance();
    final int? periodDurationInt = prefs!.getInt('periodDuration');
    final int? menstrualCycleDurationInt =
        prefs!.getInt('menstrualCycleDuration');
    if (periodDurationInt != null) {
      periodDuration = "$periodDurationInt";
    } else {
      periodDuration = "5";
    }
    if (menstrualCycleDurationInt != null) {
      menstrualCycleDuration = "$menstrualCycleDurationInt";
    } else {
      menstrualCycleDuration = "28";
    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = "Version ${packageInfo.version}";
    setState(() {});
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Widget getWidget({Widget? displayWidget, String? title}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                DisplayWidget(displayWidget: displayWidget, title: title),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: getBoxDecoration(),
          child: Text(
            title!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: themeColor,
        title: getAppBarText(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (builder) {
                    return Container(
                      height: 350.0,
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 20),
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Update configuration",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Text("Menstrual Cycle Duration"),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 30,
                                width: 70,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    // Border color
                                    borderRadius: BorderRadius.circular(12),
                                    // Rounded corners
                                    color: Colors.white, // Background color
                                  ),
                                  child: DropdownButton<String>(
                                    value: menstrualCycleDuration,
                                    items: List<String>.generate(31,
                                            (index) => (15 + index).toString())
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) async {
                                      await prefs!.setInt(
                                          'menstrualCycleDuration',
                                          int.parse(newValue!));
                                      setState(() {
                                        menstrualCycleDuration = newValue;
                                      });
                                      updateMenstrualData();
                                    },
                                    underline: const SizedBox(),
                                    isExpanded: true,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text("Period Duration"),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 30,
                                width: 70,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white, // Background color
                                  ),
                                  child: DropdownButton<String>(
                                    value: periodDuration,
                                    items: List<String>.generate(8,
                                            (index) => (2 + index).toString())
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) async {
                                      await prefs!.setInt('periodDuration',
                                          int.parse(newValue!));
                                      setState(() {
                                        periodDuration = newValue;
                                      });
                                      updateMenstrualData();
                                    },
                                    underline: const SizedBox(),
                                    isExpanded: true,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  });
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: themeColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Menstrual Cycle Example',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    version,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Pub Dev'),
              onTap: () {
                _launchInBrowser(Uri.parse(pubDev));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Github Repo'),
              onTap: () {
                _launchInBrowser(Uri.parse(github));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Documentation'),
              onTap: () {
                _launchInBrowser(Uri.parse(document));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Report Bugs'),
              onTap: () {
                _launchInBrowser(Uri.parse(reportBugs));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Requests Feature'),
              onTap: () {
                _launchInBrowser(Uri.parse(requestFeature));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('GitHub Sponsors'),
              onTap: () {
                _launchInBrowser(Uri.parse(sponsors));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Rate & Review'),
              onTap: () {
                _launchInBrowser(Uri.parse(playStore));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Monthly Calender View
            getWidget(
                displayWidget: MenstrualCycleMonthlyCalenderView(
                  themeColor: Colors.black,
                  daySelectedColor: Colors.blue,
                  hideInfoView: false,
                  onDataChanged: (value) {},
                ),
                title: "Monthly Calender View"),
            //Calender View
            getWidget(
                displayWidget: Center(
                  child: MenstrualCycleCalenderView(
                    themeColor: Colors.black,
                    daySelectedColor: Colors.blue,
                    logPeriodText: "Log Period",
                    backgroundColorCode: Colors.white,
                    hideInfoView: false,
                    onDateSelected: (date) {},
                    onDataChanged: (value) {},
                    hideBottomBar: false,
                    hideLogPeriodButton: false,
                    isExpanded: false,
                  ),
                ),
                title: "Calender View"),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 5),
                decoration: getBoxDecoration(),
                height: 40,
                width: 230,
                child: const Center(
                  child: Text(
                    "Menstrual Cycle Phase View",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MenstrualCycleViewScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 5),
                decoration: getBoxDecoration(),
                height: 40,
                width: 150,
                child: const Center(
                  child: Text(
                    "Custom Functions",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CustomFunctions(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 5),
                decoration: getBoxDecoration(),
                height: 40,
                width: 150,
                child: const Center(
                  child: Text(
                    "Log Periods",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LogPeriodsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 5),
                decoration: getBoxDecoration(),
                height: 40,
                width: 150,
                child: const Center(
                  child: Text(
                    "All Graph example",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AllGraphScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
