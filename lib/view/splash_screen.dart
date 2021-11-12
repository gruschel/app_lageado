
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lageado_ac/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen>
{
  @override
  initState(){
    super.initState;
  }

  Future<void> _directToNext(BuildContext context) async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) {
              //return VehicleUpdateScreen(dbKey: _searchResults.getLicenseByKey(_searchResultsOrdered[index]));
              return HomeScreen();
            }));
  }

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(
          future: _directToNext(context),
          builder: (BuildContext context, AsyncSnapshot<void> snap){
            return Center(
                child: Container(
                    margin: const EdgeInsets.only(left: 50, right: 50),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("lib/assets/lp_hr.png"),
                            fit: BoxFit.scaleDown
                        )
                    )
                )
            );});
  }
}