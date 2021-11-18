class VehicleModel{

  String license;
  int ownerid;
  String model;
  String year;
  String renavam;

  VehicleModel({
    this.license = "XXX9999",
    this.ownerid  = -1,
    this.model = "CARRO GENÉRICO",
    this.renavam = "---",
    this.year = "1800"}
      );

  factory VehicleModel.fromJSON(Map<String, dynamic> json){
    String _key = json.keys.elementAt(0).toString();
    return VehicleModel(license: _key,
        ownerid: int.parse(json[_key]["ownerid"]),
        model: json[_key]["model"].toString(),
        renavam: json[_key]["renavam"].toString(),
        year: json[_key]["year"].toString()
    );
  }

  void printVehicle(){
    print("License: $license - id: $ownerid\n   - $model : $year\n   - RENAVAM: $renavam");
  }
}

