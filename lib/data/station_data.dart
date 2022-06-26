import 'dart:convert';
import 'dart:math';

import 'package:envapp/model/station_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

abstract class RealtimeData {
  Future<List<StationModel>> load();
  Future<Map> loadStationData(String stationName);
  Future<void> updateWarningValue(String stationName, String key, double value);
}

class StationData extends RealtimeData {
  @override
  Future<List<StationModel>> load() async {
    final List<StationModel> stations = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    // Get the data once
    await ref.once().then((event) {
      for (var element in event.snapshot.children) {
        print("value: ${element.value}");
        var data = element.value as Map<dynamic, dynamic>;
        StationModel station = StationModel.fromJson(data);
        stations.add(station);
      }
    });
    return stations;
  }

  @override
  Future<Map> loadStationData(String stationName) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("$stationName/stationData");
    // Get the data once
    DatabaseEvent event = await ref.once();
    final value = event.snapshot.value as Map<dynamic, dynamic>;

    print("test");
    return value;
  }

  @override
  Future<void> updateWarningValue(
      String stationName, String key, double value) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("$stationName/stationData/warning");
    await ref.update({
      key: value,
    });
  }
}
