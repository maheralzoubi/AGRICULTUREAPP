class IotSocketModel {
  String? aTemprature;
  String? anemometer;
  String? bettery;
  int? bytlength;
  String? luxes;
  String? pluviometer;
  String? pressure;
  String? rHumidity;
  String? soilMoisture;
  String? windDirection;

  IotSocketModel(
      {this.aTemprature,
      this.anemometer,
      this.bettery,
      this.bytlength,
      this.luxes,
      this.pluviometer,
      this.pressure,
      this.rHumidity,
      this.soilMoisture,
      this.windDirection});

  IotSocketModel.fromJson(Map<String, dynamic> json) {
    aTemprature = json['ATemprature'];
    anemometer = json['Anemometer'];
    bettery = json['Bettery'];
    bytlength = json['Bytlength'];
    luxes = json['Luxes'];
    pluviometer = json['Pluviometer'];
    pressure = json['Pressure'];
    rHumidity = json['RHumidity'];
    soilMoisture = json['SoilMoisture'];
    windDirection = json['WindDirection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ATemprature'] = aTemprature;
    data['Anemometer'] = anemometer;
    data['Bettery'] = bettery;
    data['Bytlength'] = bytlength;
    data['Luxes'] = luxes;
    data['Pluviometer'] = pluviometer;
    data['Pressure'] = pressure;
    data['RHumidity'] = rHumidity;
    data['SoilMoisture'] = soilMoisture;
    data['WindDirection'] = windDirection;
    return data;
  }
}
