import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lageado_ac/model/owner_model.dart';
import 'package:flutter/services.dart';
import 'package:lageado_ac/model/service_model.dart';
import 'package:lageado_ac/model/vehicle_model.dart';
import 'package:lageado_ac/view/widgets/owner_screen_main.dart';
import 'package:lageado_ac/view/widgets/service_screen_main.dart';


class VehicleScreen extends StatefulWidget{
  final String license;

  VehicleScreen({required this.license});

  @override
  _VehicleScreen createState() => _VehicleScreen(license: license);
}

class _VehicleScreen extends State<VehicleScreen> {

  final String license;
  bool _isLoading = false;
  late VehicleModel vehicleinfo;
  late OwnerModel ownerinfo;
  late List<ServiceModel> servicesinfo;
  bool _isEditing = false;
  late DatabaseReference _vehiclesDB;
  late DatabaseReference _servicesDB;
  late DatabaseReference _ownersDB;

  _VehicleScreen({required this.license});

  @override
  initState(){
    super.initState();
    _isLoading = true;
    _initInfos();
  }

  Future<void> _initInfos() async{
    await getVehicleInfo();
    await getOwnerInfo();
    await getServiceInfo();
    print("****Deu");
    _isLoading = false;


    //await Future.delayed(const Duration(seconds: 1));
  }

  //@Todo: filter info
  Future<void> getVehicleInfo() async{
    vehicleinfo = VehicleModel();
    _vehiclesDB = FirebaseDatabase.instance.reference().child("vehicles");
    await _vehiclesDB.once().then((DataSnapshot dataSnapshot){
    final s = json.encode(dataSnapshot.value);
    Map<String, dynamic> decoded = json.decode(s);
    decoded.forEach((key, value) {
      if(key == license) {
        setState((){
          vehicleinfo = VehicleModel.fromJSON({key:value});
        });
        return;
      }
    });
    });

  }

  //@Todo: filter info
  Future<void> getOwnerInfo() async{
    ownerinfo = OwnerModel();
    _ownersDB = FirebaseDatabase.instance.reference().child("owners");
    await _ownersDB.once().then((DataSnapshot dataSnapshot){
      final s = json.encode(dataSnapshot.value);
      Map<String, dynamic> decoded = json.decode(s);
      decoded.forEach((key, value) {
        if(key == vehicleinfo.ownerid.toString()) {
          setState((){
            ownerinfo = OwnerModel.fromJSON({key:value});
          });
          return;
        }
      });
    });
  }

  //@Todo: filter info
  Future<void> getServiceInfo() async{
    servicesinfo = [];
    _servicesDB = FirebaseDatabase.instance.reference().child("services");
    await _servicesDB.once().then((DataSnapshot dataSnapshot){
      final s = json.encode(dataSnapshot.value);
      Map<String, dynamic> decoded = json.decode(s);
      decoded.forEach((key, value) {
        if(value["license"].toString() == vehicleinfo.license) {
          setState((){
            servicesinfo.add(ServiceModel.fromJSON({key:value}));
          });
        }
      });
    });
    if(servicesinfo.isEmpty) {
      setState((){});
    }
    /*JSON_Test_Internal.services.forEach((key, value) {
      if(value["license"].toString() == vehicleinfo.license) {
        setState((){
          servicesinfo.add(ServiceModel.fromJSON({key:value}));
        });
      }
    });*/
  }

  Future<void> _updateProperty(String _property, String _newValue)async {
    final dbVehicles = FirebaseDatabase.instance.reference().child("vehicles");
    await dbVehicles.child(vehicleinfo.license).update({_property : _newValue});
    await _initInfos();
  }

  Container _showModal(BuildContext context, String _property, String _previous){
    TextEditingController _controller = TextEditingController();
    bool _updating = false;
    return Container(
      height: 400,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(8)
      ),
      child: ListView(
        children: <Widget>[
          const ListTile(
              title: const Text("Alterar", textAlign: TextAlign.center,),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              icon: Icon(Icons.sync_alt),
              labelText: _previous
            ),
            enabled: !_updating,
            controller: _controller,
            onEditingComplete: (){
              print(_controller.text);
              _updateProperty(_property, _controller.text).then((value) {
                Navigator.pop(context);
              });
              },
          ),
        ],
      ),
    );
  }

  Container _showAddOwnerModal(BuildContext context){
    TextEditingController _nameController = TextEditingController();
    return Container(
      height: 500,
      padding: MediaQuery.of(context).viewInsets,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(8)
      ),
      child: ListView(
        children: <Widget>[
          const ListTile(
            title: const Text("Nome", textAlign: TextAlign.center,),
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                //icon: Icon(Icons.sync_alt),
                labelText: "Inserir o Nome"
            ),
            controller: _nameController,
            onEditingComplete: (){
              //print(_nameController.text);
            },
          ),
          ElevatedButton(
            child: Text("Confirmar"),
            onPressed: (){
              _tryAddOwner(context, _nameController.text).then((newId){
                print("newID: " + newId.toString());
                if (newId >= 0){
                  final dbVehicles = FirebaseDatabase.instance.reference().child("vehicles");
                  dbVehicles.child(license).update({"ownerid":newId.toString()}).then((value) {
                    _initInfos();
                  });
                }
              });

            },
          ),

        ],
      ),
    );
  }

  Future<int> _tryAddOwner(BuildContext context, String newName) async{
    if(newName.isNotEmpty){
      print("not empty");
      final dbOwners = FirebaseDatabase.instance.reference().child("owners");
      final owner = {
        "name": newName,
        "phone" : "________",
        "email" : "________",
        "address" : "______",
        "district" : "______"
      };
      int newId = -1;
      bool bFound = false;
      await dbOwners.once().then((DataSnapshot dataSnapshot){
        final s = json.encode(dataSnapshot.value);
        Map<String, dynamic> decoded = json.decode(s);
        decoded.forEach((key, value) {
          print("key " + value["name"] + "___new " + newName);
          if(newId == -1 && value["name"] == newName){
            //newId = int.parse(value["name"].toString());
            newId = int.parse(key);
          }
        });
        if(!bFound) {
          //toast
        }
        else if (newId == -1){
          newId = int.parse(decoded.keys.last) + 1;
        }
        //print(s.length);
      });
      await dbOwners.child(newId.toString()).update(owner);
      Navigator.pop(context);
      return newId;
    }
    else{print("empty"); return -1;}
  }

  String translateServiceStatus(int status){
    switch(status){
      case 0: return "Em Aberto"; break;
      case 1: return "Orçamento"; break;
      case 2: return "Aprovado"; break;
      case 3: return "Em Serviço"; break;
      case 4: return "Aguardando Peça"; break;
      case 5: return "Finalizado"; break;
      default: return "Indefinido"; break;
    }
  }

  Widget _buildServices(BuildContext context, int _index){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(servicesinfo[_index].serviceType),
          trailing: const Icon(Icons.build),
          subtitle: Text(translateServiceStatus(servicesinfo[_index].status)),
          onLongPress: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return ServiceScreen(serviceId: servicesinfo[_index].id);
                    }));},
        ),
        const Divider()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF353535),
      body:
      CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                backgroundColor: Color(0xFF4E848A),
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
                        vehicleinfo.license, style: const TextStyle(fontSize: 32, letterSpacing: 2, color: Colors.white)
                    )
                )
            ),
            SliverFillRemaining(
              child: Expanded(
                child: _isLoading ? const Center(child: CircularProgressIndicator(color: Colors.green)) :
                ListView(
                    children: [
                      ExpansionTile(
                          leading: const Icon(Icons.directions_car, size: 32,),
                          title: const Text("VEÍCULO", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          textColor: Colors.white,
                          initiallyExpanded: true,
                          //childrenPadding: EdgeInsets.only(top: 10),
                          children: <Widget>[
                            ListTile(
                              title:Text(vehicleinfo.model, textAlign: TextAlign.center),
                              trailing: Icon(Icons.directions_car),
                              onLongPress: (){ showModalBottomSheet(
                                context: context,
                                builder: (ctx) => _showModal(context, "model", vehicleinfo.model)
                              );}
                            ),
                            if(_isEditing) const Divider(),
                            ListTile(
                              title: Text(vehicleinfo.year, textAlign: TextAlign.center),
                              trailing: const Icon(Icons.date_range),
                                onLongPress: (){ showModalBottomSheet(
                                    context: context,
                                    builder: (ctx) => _showModal(context, "year", vehicleinfo.year)
                                );}
                            ),
                            if(_isEditing) const Divider(),
                            ListTile(
                                title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("RENAVAM"),
                                      SizedBox(width: 10),
                                      Text(vehicleinfo.renavam)]
                                ),
                              trailing: Icon(Icons.assignment_outlined),
                                onLongPress: (){ showModalBottomSheet(
                                    context: context,
                                    builder: (ctx) => _showModal(context, "renavam", vehicleinfo.renavam)
                                );}
                            ),
                          ]
                      ),
                      ExpansionTile(
                          leading: const Icon(Icons.person, size: 32,),
                          title: const Text("PROPRIETÁRIO(A)", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          //childrenPadding: EdgeInset s.only(top: 10),
                          children: ownerinfo.id == -1 ?
                          <Widget>[
                            ElevatedButton(
                              child: Text("Adicionar Proprietário"),
                              onPressed: (){
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (ctx) => _showAddOwnerModal(context)
                                );
                              },
                            ),
                            const SizedBox(
                              height: 15
                            )
                          ]    :
                          <Widget>[
                            ListTile(
                              title:
                              Text(ownerinfo.name, textAlign: TextAlign.center),
                              onLongPress: (){Navigator.push(context,MaterialPageRoute(builder: (context) {return OwnerScreen(ownerId: ownerinfo.id);}));},
                              trailing: Icon(Icons.assignment_ind),
                            ),
                            if(_isEditing) const Divider(),
                            ListTile(
                              trailing: const Icon(Icons.phone, color: Colors.black26),
                              title:Text(ownerinfo.phone, textAlign: TextAlign.center),
                              onLongPress: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Número copiado')),
                                );
                                Clipboard.setData(ClipboardData(text: ownerinfo.phone));
                              },
                            ),
                            ListTile(
                                trailing: const Icon(Icons.alternate_email, color: Colors.black26),
                                title:Text(ownerinfo.email, textAlign: TextAlign.center),
                                onLongPress: (){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Email copiado')),
                                  );
                                  Clipboard.setData(ClipboardData(text: ownerinfo.email));
                                }
                            ),
                            if(_isEditing) const Divider(),
                            ListTile(
                              title: Text(ownerinfo.adress, textAlign: TextAlign.center),
                              onLongPress: (){Navigator.push(context,MaterialPageRoute(builder: (context) {return OwnerScreen(ownerId: ownerinfo.id);}));},
                            ),
                            if(_isEditing) Divider(),
                            ListTile(
                              title: Text(ownerinfo.district, textAlign: TextAlign.center),
                              onLongPress: (){Navigator.push(context,MaterialPageRoute(builder: (context) {return OwnerScreen(ownerId: ownerinfo.id);}));},
                            ),
                          ]
                      ),
                      ExpansionTile(
                          leading: const Icon(Icons.car_repair, size: 32,),
                          title: const Text("SERVIÇOS", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          children: <Widget>[
                            servicesinfo.isNotEmpty ?
                            ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount: servicesinfo.length,
                                padding: EdgeInsets.all(16),
                                itemBuilder: (BuildContext context, int i){
                                  return _buildServices(context, i );
                                }
                            )
                                : const ListTile(
                                title: Text("Nenhum Serviço registrado")
                            )
                          ]
                      ),
                    ]
                ),
              ),
            )
    ]));
  }
}