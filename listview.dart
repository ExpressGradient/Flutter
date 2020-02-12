import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  ListTile _tile(String title, String subTitle) => ListTile(
    title: Text(title, style: TextStyle(fontSize: 30, color: Colors.white)),
    subtitle: Text(subTitle, style: TextStyle(fontSize: 20, color: Colors.white)),
    leading: Icon(Icons.directions_car, color: Colors.white),
  );


  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: "ListViews",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListViews"),
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.black
          ),
          child: ListView(
            children: <ListTile>[
              _tile("Audi", "E-Tron"),
              _tile("Aston Martin", "Superleggera"),
              _tile("Buggati", "La Voiture Noire"),
              _tile("Mercedes-Benz", "Vision Avtr")
            ],
          )
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
