import 'package:flutter/material.dart';
import 'package:keep_calm/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  late int counter = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    colorAnimation =
        ColorTween(begin: Colors.black, end: Colors.deepPurple)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(controller);
    // In initState
    // colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow)
      // .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));


    controller.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
       if (status == AnimationStatus.forward) {
          // controller.stop();
          counter++;
        }
    });
    controller.repeat(reverse: true);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colorAnimation.value,
    //       gradient: LinearGradient(colors: [Colors.purple, Colors.deepPurple])),
    //   child: Scaffold(
    //     backgroundColor: Colors.transparent,
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: <Widget>[Text('das')],
    //       ),
    //     ),
      ),
      child: Column( mainAxisAlignment:MainAxisAlignment.center, 
          children: [Text('$counter', 
            style: TextStyle(color: Colors.white70,
            decoration: TextDecoration.none,
            fontSize: sizeAnimation.value,
            decorationColor: Colors.red,
            decorationStyle: TextDecorationStyle.dashed,),
          )],),
    );
  }
}
