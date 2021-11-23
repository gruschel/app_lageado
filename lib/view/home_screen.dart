import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lageado_ac/model/test/json_test.dart';
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
    const Center(child: Icon(Icons.home)),
    const Center(child: Icon(Icons.directions_car)),
    const Center(child: Icon(Icons.car_repair)),
    const Center(child: Icon(Icons.people))
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
      _carsList.forEach((key, value) { print("key: " + key + "_value: " + value.toString());});
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
      _ownersList.forEach((key, value) { print("key: " + key + "_value: " + value.toString());});
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
        backgroundColor: Colors.red,
        /*leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),*/
        title: const Text("Lageado Auto Center", textAlign: TextAlign.center),
        actions: [
          IconButton(
              //tooltip: "search_main_tooltip",
              icon: const Icon(Icons.search),
              onPressed: (){}
          )
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
                _retrieveVehicles();
              }
          ),
          FloatingActionButton(
              heroTag: "btcar",
              backgroundColor: Colors.blue,
              //tooltip: main_opcoes_botao_carro,
              child: Icon(Icons.directions_car),
              onPressed: () {}
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