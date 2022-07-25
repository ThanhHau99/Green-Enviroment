class StationModel {
  String? stationID;
  bool? isActive;
  dynamic stationData;

  StationModel({
    this.stationID,
    this.isActive,
    this.stationData,
  });

  StationModel.fromJson(Map<dynamic, dynamic> json) {
    stationID = json['stationID'];
    isActive = json['isActive'];
    stationData = json['stationData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stationID'] = stationID;
    data['isActive'] = isActive;
    data['stationData'] = stationData;
    return data;
  }
}
