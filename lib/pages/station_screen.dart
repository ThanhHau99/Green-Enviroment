import 'package:envapp/pages/widgets/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../share/app_colors.dart';
import '../share/app_icons.dart';
import 'widgets/circle_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/progress_bar.dart';
import 'widgets/wave_widget.dart';

class StationScreen extends StatefulWidget {
  final dynamic dataStation;
  final dynamic warning;
  final String? stationName;
  const StationScreen(
      {Key? key, this.dataStation, this.stationName, this.warning})
      : super(key: key);

  @override
  State<StationScreen> createState() => _StationScreenState();
}

class _StationScreenState extends State<StationScreen> {
  Map<dynamic, dynamic>? dataStation;
  Map<dynamic, dynamic>? warning;
  int indexTab = 0;
  List<Widget> tabWidgets = [];
  List<Widget> tabBarViewWidgets = [];
  String? dateTime;
  double? tempWarning = 0;
  double? humiWarning = 0;
  double? dustWarning = 0;
  double? waterLevelWarning = 0;
  double? pHWarning = 0;
  @override
  void initState() {
    super.initState();
    dateTime = DateFormat("dd/MM/yyyy").format(DateTime.now());

    warning = widget.warning as Map<dynamic, dynamic>;
    warning!.forEach((key, value) {
      warningValue(key, value);
    });

    dataStation = widget.dataStation as Map<dynamic, dynamic>;
    dataStation!.forEach((key, value) {
      addWidget(key, value);
    });
  }

  void warningValue(dynamic key, dynamic value) {
    if (key == "tempWarning") {
      tempWarning = value;
    } else if (key == "humiWarning") {
      humiWarning = value;
    } else if (key == "dustWarning") {
      dustWarning = value;
    } else if (key == "waterLevelWarning") {
      waterLevelWarning = value;
    } else if (key == "pHWarning") {
      pHWarning = value;
    }
  }

  void addWidget(dynamic key, dynamic value) {
    if (key == "temp") {
      tabWidgets.add(TabWidget(
        indexTab: indexTab,
        text: "Temperature",
        iconWhite: AppIcons.tempWhite,
        iconBlack: AppIcons.tempBlack,
        scale: 2,
      ));
      tabBarViewWidgets.add(CircleWidget(
        value: value,
        unit: "°C",
        warningValue: tempWarning,
        lableButton: "Set Temperature alert",
        stationName: widget.stationName,
        warningName: "tempWarning",
      ));
    } else if (key == "humi") {
      tabWidgets.add(TabWidget(
        indexTab: indexTab,
        text: "Humidity",
        iconWhite: AppIcons.humiWhite,
        iconBlack: AppIcons.humiBlack,
        scale: 1.5,
      ));
      tabBarViewWidgets.add(CircleWidget(
        value: value,
        unit: "%",
        warningValue: humiWarning,
        lableButton: "Set Humidity alert",
        stationName: widget.stationName,
        warningName: "humiWarning",
      ));
    } else if (key == "dust") {
      tabWidgets.add(TabWidget(
        indexTab: indexTab,
        text: "Dust",
        iconWhite: AppIcons.dustWhite,
        iconBlack: AppIcons.dustBlack,
        scale: 1.5,
      ));
      tabBarViewWidgets.add(CircleWidget(
        value: value,
        unit: "mcg/m3",
        warningValue: dustWarning,
        lableButton: "Set Dust alert",
        stationName: widget.stationName,
        warningName: "dustWarning",
      ));
    } else if (key == "waterLevel") {
      tabWidgets.add(TabWidget(
        indexTab: indexTab,
        text: "WaterLevel",
        iconWhite: AppIcons.waterLevelWhite,
        iconBlack: AppIcons.waterLevelBlack,
        scale: 1.5,
        iconMargin: const EdgeInsets.only(top: 10, bottom: 20),
      ));
      tabBarViewWidgets.add(WaveWidget(
        value: value,
        warningValue: waterLevelWarning,
        stationName: widget.stationName,
        warningName: "waterLevelWarning",
      ));
    } else if (key == "pH") {
      tabWidgets.add(TabWidget(
        indexTab: indexTab,
        text: "pH",
        iconWhite: AppIcons.pHWhite,
        iconBlack: AppIcons.pHBlack,
        scale: 1.5,
      ));
      tabBarViewWidgets.add(ProgressBar(
        value: value,
        warningValue: pHWarning,
        stationName: widget.stationName,
        warningName: "pHWarning",
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Data station: ${widget.dataStation}");
    print("Warning: ${widget.warning}");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              HeaderWidget(
                title: widget.stationName,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: DefaultTabController(
                  length: tabWidgets.length,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.secondColor,
                        ),
                        child: TabBar(
                          isScrollable: true,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: AppColors.primaryColor,
                          ),
                          unselectedLabelColor: AppColors.blackText,
                          onTap: (int index) {
                            setState(() {});
                          },
                          tabs: tabWidgets,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Today",
                        style:
                            TextStyle(fontSize: 18, color: AppColors.blackText),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        dateTime.toString(),
                        style:
                            TextStyle(fontSize: 18, color: AppColors.blackText),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: tabBarViewWidgets,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
