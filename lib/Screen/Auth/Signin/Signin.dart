import 'dart:developer';

import 'package:ecommerce/Screen/Home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool showpass = false;
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Future Signin() async {
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        if (userCredential.user != null) {
          Navigator.pushReplacement(context as BuildContext,
              MaterialPageRoute(builder: (context) => HomePage()));
        }
        if (emailController.text.isEmpty || passwordController.text.isEmpty) {
          SnackBar(
              content: AlertDialog(
            title: Text("Empty"),
          ));
        }
      } on FirebaseException catch (e) {
        log(e.toString());
        SnackBar(
          content: AlertDialog(title: Text(e.message!)),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: SafeArea(
        child: ListView(
          children: [
            TextFormField(
              controller: passwordController,
              obscureText: showpass,
              decoration: InputDecoration(
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        showpass = !showpass;
                      });
                    },
                    child: Icon(showpass
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
                  prefixIcon: Icon(Icons.mail_outline_outlined),
                  hintText: "xyz@mail.com",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3))),
            )
          ],
        ),
      ),
    );
  }
}
