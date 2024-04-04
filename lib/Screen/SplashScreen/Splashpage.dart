import 'dart:async';

import 'package:ecommerce/Screen/Home/home.dart';
import 'package:flutter/material.dart';

class SpalshPage extends StatelessWidget {
  const SpalshPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    return const Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 203, 72),
      body: Center(
        child: Text("SplashScreen",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
