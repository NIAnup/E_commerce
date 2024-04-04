import 'package:ecommerce/Screen/Auth/Login/signup.dart';
import 'package:ecommerce/Screen/Auth/Signin/Signin.dart';
import 'package:ecommerce/Screen/Home/home.dart';
import 'package:ecommerce/Screen/Http/httpmain.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
    );
  }
}
