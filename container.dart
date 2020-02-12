import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: "Containers",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text("Containers"),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreen,
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border(
                  top: BorderSide(
                    width: 10.0,
                    color: Colors.red
                  )
                ),
              ),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/audi.jpg'),
                  Text(
                    "Audi Electric Car",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              padding: const EdgeInsets.all(15.0),
              margin: const EdgeInsets.all(30.0),
            ),
          ),
        )
      ),
    );
  }
}

void main() => runApp(MyApp());
