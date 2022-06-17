import 'package:envapp/pages/widgets/tab_widget.dart';
import 'package:flutter/material.dart';
import '../share/app_colors.dart';
import '../share/app_icons.dart';
import 'widgets/circle_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/progress_bar.dart';
import 'widgets/wave_widget.dart';

class StationScreen extends StatefulWidget {
  final dynamic dataStation;
  final String? stationName;
  const StationScreen({Key? key, this.dataStation, this.stationName})
      : super(key: key);

  @override
  State<StationScreen> createState() => _StationScreenState();
}

class _StationScreenState extends State<StationScreen> {
  Map<dynamic, dynamic>? dataStation;
  int indexTab = 0;
  List<Widget> tabWidgets = [];
  List<Widget> tabBarViewWidgets = [];
  @override
  void initState() {
    super.initState();
    dataStation = widget.dataStation as Map<dynamic, dynamic>;

    dataStation!.forEach((key, value) {
      addWidget(key, value);
    });
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
        valueProgress: value,
        valueUnit: "°C",
        lableButton: "Set Temperature alert",
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
        valueProgress: value,
        valueUnit: "%",
        lableButton: "Set Humidity alert",
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
        valueProgress: value,
        valueUnit: "mcg/m3",
        lableButton: "Set Dust alert",
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
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Data station: ${widget.dataStation}");
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
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: AppColors.primaryColor,
                          ),
                          unselectedLabelColor: Colors.black,
                          onTap: (int index) {
                            setState(() {});
                          },
                          tabs: tabWidgets,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
