// ignore_for_file: unnecessary_const, use_super_parameters, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animation = Tween(begin: 0.0, end: 1 * 3.141592653589793238).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    _controller.repeat();

    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Login()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    const BoxDecoration boxDecoration = const BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        );
    var container = Container(
        decoration: boxDecoration,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Theme(
                data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
                child: Image.asset(
                  'images/ekram_logo2.png',
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CircularProgressIndicator(
                    value: _animation.value,
                    color: Theme.of(context).primaryColor,
                    strokeWidth: 2,
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFc9b079)),
                    backgroundColor: Colors.transparent, 
                    strokeCap: StrokeCap.round,
                  );
                },
              ),
            ],
          ),
        ),
      );
    return Scaffold(
      body: container,
    );
  }
}
