import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lageado_ac/model/test/json_test.dart';
import 'package:lageado_ac/view/vehicle_screen_main.dart';
import 'package:lageado_ac/view/widgets/home_widgets.dart';
import 'package:lageado_ac/model/vehicle_model.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:fluttertoast/fluttertoast.dart';


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with TickerProviderStateMixin{

  final _kTabs = <Widget>[
    const Center(child: Icon(Icons.home, color: Colors.white)),
    const Center(child: Icon(Icons.directions_car, color: Colors.white)),
    const Center(child: Icon(Icons.car_repair, color: Colors.white)),
    const Center(child: Icon(Icons.people, color: Colors.white))
  ];
  Map<String, dynamic> _carsList = {};
  Map<String, dynamic> _servicesList = {};
  Map<String, dynamic> _ownersList = {};

  var _kTabPages = <Widget>[];

  @override
  initState(){
    super.initState();
    _tabController = TabController(length: _kTabs.length, vsync: this);
    //_retrieveVehicles();
  }
  Future<void> _retrieveVehicles() async {
    final dbVehicles = FirebaseDatabase.instance.reference().child("vehicles");
    await dbVehicles.once().then((DataSnapshot dataSnapshot){
      final s = json.encode(dataSnapshot.value);
      setState((){_carsList = json.decode(s);});
      /*Map<String, dynamic> decoded = json.decode(s);
      decoded.forEach((key, value) { print("key: " + key + "_value: " + value.toString());});*/
      //_carsList.forEach((key, value) { print("key: " + key + "_value: " + value.toString());});
    });
  }

  Future<void> _retrieveServices() async {
    final dbServices = FirebaseDatabase.instance.reference().child("services");
    await dbServices.once().then((DataSnapshot dataSnapshot){
      final s = json.encode(dataSnapshot.value);
      setState((){_servicesList = json.decode(s);});
      /*Map<String, dynamic> decoded = json.decode(s);
      decoded.forEach((key, value) { print("key: " + key + "_value: " + value.toString());});*/
      //_servicesList.forEach((key, value) { print("key: " + key + "_value: " + value.toString());});
    });
  }

  Future<void> _retrieveOwners() async {
    final dbOwners = FirebaseDatabase.instance.reference().child("owners");
    await dbOwners.once().then((DataSnapshot dataSnapshot){
      final s = json.encode(dataSnapshot.value);
      setState((){_ownersList = json.decode(s);});
      /*Map<String, dynamic> decoded = json.decode(s);
      decoded.forEach((key, value) { print("key: " + key + "_value: " + value.toString());});*/
      //_ownersList.forEach((key, value) { print("key: " + key + "_value: " + value.toString());});
    });
  }

  void _updatedTabs(int i){
    switch (i) {
      case 1:
        _retrieveVehicles();
        break;
      case 2:
        _retrieveServices();
        break;
      case 3:
        _retrieveOwners();
        break;
      default:
        break;
    }
  }

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    _kTabPages =
    <Widget>[
      homeScreen(),
      vehiclesList(context, _carsList),
      servicesList(context, _servicesList),
      ownersList(context, _ownersList)
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF4E848A),
        /*leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),*/
        title: const Text("Lageado Auto Center", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
        actions: [
          /*IconButton(
              //tooltip: "search_main_tooltip",
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: (){}
          )*/
        ],
        bottom: TabBar(
          tabs: _kTabs,
          controller: _tabController,
          onTap: (i) => _tabController.indexIsChanging ? _updatedTabs(i) : (){}
        )
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: "btserv",
              backgroundColor: Colors.blue,
              //tooltip: main_opcoes_botao_carro,
              child: Icon(Icons.build),
              onPressed: () {
                //_tryAddService(context);
              }
          ),
          FloatingActionButton(
              heroTag: "btcar",
              backgroundColor: Colors.blue,
              //tooltip: main_opcoes_botao_carro,
              child: Icon(Icons.directions_car),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (ctx) => _showNewVehicleModal(context)
                );
              }
          ),
          FloatingActionButton(
              heroTag: "btmain",
              backgroundColor: Colors.blue,
              //tooltip: main_opcoes_botao_carro,
              child: Icon(Icons.menu),
              onPressed: () {}
          ),
        ],
      ),
      body:  TabBarView(
            controller: _tabController,
            children: _kTabPages,
      ),
    );
  }

}

void _tryAddCar(BuildContext context) {

}

Container _showNewVehicleModal(BuildContext context){
  TextEditingController _licenseController = TextEditingController();
  TextEditingController _modelController = TextEditingController();
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
          title: const Text("Placa", textAlign: TextAlign.center,),
        ),
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              //icon: Icon(Icons.sync_alt),
              labelText: "Inserir a placa"
          ),
          controller: _licenseController,
          onEditingComplete: (){
            print(_licenseController.text);
          },
        ),
        const ListTile(
          title: const Text("Modelo", textAlign: TextAlign.center,),
        ),
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              //icon: Icon(Icons.sync_alt),
              labelText: "Inserir o modelo do veículo"
          ),
          controller: _modelController,
          onEditingComplete: (){
            print(_modelController.text);
          },
        ),
        ElevatedButton(
          child: Text("Confirmar"),
          onPressed: (){
            if(_modelController.text.isNotEmpty && _licenseController.text.isNotEmpty ){
              print("not empty");
              final dbVehicles = FirebaseDatabase.instance.reference().child("vehicles");
              final vh = {
                "model": _modelController.text,
                "year" : "2021",
                "renavam" : "--",
                "year" : "----",
                "ownerid" : "-1"
              };

              dbVehicles.child(_licenseController.text).update(vh).then((value) {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return VehicleScreen(license: _licenseController.text);
                        }));
              });
            }
            print("empty");
          },
        ),

      ],
    ),
  );
}