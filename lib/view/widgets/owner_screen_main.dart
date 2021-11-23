import 'package:flutter/material.dart';
import 'package:lageado_ac/model/owner_model.dart';
import 'package:lageado_ac/model/test/json_test.dart';
import 'package:lageado_ac/model/vehicle_model.dart';

import '../vehicle_screen_main.dart';

class OwnerScreen extends StatefulWidget{
  final int ownerId;

  OwnerScreen({required this.ownerId});

  @override
  _OwnerScreen createState() => _OwnerScreen(ownerId: this.ownerId);
}

class _OwnerScreen extends State<OwnerScreen> {

  int ownerId;
  bool _isLoading = false;
  bool _isEditing = false;
  late OwnerModel ownerInfo;
  List<String> vehiclesList = [];

  _OwnerScreen({required this.ownerId});

  @override
  initState(){
    super.initState();
    _isLoading = true;
    _initInfos();
  }

  //@Todo: filter info
  Future<void> getOwnerInfo() async{
    ownerInfo = OwnerModel();
    /*JSON_Test_Internal.owners.forEach((key, value) {
      if(key == ownerId) {
        setState((){
          ownerInfo = OwnerModel.fromJSON({key:value});
        });
        return;
      }
    });*/
  }

  Future<void> _initInfos() async{
    vehiclesList = [];
    await getOwnerInfo();
    for (int i = 0; i < JSON_Test_Internal.cars.length; i ++){
      String _key = JSON_Test_Internal.cars.keys.elementAt(i);
      if(JSON_Test_Internal.cars[_key]["ownerid"] == ownerId.toString()){
        setState((){
          vehiclesList.add(_key);});
      }
    }
    await Future.delayed(const Duration(seconds: 1));
    setState((){
      _isLoading = false;
    });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body:
      CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                backgroundColor: Colors.blue,
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 100,
                //titleSpacing: 2,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  //titlePadding: const EdgeInsets.only(top: 10),
                  title:
                  Text(
                    ownerInfo.id.toString() + " - " + ownerInfo.name,
                    style: TextStyle(fontSize: 20),
                  ),
                )
            ),
            SliverFillRemaining(
                child: Expanded(
                    child: _isLoading ? const Center(child: CircularProgressIndicator(color: Colors.green)) :
                      ListView(
                        children:<Widget>[
                          ListTile(
                            trailing: const Icon(Icons.phone, color: Colors.black26),
                            title:Text(ownerInfo.phone, textAlign: TextAlign.center),
                          ),
                          ListTile(
                            trailing: const Icon(Icons.alternate_email, color: Colors.black26),
                            title:Text(ownerInfo.email, textAlign: TextAlign.center),
                          ),
                          ListTile(
                              title: Text(ownerInfo.adress, textAlign: TextAlign.center),
                              trailing: const Icon(Icons.location_on)
                          ),
                          ListTile(
                              title: Text(ownerInfo.district, textAlign: TextAlign.center),
                              trailing: const Icon(Icons.map)
                          ),
                          ExpansionTile(
                            title: const Text("Veículos Cadastrados"),
                            initiallyExpanded: true,
                            leading: const Icon(Icons.directions_car),
                            children: <Widget>[
                              vehiclesList.isEmpty ?
                              const ListTile(
                                title: Text("Nenhum veículo registrado"),
                              )
                                  : ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: vehiclesList.length,
                                itemBuilder: (BuildContext context, int i){
                                  return ListTile(
                                      title: Text(vehiclesList[i]),
                                      onLongPress: (){
                                        Navigator.push( context, MaterialPageRoute( builder: (context) { return VehicleScreen(license: vehiclesList[i]);}));}
                                  );
                                },
                              )
                            ],
                          )
                        ],
                      )
                )
            )
          ]),
    );
  }
}