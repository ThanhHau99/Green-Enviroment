class StationModel {
  String? id;
  String? name;
  bool? isActive;
  dynamic dataStation;

  StationModel({this.id, this.name, this.isActive, this.dataStation});

  StationModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['isActive'];
    dataStation = json['dataStation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['isActive'] = isActive;
    data['dataStation'] = dataStation;
    return data;
  }
}
