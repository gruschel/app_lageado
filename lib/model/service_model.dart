class ServiceModel{

  int id;
  String license;
  int status;
  String startDate;
  String endDate;
  String description;
  String serviceType;

  ServiceModel({this.id = -1,
    this.license = "III9999",
    this.status = 0,
    this.startDate = "01/01/2000",
    this.endDate = "01/01/2001",
    this.description = "SERVIÇO COMPLETO",
    this.serviceType = "BALANCEAMENTO"}
      );

  factory ServiceModel.fromJSON(Map<String, dynamic> json){
    int _key = int.parse(json.keys.first);
    print(json.toString());
    //print(json[_key]["license"] + "_____000000-0-0-0-");
    return ServiceModel( id: _key,
      license: json[json.keys.first]["license"].toString(),
      status: int.parse(json[json.keys.first]["status"]),
      startDate: json[json.keys.first]["startDate"].toString(),
      endDate: json[json.keys.first]["endDate"].toString(),
      description: json[json.keys.first]["description"].toString(),
      serviceType: json[json.keys.first]["serviceType"].toString(),
    );
  }

  void printService(){
    print("Service ID: $id - Placa: $license - \n$status | $serviceType\n - Start: $startDate | End: $endDate\n Description: $description");
  }
}

