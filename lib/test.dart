import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'data/station_data.dart';

class TestData extends StatefulWidget {
  const TestData({Key? key}) : super(key: key);

  @override
  State<TestData> createState() => _TestDataState();
}

class _TestDataState extends State<TestData> {
  final stationData = StationData();
  late Map<dynamic, dynamic> sensorData;
  late Map<dynamic, dynamic> warningValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data = stationData.loadStationData("Station 1");
    loadData(data);
  }

  Future<void> loadData(dynamic data) async {
    await data.then((value) {
      value.forEach((key, value) {
        if (key == "sensorData") {
          sensorData = value as Map<dynamic, dynamic>;
          sensorData.forEach((key, value) {
            print("Sensor data $key : $value");
          });
        } else if (key == "warning") {
          warningValue = value as Map<dynamic, dynamic>;
          warningValue.forEach((key, value) {
            print("warning data $key : $value");
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TestData"),
      ),
      body: const Center(
        child: Text("Test Data"),
      ),
    );
  }
}
