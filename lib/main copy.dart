// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.amber,
//         child: Center(
//           child: Card(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(50.0)),
//             elevation: 10.0,
//             child: SizedBox(
//               width: 300.0,
//               height: 400.0,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   // This will hold the Image in the back ground:
//                   Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50.0),
//                         color: Colors.pink[100]),
//                   ),
//                   // This is the Custom Shape Container
//                   Positioned(
//                     bottom: 0.0,
//                     left: 0.0,
//                     child: Container(
//                       color: Colors.red,
//                       child: CustomPaint(
//                         painter: CustomContainerShapeBorder(
//                           height: 100.0,
//                           width: 300.0,
//                           radius: 50.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // This Holds the Widgets Inside the the custom Container;
//                   Positioned(
//                     bottom: 10.0,
//                     child: Container(
//                       height: 80.0,
//                       width: 260.0,
//                       color: Colors.grey.withOpacity(0.6),
//                       child: null,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text(widget.title),
//   //     ),
//   //     body: Center(
//   //       child: Column(
//   //         // mainAxisAlignment: MainAxisAlignment.center,
//   //         children: <Widget>[
//   //           const Text(
//   //             'You have pushed the button this many times:',
//   //           ),
//   //           Text(
//   //             '$_counter',
//   //             style: Theme.of(context).textTheme.headlineMedium,
//   //           ),
//   //           CustomPaint(
//   //             painter: CustomContainerShapeBorder(),
//   //             child: Container(
//   //               height: 200,
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //     floatingActionButton: FloatingActionButton(
//   //       onPressed: _incrementCounter,
//   //       tooltip: 'Increment',
//   //       child: const Icon(Icons.add),
//   //     ), // This trailing comma makes auto-formatting nicer for build methods.
//   //   );
//   // }
// }

// class CustomContainerShapeBorder extends CustomPainter {
//   final double height;
//   final double width;
//   final Color fillColor;
//   final double radius;

//   CustomContainerShapeBorder({
//     this.height: 400.0,
//     this.width: 300.0,
//     this.fillColor: Colors.white,
//     this.radius: 10.0,
//   });
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path = Path();
//     path.moveTo(0.0, -radius);
//     path.lineTo(0.0, -(height - radius));
//     path.conicTo(0.0, -height, radius, -height, 1);
//     path.lineTo(width - radius, -height);
//     path.conicTo(width, -height, width, -(height + radius), 1);
//     path.lineTo(width, -(height - radius));
//     path.lineTo(width, -radius);
//     path.conicTo(width, -height, width, -(height + radius), 1);
//     path.conicTo(width, -height, width, 0, 1);

//     path.conicTo(width, 0.0, width - radius, 0.0, 1);
//     path.lineTo(radius, 0.0);
//     path.conicTo(0.0, 0.0, 0.0, -radius, 1);
//     path.close();
//     canvas.drawPath(path, Paint()..color = fillColor);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
