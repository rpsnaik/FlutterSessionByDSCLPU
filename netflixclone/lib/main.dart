import 'package:flutter/material.dart';
import 'package:netflixclone/homepage.dart';

String globalUserEmail = "naik.rpsn@gmail.com";
String globalAPIUrl = "https://raw.githubusercontent.com/rpsnaik/FlutterSessionByDSCLPU/master/netflixAPIData.json";

void main(){
  runApp(
    MaterialApp(
      title: "Netflix Clone",
      home: SplashScreen(),
      theme: ThemeData.dark(),
    )
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(
      seconds: 2
    ), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Image.asset("./assets/netflixLogo.png", width: 200.0,),
      ),
    );
  }
}