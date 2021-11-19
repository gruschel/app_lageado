import 'dart:convert';

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

  var _kTabPages = <Widget>[];

  @override
  initState(){
    super.initState();
    _retrieveVehicles();
  }
  Future<void> _retrieveVehicles() async {
    final dbVehicles = FirebaseDatabase.instance.reference().child("vehicles");
    print("deu");
    /*await dbVehicles.once().then((DataSnapshot dataSnapshot){
      print(json.encode(dataSnapshot.value));
    });*/
  }

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: _kTabs.length, vsync: this);
    _kTabPages =
    <Widget>[
      homeScreen(),
      vehiclesList(context, JSON_Test_Internal.cars.length, JSON_Test_Internal.cars),
      servicesList(context, JSON_Test_Internal.services.length, JSON_Test_Internal.services),
      ownersList(context, JSON_Test_Internal.owners.length, JSON_Test_Internal.owners)
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
              icon: Icon(Icons.search),
              onPressed: (){}
          )
        ],
        bottom: TabBar(
          tabs: _kTabs,
          controller: _tabController,
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
              onPressed: () {}
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