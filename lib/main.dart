import 'package:flutter/material.dart';
import 'decede.dart';

void main() {
  runApp(const IkramApp());
}

class IkramApp extends StatelessWidget {
  const IkramApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InformationsDecedeForm(),
    );
  }
}