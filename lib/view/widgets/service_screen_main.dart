import 'package:flutter/material.dart';
import 'package:lageado_ac/model/test/json_test.dart';
import 'package:lageado_ac/model/service_model.dart';
import 'package:lageado_ac/model/vehicle_model.dart';

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

  _ServiceScreen({required this.serviceId});

  @override
  initState(){
    super.initState();
    _isLoading = true;
    _initInfos();
  }

  Future<void> _initInfos() async{
    getServiceInfo();
    getVehicleInfo();
    vehicleInfo.printVehicle();
    serviceInfo.printService();
    await Future.delayed(const Duration(seconds: 1));
    setState((){
      _isLoading = false;
    });
  }

  //@Todo: filter info
  Future<void> getVehicleInfo() async{
    vehicleInfo = VehicleModel();
    JSON_Test_Internal.cars.forEach((key, value) {
      if(key == serviceInfo.license) {
        setState((){
          vehicleInfo = VehicleModel.fromJSON({key:value});
        });
        return;
      }
    });
  }

  //@Todo: filter info
  Future<void> getServiceInfo() async{
    serviceInfo = ServiceModel();
    JSON_Test_Internal.services.forEach((key, value) {
      /*if(key == serviceId) {
        setState((){
          serviceInfo  = ServiceModel.fromJSON({key:value});
        });
        return;
      }*/
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

  Widget _showStatusDialog(){
    return SimpleDialog(
      title: const Text("Status"),
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text("Em Aberto"),
          onTap:(){}
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text("Orçamento"),
          onTap:(){}
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text("Aprovado"),
          onTap:(){}
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text("Em Serviço"),
          onTap:(){}
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text("Aguardando Peça"),
          onTap:(){}
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text("Finalizado"),
          onTap:(){}
        ),
      ],
    );
  }
  Container _showDateDialog(bool _start){
    return Container(

    );
  }
  Container _showObsDialog(){
    return Container(

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
                      "O.S: " + serviceInfo.id.toString() + " - " + serviceInfo.serviceType,
                      style: TextStyle(fontSize: 16),
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
                          Text(translateServiceStatus(serviceInfo.status), textAlign: TextAlign.center)
                      ),
                      ListTile(
                          title:
                          Text("Início: " + serviceInfo.startDate, textAlign: TextAlign.center)
                      ),
                      ListTile(
                          title:
                          Text("Fim: " + serviceInfo.endDate, textAlign: TextAlign.center)
                      ),
                      ListTile(
                          title:
                          Text(serviceInfo.description, textAlign: TextAlign.left)
                      ),
                    ],
                  )
              )
            )
          ])
    );
  }
}