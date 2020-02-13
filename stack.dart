import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stack",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stack"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 10.0, color: Colors.blueGrey)
                ),
                child: Image.asset("assets/images/img2.jpg"),
                margin: const EdgeInsets.all(20.0),
              ),
              Container(
                child: Text("Aston Martin Superleggara", style: TextStyle(fontSize: 20, color: Colors.white)),
                margin: const EdgeInsets.only(left: 110.0, top: 35.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
