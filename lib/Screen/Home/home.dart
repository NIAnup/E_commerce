import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/package.png"))),
                      height: 90,
                      width: 55,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          print("click add");
                        },
                        child:
                            const Text("Orders", textAlign: TextAlign.center),
                      )),
                  Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/more.png"))),
                      height: 90,
                      width: 50,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          print("click add");
                        },
                        child: const Text("Add", textAlign: TextAlign.center),
                      )),
                  Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/settings.png"))),
                      height: 90,
                      width: 50,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          print("click add");
                        },
                        child:
                            const Text("Setting", textAlign: TextAlign.center),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
