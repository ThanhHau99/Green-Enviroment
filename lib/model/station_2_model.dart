class Station2Model {
  double? waterLevel;
  double? pH;

  Station2Model({this.waterLevel, this.pH});

  Station2Model.fromJson(Map<dynamic, dynamic> json) {
    waterLevel = json['waterLevel'];
    pH = json['pH'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['waterLevel'] = waterLevel;
    data['pH'] = pH;
    return data;
  }
}
