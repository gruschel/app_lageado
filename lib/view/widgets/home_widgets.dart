import 'package:flutter/material.dart';
import 'package:lageado_ac/view/widgets/service_screen_main.dart';

import '../vehicle_screen_main.dart';
import 'owner_screen_main.dart';

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

void tryNavigateToService(BuildContext context, String id){
  //print("Try Navigate $license");
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) {
            return ServiceScreen(serviceId: int.parse(id));
          }));
}

void tryNavigateToOwner(BuildContext context, String id){
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) {
            return OwnerScreen(ownerId: int.parse(id));
          }));
}

Widget vehiclesList(BuildContext context, Map<String, dynamic> cars){
  return ListView.builder(
  itemCount: cars.length,
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

Widget servicesList(BuildContext context, Map<String, dynamic> services){

  return ListView.builder(
  itemCount: services.length,
  padding: const EdgeInsets.all(16),
  itemBuilder: (BuildContext context, int i){
    String _id = services.keys.elementAt(i);
    return ListTile(
      title: Text("O.S.: $_id"),
      onTap : (){tryNavigateToService(context, _id);} ,
    );
  }
  );
}

Widget ownersList(BuildContext context, Map<String, dynamic> owners){

  return ListView.builder(
  itemCount: owners.length,
  padding: const EdgeInsets.all(16),
  itemBuilder: (BuildContext context, int i){
    String _id = owners.keys.elementAt(i);
    return ListTile(
      leading: Icon(Icons.people),
      title: Text("$_id - ${owners[_id]["name"]}", textAlign: TextAlign.center),
      onTap : (){tryNavigateToOwner(context, _id);} ,
    );
  }
  );
}