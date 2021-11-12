import 'package:flutter/material.dart';
import 'package:lageado_ac/model/test/json_test.dart';
import 'package:lageado_ac/view/widgets/home_widgets.dart';


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
  final _kTabPages = <Widget>[
    homeScreen(),
    vehiclesList(JSON_Test_Internal.cars.length, JSON_Test_Internal.cars),
    servicesList(15),
    ownersList(15),
  ];

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: _kTabs.length, vsync: this);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: Text("stablishment_name"),
        actions: [
          IconButton(
              tooltip: "search_main_tooltip",
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