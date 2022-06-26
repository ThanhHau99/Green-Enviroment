class StationModel {
  String? id;
  String? name;
  bool? isActive;
  dynamic stationData;

  StationModel({
    this.id,
    this.name,
    this.isActive,
    this.stationData,
  });

  StationModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['isActive'];
    stationData = json['stationData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['isActive'] = isActive;
    data['stationData'] = stationData;

    return data;
  }
}
