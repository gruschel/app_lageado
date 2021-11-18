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
      if(key == serviceId) {
        setState((){
          serviceInfo  = ServiceModel.fromJSON({key:value});
        });
        return;
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

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.blue,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "O.S. ID: " + serviceInfo.id.toString(),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 30),
                Text(
                    serviceInfo.serviceType, style: const TextStyle(fontSize: 32)
                )
              ],
            )
          ),
          Expanded(
            child: _isLoading ? const Center(child: CircularProgressIndicator(color: Colors.green)) :
            ListView(
              /*scrollDirection: Axis.vertical,
              shrinkWrap: true,*/
              children:<Widget>[
                /*ListTile(
                  title:
                  Text(serviceInfo.serviceType, textAlign: TextAlign.center)
                ),*/
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
          //)
        ],
      )
    );
  }
}