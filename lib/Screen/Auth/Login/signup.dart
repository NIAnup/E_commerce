import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../Home/home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> form = GlobalKey();
  bool obscureText = false;
  bool obscure = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  Future signup() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.text, password: Password.text);
      // Save the uid to firestore with its email address as a field
      if (userCredential.user != null) {
        Navigator.pushReplacement(context as BuildContext,
            MaterialPageRoute(builder: (context) => HomePage()));
      } else if (email.text.isEmpty ||
          Password.text.isEmpty ||
          confirmPassword.text.isEmpty) {
        SnackBar(
            content: AlertDialog(
          title: Text("Empty"),
        ));
      }
      await storeData(userCredential.user);
    } on FirebaseException catch (ex) {
      log(ex.toString());
    }
  }

  Future storeData(User? user) async {
    if (user != null) {
      await _store.collection("Credential").doc(user.uid).set({
        "email": user.email,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body: Form(
        key: form,
        child: Column(
          children: [
            TextFormField(
              controller: email,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Empty email";
                }
              },
              decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            TextFormField(
              controller: Password,
              obscureText: obscureText,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Empty Password";
                }
              },
              decoration: InputDecoration(
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Icon(obscureText
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded),
                  ),
                  labelText: "Password",
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            TextFormField(
              controller: confirmPassword,
              validator: (val) {
                if (val != Password) {
                  return "Not match";
                } else if (val!.isEmpty) {
                  return "Empty confirmPassword";
                }
              },
              obscureText: obscure,
              decoration: InputDecoration(
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    child: Icon(obscure
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded),
                  ),
                  labelText: "ConfirmPassword",
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            ElevatedButton(
                onPressed: () {
                  signup();
                },
                child: const Text("Create Account"))
          ],
        ),
      ),
    );
  }
}
