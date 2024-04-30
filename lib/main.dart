import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double WIDTH = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
            // color: Colors.green,
            // padding: const EdgeInsets.all(60),
            // height: 200,
            // width: 200,
            margin: const EdgeInsets.all(20),
            child:
                // ClipPath(
                //   clipper: SideCutClipper(

                //   ),

                //   child: Container(
                //     height: 600,
                //     width: 500,
                //     color: Colors.pink,
                //     child: Center(child: Text("SideCutClipper()")),
                //   ),
                // )
                ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                        height: 400,
                        width: 400,
                        color: Colors.amber,
                        child: Text("1234")))
            //     CustomPaint(
            //   size: Size(
            //       WIDTH,
            //       (WIDTH * 1)
            //           .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //   painter: RPSCustomPainter(),
            // ),
            // SvgPicture.asset("assets/images/shape_1.png")
            //     CustomPaint(
            //   size: Size(239, 312),
            //   painter: MyCustomPainter(),
            // )
            //     Container(
            //   width: MediaQuery.of(context).size.width - 100,
            //   height: 312,
            //   child: CustomPaint(
            //     painter: MyCustomPainter(),
            //   ),
            // ),

            //     SizedBox(
            //   // width: 300,
            //   child: Image.asset(
            //     "assets/images/shape_1.png",
            //     width: double.maxFinite,
            //     // height: 40,
            //     fit: BoxFit.fitWidth,
            //     // width: 500,
            //     // scale: 2,
            //   ),
            // )
            //     ClipPath(
            //   clipper: BirthDayCardClipper(),
            //   child: Container(
            //       //Add the child widget....
            //       // child: Text("adsf"),
            //       ),
            // ),
            ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title),
  //     ),
  //     body: Center(
  //       child: Column(
  //         // mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           const Text(
  //             'You have pushed the button this many times:',
  //           ),
  //           Text(
  //             '$_counter',
  //             style: Theme.of(context).textTheme.headlineMedium,
  //           ),
  //           CustomPaint(
  //             painter: CustomContainerShapeBorder(),
  //             child: Container(
  //               height: 200,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: _incrementCounter,
  //       tooltip: 'Increment',
  //       child: const Icon(Icons.add),
  //     ), // This trailing comma makes auto-formatting nicer for build methods.
  //   );
  // }
}

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 50;
    num degToRad(num deg) => deg * (pi / 180.0);

    Rect rect = Rect.fromCircle(center: Offset(20, 20), radius: radius);

    Path path = Path()
      ..lineTo(size.width - radius, 0)
      ..arcTo(
          Rect.fromPoints(Offset(size.width - radius, 0),
              Offset(size.width, radius)), // Rect
          1.5 * pi, // Start engle
          0.5 * pi, // Sweep engle
          true) // direction clockwise
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - radius, size.height - radius - 100),
              radius: radius),
          0,
          0.5 * pi,
          false)
      // ..lineTo(size.width - 140, size.height - 120)
      // ..arcTo(
      //   Rect.fromLTWH(100, 0, 70, 100),
      //   1 * pi,
      //   0.5 * pi,
      //   false,
      // )
      // ..addArc(rect, size.width - 2, size.height)
      ..arcToPoint(
        Offset(size.width - 100, size.height - 50),
        radius: Radius.circular(radius),
        // rotation: 45,
        clockwise: false,
      )

      // ..arcTo(
      //     Rect.fromLTRB(
      //       size.width - radius - 100, size.height-100,

      //       size.width - 100, size.height,

      //       // radius: radius,
      //     ),
      //     0,
      //     -0.5 * pi,
      //     false)
      // ..arcTo(
      //     Rect.fromPoints(
      //       Offset(size.width, size.height),
      //       Offset(size.width - 100, size.height - 100),
      //     ),
      //     0.5 * pi,
      //     0.5 * pi,
      //     false)

      // ..arcTo(
      //   Rect.fromLTWH(size.width - 40, size.height - 50, 0, 0),
      //   1.5 * pi,
      //   0.5 * pi,
      //   false,
      // )

      // ..arcTo(
      //     Rect.fromPoints(Offset(size.width - radius, 10),
      //         Offset(size.width, radius)), // Rect
      //     1.5 * pi, // Start engle
      //     0.5 * pi, // Sweep engle
      //     true) // direction clockwise
      // ..arcTo(
      //     Rect.fromLTRB(
      //         size.height + 60, size.height - radius, radius + 60, size.height),
      //     1.5 * pi, // Start engle
      //     0.5 * pi, // Sweep engle
      //     true)
      // ..lineTo(size.width - 100, size.height)
      // ..arcTo(
      //     Rect.fromCircle(
      //       center: Offset(size.width - 80, size.height - 50),
      //       radius: radius,
      //     ),
      //     -.001999,
      //     -1 * pi,
      //     false)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - radius - 100, size.height - radius),
              radius: radius),
          0,
          0.5 * pi,
          false)
      ..lineTo(radius, size.height)
      ..arcTo(Rect.fromLTRB(0, size.height - radius, radius, size.height),
          0.5 * pi, 0.5 * pi, false)
      ..lineTo(0, radius)
      ..arcTo(Rect.fromLTWH(0, 0, 70, 100), 1 * pi, 0.5 * pi, false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
