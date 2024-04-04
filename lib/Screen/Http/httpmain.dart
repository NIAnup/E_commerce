import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce/Screen/Http/http.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainHttp extends StatefulWidget {
  const MainHttp({super.key});

  @override
  State<MainHttp> createState() => _MainHttpState();
}

List<Users> users = [];

class _MainHttpState extends State<MainHttp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "R E S T A P I",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final usr = users[index];
          return ListTile(
            leading: Image.network(usr.image),
            title: Text(usr.name),
            subtitle: Text(usr.email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: fetchData),
    );
  }

  void fetchData() async {
    log("working");
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;
    final userModel = results
        .map(
          (e) => Users(
            email: e["email"],
            name: e["name"]["first"],
            login: e["login"]["username"],
            phone: e['phone'],
            nat: e["nat"],
            image: e["picture"]["medium"],
          ),
        )
        .toList();
    setState(() {});
    users = userModel;
    log("Fectdata complete");
  }
}
