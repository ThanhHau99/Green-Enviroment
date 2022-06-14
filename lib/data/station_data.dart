import 'dart:convert';

import 'package:envapp/model/station_model.dart';
import 'package:flutter/services.dart';

abstract class RealtimeData {
  Future<List<StationModel>> load();
}

class StationData extends RealtimeData {
  @override
  Future<List<StationModel>> load() async {
    await Future.delayed(const Duration(seconds: 5));
    final jsonContent = await rootBundle.loadString("mock/dataFB.json");
    final List<dynamic> jsonData = jsonDecode(jsonContent);
    print("object: $jsonData");
    return jsonData.map((e) => StationModel.fromJson(e)).toList();
  }
}
