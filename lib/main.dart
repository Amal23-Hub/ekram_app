// import 'package:ekramproject/home.dart';
import 'package:flutter/material.dart';
// import 'declarant.dart';
// import 'testlocation.dart';
import 'map.dart';
// import 'order_traking_dart.dart';
// import 'test3.dart';
// import 'test2.dart';
// import 'deces.dart';
// import 'Accueil.dart';
void main() {
  runApp(const IkramApp());
}

class IkramApp extends StatelessWidget {
  const IkramApp({super.key});
  @override
  Widget build(BuildContext context) {
     return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreenn(),
    );
  }
}