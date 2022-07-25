import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/widgets.dart';
import '../data/station_data.dart';
import '../share/share.dart';

class StationScreen extends StatefulWidget {
  final String? stationID;
  const StationScreen({Key? key, this.stationID}) : super(key: key);

  @override
  State<StationScreen> createState() => _StationScreenState();
}

class _StationScreenState extends State<StationScreen> {
  final stationData = StationData();
  Map<dynamic, dynamic>? sensorData;
  Map<dynamic, dynamic>? warning;
  bool enableTab = false;
  List<Widget> tabWidgets = [];
  List<Widget> tabBarViewWidgets = [];
  String? dateTime;
  dynamic tempWarning = 0;
  dynamic humiWarning = 0;
  dynamic dustWarning = 0;
  dynamic waterLevelWarning = 0;
  dynamic pHWarning = 0;
  @override
  void initState() {
    super.initState();
    dateTime = DateFormat("dd/MM/yyyy").format(DateTime.now());

    loadData();
  }

  Future<void> loadData() async {
    final data = stationData.loadStationData(widget.stationID.toString());

    await data.then((value) {
      value.forEach((key, value) {
        if (key == "sensorData") {
          sensorData = value as Map<dynamic, dynamic>;
        } else if (key == "warning") {
          warning = value as Map<dynamic, dynamic>;
          warning!.forEach((key, value) {
            warningValue(key, value);
          });
        }
      });
    });
    sensorData!.forEach((key, value) {
      addWidget(key, value);
    });
    setState(() {});
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
        enableTab: enableTab,
        text: "Temperature",
        iconWhite: AppIcons.tempWhite,
        iconBlack: AppIcons.tempBlack,
        scale: 2,
      ));
      tabBarViewWidgets.add(CircleWidget(
        value: (value is double) ? value : value.toDouble(),
        unit: "°C",
        warningValue:
            (tempWarning is double) ? tempWarning : tempWarning!.toDouble(),
        sensorName: "Temperature",
        stationID: widget.stationID,
        warningName: "tempWarning",
      ));
    } else if (key == "humi") {
      tabWidgets.add(TabWidget(
        enableTab: enableTab,
        text: "Humidity",
        iconWhite: AppIcons.humiWhite,
        iconBlack: AppIcons.humiBlack,
        scale: 1.5,
      ));
      tabBarViewWidgets.add(CircleWidget(
        value: (value is double) ? value : value.toDouble(),
        unit: "%",
        warningValue:
            (humiWarning is double) ? humiWarning : humiWarning!.toDouble(),
        sensorName: "Humidity",
        stationID: widget.stationID,
        warningName: "humiWarning",
      ));
    } else if (key == "dust") {
      tabWidgets.add(TabWidget(
        enableTab: enableTab,
        text: "Dust",
        iconWhite: AppIcons.dustWhite,
        iconBlack: AppIcons.dustBlack,
        scale: 1.5,
      ));
      tabBarViewWidgets.add(CircleWidget(
        value: (value is double) ? value : value.toDouble(),
        unit: "mcg/m3",
        warningValue:
            (dustWarning is double) ? dustWarning : dustWarning!.toDouble(),
        sensorName: "Dust",
        stationID: widget.stationID,
        warningName: "dustWarning",
      ));
    } else if (key == "waterLevel") {
      tabWidgets.add(TabWidget(
        enableTab: enableTab,
        text: "WaterLevel",
        iconWhite: AppIcons.waterLevelWhite,
        iconBlack: AppIcons.waterLevelBlack,
        scale: 1.5,
        iconMargin: const EdgeInsets.only(top: 10, bottom: 20),
      ));
      tabBarViewWidgets.add(WaveWidget(
        value: (value is double) ? value : value.toDouble(),
        warningValue: (waterLevelWarning is double)
            ? waterLevelWarning
            : waterLevelWarning!.toDouble(),
        stationID: widget.stationID,
        warningName: "waterLevelWarning",
        sensorName: "Water level",
      ));
    } else if (key == "pH") {
      tabWidgets.add(TabWidget(
        enableTab: enableTab,
        text: "pH",
        iconWhite: AppIcons.pHWhite,
        iconBlack: AppIcons.pHBlack,
        scale: 1.5,
      ));
      tabBarViewWidgets.add(ProgressBar(
        value: (value is double) ? value : value.toDouble(),
        warningValue: (pHWarning is double) ? pHWarning : pHWarning!.toDouble(),
        stationID: widget.stationID,
        warningName: "pHWarning",
        sensorName: "pH",
      ));
    }
  }

  Future<void> _onRefresh() async {
    print("_onRefresh");
    tabWidgets = [];
    tabBarViewWidgets = [];
    await loadData();
  }

  @override
  Widget build(BuildContext context) {
    //print("Data station: ${widget.dataStation}");
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.lightGreen,
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    HeaderWidget(
                      title: widget.stationID,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: tabWidgets.isEmpty
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.lightGreen,
                              ),
                            )
                          : buildBody(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  DefaultTabController buildBody() {
    return DefaultTabController(
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
              // onTap: (int index) {
              //   setState(() {
              //     enableTab = true;
              //   });
              // },
              tabs: tabWidgets,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Today",
            style: TextStyle(fontSize: 18, color: AppColors.blackText),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            dateTime.toString(),
            style: TextStyle(fontSize: 18, color: AppColors.blackText),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: tabBarViewWidgets,
            ),
          ),
        ],
      ),
    );
  }
}
