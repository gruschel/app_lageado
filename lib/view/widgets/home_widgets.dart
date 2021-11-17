import 'package:flutter/material.dart';

import '../vehicle_screen_main.dart';

Widget homeScreen(){
  return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/lp_hr.png"),
            fit: BoxFit.scaleDown,)
      )
  );
}

void tryNavigateToVehicle(BuildContext context, String license){
  //print("Try Navigate $license");
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) {
            return VehicleScreen(license: license);
          }));
}

Widget vehiclesList(BuildContext context, int numItens, Map<String, dynamic> cars){
  return ListView.builder(
  itemCount: numItens,
  padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int i){
        String _license = cars.keys.elementAt(i).toString();
        return ListTile(
            title: Text("Placa $_license"),
            onTap : (){tryNavigateToVehicle(context, _license);} ,
        );
      }
  );
}

Widget servicesList(int numItens){

  return ListView.builder(
  itemCount: numItens,
  padding: const EdgeInsets.all(16),
  itemBuilder: (BuildContext context, int i){
    return ListTile(
      title: Text("service $i")
    );
  }
  );
}

Widget ownersList(int numItens){

  return ListView.builder(
  itemCount: numItens,
  padding: const EdgeInsets.all(16),
  itemBuilder: (BuildContext context, int i){
    return ListTile(
      title: Text("person $i")
    );
  }
  );
}