class OwnerModel{

  int id;
  String name;
  String phone;
  String email;
  String adress;
  String district;

  OwnerModel({this.id = -1, this.name = "Generic Owner", this.phone = "9999999", this.adress = "Av. Getúlio Vargas, 1066", this.district = "Menino Deus", this.email = "email@email.com.br"});

  factory OwnerModel.fromJSON(Map<String, dynamic> json){
    int _key = int.parse(json.keys.elementAt(0));
    return OwnerModel( id: _key,
      name: json[_key]["name"].toString(),
      phone: json[_key]["phone"].toString(),
      email: json[_key]["email"].toString(),
      adress: json[_key]["adress"].toString(),
      district: json[_key]["district"].toString(),
    );
  }

  void printOwner(){
    print("Owner: $name - $phone - $email\n - $adress | $district ");
  }
}

