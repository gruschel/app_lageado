import 'package:flutter/material.dart';

Widget homeScreen(){
  return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/lp_hr.png"),
            fit: BoxFit.scaleDown,)
      )
  );
}

Widget vehiclesList(int numItens, Map<String, dynamic> cars){

  return ListView.builder(
  itemCount: numItens,
  padding: const EdgeInsets.all(16),
  itemBuilder: (BuildContext context, int i){
    return ListTile(
      title: Text("Placa " + cars["${i+1}"]["owner"].toString())
    );
  }
  );
}

Widget servicesList(int numItens){

  return ListView.builder(
  itemCount: numItens,
  padding: const EdgeInsets.all(16),
  itemBuilder: (BuildContext context, int i){
    return ListTile(
      title: Text("service $i")
    );
  }
  );
}

Widget ownersList(int numItens){

  return ListView.builder(
  itemCount: numItens,
  padding: const EdgeInsets.all(16),
  itemBuilder: (BuildContext context, int i){
    return ListTile(
      title: Text("person $i")
    );
  }
  );
}