import 'package:envapp/model/station_model.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class RealtimeData {
  Future<List<StationModel>> load();
  Future<Map> loadStationData(String stationID);
  Future<void> updateWarningValue(String stationID, String key, double value);
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
  Future<Map> loadStationData(String stationID) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("$stationID/stationData");
    // Get the data once
    DatabaseEvent event = await ref.once();
    final value = event.snapshot.value as Map<dynamic, dynamic>;
    return value;
  }

  @override
  Future<void> updateWarningValue(
      String stationID, String key, double value) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("$stationID/stationData/warning");
    await ref.update({
      key: value,
    });
  }
}
