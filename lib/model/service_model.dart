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

  factory ServiceModel.fromJSON(Map<int, dynamic> json){
    int _key = json.keys.elementAt(0);
    return ServiceModel( id: _key,
      license: json[_key]["license"].toString(),
      status: json[_key]["status"],
      startDate: json[_key]["startDate"].toString(),
      endDate: json[_key]["endDate"].toString(),
      description: json[_key]["description"].toString(),
      serviceType: json[_key]["serviceType"].toString(),
    );
  }

  void printService(){
    print("Service ID: $id - Placa: $license - \n$status | $serviceType\n - Start: $startDate | End: $endDate\n Description: $description");
  }
}

