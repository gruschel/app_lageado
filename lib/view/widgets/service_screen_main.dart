import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lageado_ac/model/test/json_test.dart';
import 'package:lageado_ac/model/service_model.dart';
import 'package:lageado_ac/model/vehicle_model.dart';
import 'package:intl/intl.dart';
import 'package:lageado_ac/model/pdf/pdf_model.dart';


class ServiceScreen extends StatefulWidget{
  final int serviceId;

  ServiceScreen({required this.serviceId});

  @override
  _ServiceScreen createState() => _ServiceScreen(serviceId: this.serviceId);
}

class _ServiceScreen extends State<ServiceScreen> {

  int serviceId;
  bool _isLoading = false;
  late VehicleModel vehicleInfo;
  late ServiceModel serviceInfo;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _ServiceScreen({required this.serviceId});

  @override
  initState(){
    super.initState();
    _isLoading = true;
    _initInfos();
  }

  Future<void> _initInfos() async{
    getServiceInfo();
    //getVehicleInfo();
    //vehicleInfo.printVehicle();
    //serviceInfo.printService();
    await Future.delayed(const Duration(seconds: 1));
    setState((){
      _isLoading = false;
    });
  }
  //@Todo: filter info
  /*Future<void> getVehicleInfo() async{
    vehicleInfo = VehicleModel();
    final _vehiclesDB = FirebaseDatabase.instance.reference().child("vehicles");
    await _vehiclesDB.once().then((DataSnapshot dataSnapshot){
      final s = json.encode(dataSnapshot.value);
      Map<String, dynamic> decoded = json.decode(s);
      decoded.forEach((key, value) {
        if(value["license"].toString() == vehicleInfo.license) {
          setState((){
            vehicleInfo = VehicleModel.fromJSON({key:value});
          });
        }
      });
    });
  }*/

  //@Todo: filter info
  Future<void> getServiceInfo() async{
    serviceInfo = ServiceModel();
    final _servicesDB = FirebaseDatabase.instance.reference().child("services");
    await _servicesDB.once().then((DataSnapshot dataSnapshot){
      final s = json.encode(dataSnapshot.value);
      Map<String, dynamic> decoded = json.decode(s);
      decoded.forEach((key, value) {
        print("key $key - ID: $serviceId");
        if(key == serviceId.toString()) {
          setState((){
            serviceInfo = ServiceModel.fromJSON({key:value});
          });
          return;
        }
      });
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

  Widget _showStatusDialog(BuildContext context){
    bool _sending = false;
    final dbServices = FirebaseDatabase.instance.reference().child("services");
    //await dbServices.child(vehicleinfo.license).update({_id : _newValue});
    return SimpleDialog(
      title: const Text("Status", textAlign: TextAlign.center),
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.sell),
          title: const Text("Em Aberto"),
          onTap:(){
            setState((){_sending = true;});
            dbServices.child(serviceId.toString()).update({"status" : "0"}).then((value) {
              setState((){_sending = false;});
              getServiceInfo();
              Navigator.pop(context);
            });
          }
        ),
        ListTile(
            leading: const Icon(Icons.receipt_long),
            title: Text("Orçamento"),
            onTap:(){
              setState((){_sending = true;});
              dbServices.child(serviceId.toString()).update({"status" : "1"}).then((value) {
                setState((){_sending = false;});
                getServiceInfo();
                Navigator.pop(context);
              });
            }
        ),
        ListTile(
            leading: const Icon(Icons.thumb_up_alt),
            title: Text("Aprovado"),
            onTap:(){
              setState((){_sending = true;});
              dbServices.child(serviceId.toString()).update({"status" : "2"}).then((value) {
                setState((){_sending = false;});
                getServiceInfo();
                Navigator.pop(context);
              });
            }
        ),
        ListTile(
            leading: const Icon(Icons.groups),
            title: Text("Em Serviço"),
            onTap:(){
              setState((){_sending = true;});
              dbServices.child(serviceId.toString()).update({"status" : "3"}).then((value) {
                setState((){_sending = false;});
                getServiceInfo();
                Navigator.pop(context);
              });
            }
        ),
        ListTile(
            leading: const Icon(Icons.construction),
            title: Text("Aguardando Peça"),
            onTap:(){
              setState((){_sending = true;});
              dbServices.child(serviceId.toString()).update({"status" : "4"}).then((value) {
                setState((){_sending = false;});
                getServiceInfo();
                Navigator.pop(context);
              });
            }
        ),
        ListTile(
            leading: const Icon(Icons.verified),
            title: Text("Finalizado"),
            onTap:(){
              setState((){_sending = true;});
              dbServices.child(serviceId.toString()).update({"status" : "5"}).then((value) {
                setState((){_sending = false;});
                getServiceInfo();
                Navigator.pop(context);
              });
            }
        ),
      ],
    );
  }

  Widget _showServiceTypeDialog(BuildContext context){
    bool _sending = false;
    final dbServices = FirebaseDatabase.instance.reference().child("services");
    //await dbServices.child(vehicleinfo.license).update({_id : _newValue});
    return SimpleDialog(
      title: const Text("Serviço", textAlign: TextAlign.center),
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.circle),
          title: const Text("BALANCEAMENTO"),
          onTap:(){
            setState((){_sending = true;});
            dbServices.child(serviceId.toString()).update({"serviceType" : "BALANCEAMENTO"}).then((value) {
              setState((){_sending = false;});
              getServiceInfo();
              Navigator.pop(context);
            });
          }
        ),
        ListTile(
            leading: const Icon(Icons.horizontal_distribute),
            title: Text("GEOMETRIA"),
            onTap:(){
              setState((){_sending = true;});
              dbServices.child(serviceId.toString()).update({"serviceType" : "GEOMETRIA"}).then((value) {
                setState((){_sending = false;});
                getServiceInfo();
                Navigator.pop(context);
              });
            }
        ),
        ListTile(
            leading: const Icon(Icons.build),
            title: Text("REPARO"),
            onTap:(){
              setState((){_sending = true;});
              dbServices.child(serviceId.toString()).update({"serviceType" : "REPARO"}).then((value) {
                setState((){_sending = false;});
                getServiceInfo();
                Navigator.pop(context);
              });
            }
        ),
      ],
    );
  }

  Container _showObsDialog(BuildContext context){
    TextEditingController _controller = TextEditingController();
    _controller.text = serviceInfo.description;
    return Container(
      height: 500,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(8)
      ),
      child: ListView(
        children: <Widget>[
          const ListTile(title: Text("Observações", textAlign: TextAlign.center)),
          TextField(
            controller: _controller,
            maxLines: 50,
            minLines: 5,
          ),
          ElevatedButton(
            child: Text("Atualizar"),
            onPressed: (){
              _submitNewDescription(_controller.text).then((value){
                getServiceInfo();
                Navigator.pop(context);
              });
            },
          )
        ]
      )
    );
  }

  Future<void> _submitNewDescription(String descr) async {
    final dbServices = FirebaseDatabase.instance.reference().child("services");
    dbServices.child(serviceId.toString()).update({"description" : descr});
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(

       /* leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),),*/
      key: _scaffoldKey,
        backgroundColor: Color(0xFF353535),
      body:
      CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                /*leading: IconButton(
                    onPressed: () {
                      PDFModel _model = PDFModel();
                      _model.createPDF();
                    },
                    icon: const Icon(Icons.menu)),*/
              actions: [
                IconButton(
                    onPressed: () {
                      PDFModel _model = PDFModel();
                      _model.createPDF();
                    },
                    icon: const Icon(Icons.menu))
              ],
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
                      "O.S: " + serviceInfo.id.toString() + " - " + serviceInfo.serviceType,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                )
            ),
            SliverFillRemaining(
              child: Expanded(
                  child: _isLoading ? const Center(child: CircularProgressIndicator(color: Colors.green)) :
                  ListView(
                    children:<Widget>[
                      ListTile(
                          title:
                          Text(translateServiceStatus(serviceInfo.status), textAlign: TextAlign.center),
                        onLongPress: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => _showStatusDialog(context),
                          );
                        }
                      ),
                      ListTile(
                          title:
                          Text("Serviço: " + serviceInfo.serviceType, textAlign: TextAlign.center),
                          onLongPress: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => _showServiceTypeDialog(context),
                            );
                          }
                      ),
                      ListTile(
                          title:
                          Text("Início: " + serviceInfo.startDate, textAlign: TextAlign.center),
                        onLongPress: (){
                          final DateTime now = DateTime.now();
                          showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2025),
                          ).then((DateTime? value) {
                            if (value != null){
                              DateTime _fromDate = DateTime.now();
                              _fromDate = value;
                              final String date = DateFormat.d().format(_fromDate) + "/" + DateFormat.M().format(_fromDate) + "/" + DateFormat.y().format(_fromDate);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Data Inicial: $date')),
                              );
                              final dbServices = FirebaseDatabase.instance.reference().child("services");
                              dbServices.child(serviceId.toString()).update({"startDate" : "$date"}).then((value) {
                                getServiceInfo();
                              });
                            }
                          });
                        },
                      ),
                      ListTile(
                          title: Text("Fim: " + serviceInfo.endDate, textAlign: TextAlign.center),
                          onLongPress: (){
                            final DateTime now = DateTime.now();
                            showDatePicker(
                              context: context,
                              initialDate: now,
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2025),
                            ).then((DateTime? value) {
                              if (value != null){
                                DateTime _fromDate = DateTime.now();
                                _fromDate = value;
                                final String date = DateFormat.d().format(_fromDate) + "/" + DateFormat.M().format(_fromDate) + "/" + DateFormat.y().format(_fromDate);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Data Final: $date')),
                                );
                                final dbServices = FirebaseDatabase.instance.reference().child("services");
                                dbServices.child(serviceId.toString()).update({"endDate" : "$date"}).then((value) {
                                  getServiceInfo();
                                });
                              }
                            });
                          }
                      ),
                      ListTile(
                        title: Text(serviceInfo.description, textAlign: TextAlign.left),
                        onLongPress: (){
                          this._scaffoldKey.currentState?.showBottomSheet(
                                (ctx) => _showObsDialog(context),
                          );
                        },
                      ),
                    ],
                  )
              )
            )
          ])
    );
  }
}