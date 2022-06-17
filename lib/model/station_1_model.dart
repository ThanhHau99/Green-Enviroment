class Station1Model {
  double? temp;
  double? dust;
  double? humi;

  Station1Model({this.temp, this.humi});

  Station1Model.fromJson(Map<dynamic, dynamic> json) {
    temp = json['temp'];
    dust = json['dust'];
    humi = json['humi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['temp'] = temp;
    data['dust'] = dust;
    data['humi'] = humi;
    return data;
  }
}
