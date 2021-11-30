import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lageado_ac/view/widgets/service_screen_main.dart';

import '../home_screen.dart';
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
        String _model = cars[_license]["model"].toString();
        return ListTile(
            title: Text(_license, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, letterSpacing: 2, color: Colors.white)),
            subtitle: Text(_model, textAlign: TextAlign.center, style: TextStyle(color: Colors.white38)),
            onTap : (){tryNavigateToVehicle(context, _license);},
            onLongPress: (){
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                    title: const Text("Remover"),
                    content: const Text("Remover Registro?"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text("Não"),
                      ),
                      TextButton(
                        onPressed: (){
                          _tryRemoveVehicle(_license,context);
                        },
                        child: const Text("Sim"),
                      )
                    ]
                ),
              );
            }
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
    String _type = services[_id]["serviceType"].toString();
    return ListTile(
      title: Text("O.S. $_id", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white)),
      subtitle: Text(_type, textAlign: TextAlign.center, style: TextStyle(color: Colors.white30)),
      onTap : (){tryNavigateToService(context, _id);},
        onLongPress: (){
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                title: const Text("Remover"),
                content: const Text("Remover Registro?"),
                actions: <Widget>[
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("Não"),
                  ),
                  TextButton(
                    onPressed: (){
                      _tryRemoveService(_id).then((value) => Navigator.pop(context));
                    },
                    child: const Text("Sim"),
                  )
                ]
            ),
          );
        }
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
      leading: Icon(Icons.people, color: Colors.white),
      title: Text("$_id - ${owners[_id]["name"]}", textAlign: TextAlign.left, style: TextStyle(color: Colors.white)),
      onTap : (){tryNavigateToOwner(context, _id);} ,
      onLongPress: (){
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Remover"),
            content: const Text("Remover Registro?"),
            actions: <Widget>[
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text("Não"),
              ),
              TextButton(
                onPressed: (){
                  _tryRemoveOwner(_id).then((value) => Navigator.pop(context));
                },
                child: const Text("Sim"),
              )
            ]
          ),
        );
      },
    );
  }
  );
}

Future<void> _tryRemoveOwner(String _id) async{
  final dbOwners = FirebaseDatabase.instance.reference().child("owners");
  //await dbOwners.once().then((DataSnapshot dataSnapshot){}
  await dbOwners.child(_id).remove();
}

Future<void> _tryRemoveVehicle(String _id, BuildContext context) async{
  final dbVehicle = FirebaseDatabase.instance.reference().child("vehicles");
  //await dbOwners.once().then((DataSnapshot dataSnapshot){}
  await dbVehicle.child(_id).remove();
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          }));
}

Future<void> _tryRemoveService(String _id) async{
  final dbServices = FirebaseDatabase.instance.reference().child("services");
  //await dbOwners.once().then((DataSnapshot dataSnapshot){}
  await dbServices.child(_id).remove();
}