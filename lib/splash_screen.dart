
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();


    Future.delayed(Duration(seconds: 2)).then((val) {
         
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) =>  MyApp2()));
    });
    Future.delayed(Duration(seconds: 1)).then((value) => {
      print(value)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'images/person.png',
              height: 200.0,
              width: 200.0,
            ),
          ),
        ),
      ),
    );
  }
}
