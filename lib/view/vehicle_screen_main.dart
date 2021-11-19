import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lageado_ac/model/owner_model.dart';
import 'package:lageado_ac/model/test/json_test.dart';
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

  _VehicleScreen({required this.license});

  @override
  initState(){
    super.initState();
    _isLoading = true;
    _initInfos();
  }

  Future<void> _initInfos() async{
    getVehicleInfo();
    getOwnerInfo();
    getServiceInfo();
    if(servicesinfo.isNotEmpty) {
      for(int i = 0; i < servicesinfo.length;i++) {
      }
    }
    await Future.delayed(const Duration(seconds: 1));
    setState((){
      _isLoading = false;
    });
  }

  //@Todo: filter info
  Future<void> getVehicleInfo() async{
    vehicleinfo = VehicleModel();
    JSON_Test_Internal.cars.forEach((key, value) {
      if(key == license) {
        setState((){
          vehicleinfo = VehicleModel.fromJSON({key:value});
        });
        return;
      }
    });
  }

  //@Todo: filter info
  Future<void> getOwnerInfo() async{
    ownerinfo = OwnerModel();
    JSON_Test_Internal.owners.forEach((key, value) {
      if(key == vehicleinfo.ownerid) {
        setState((){
          ownerinfo = OwnerModel.fromJSON({key:value});
        });
        return;
      }
    });
  }

  //@Todo: filter info
  Future<void> getServiceInfo() async{
    servicesinfo = [];
    JSON_Test_Internal.services.forEach((key, value) {
      if(value["license"].toString() == vehicleinfo.license) {
        setState((){
          servicesinfo.add(ServiceModel.fromJSON({key:value}));
        });
      }
    });
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
                        vehicleinfo.license, style: const TextStyle(fontSize: 32, letterSpacing: 2)
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
                          initiallyExpanded: true,
                          //childrenPadding: EdgeInsets.only(top: 10),
                          children: <Widget>[
                            ListTile(
                              title:Text(vehicleinfo.model, textAlign: TextAlign.center),
                              trailing: Icon(Icons.directions_car),
                            ),
                            if(_isEditing) const Divider(),
                            ListTile(
                              title: Text(vehicleinfo.year, textAlign: TextAlign.center),
                              trailing: Icon(Icons.date_range),
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
                            ),
                          ]
                      ),
                      ExpansionTile(
                          leading: const Icon(Icons.person, size: 32,),
                          title: const Text("PROPRIETÁRIO(A)", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          //childrenPadding: EdgeInsets.only(top: 10),
                          children: <Widget>[
                            ListTile(
                              title:
                              Text(ownerinfo.name, textAlign: TextAlign.center),
                              onLongPress: (){Navigator.push(context,MaterialPageRoute(builder: (context) {return OwnerScreen(ownerId: ownerinfo.id);}));},
                              trailing: Icon(Icons.assignment_ind),
                            ),
                            if(_isEditing) const Divider(),
                            ListTile(
                              title:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16,right: 10),
                                      child: Icon(Icons.phone, color: Colors.black26),
                                    ),
                                    Text(ownerinfo.phone, textAlign: TextAlign.center),
                                    const SizedBox(width:60),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16,right: 10),
                                      child: Icon(Icons.alternate_email, color: Colors.black26),
                                    ),
                                    Text(ownerinfo.email, textAlign: TextAlign.center),
                                  ]
                              ),
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