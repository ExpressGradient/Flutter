import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  Widget _createSnackBar() => SnackBar(
    content: Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.thumb_up, color: Colors.white),
          SizedBox(width: 20),
          Expanded(
            child: Text("Snack", style: TextStyle(fontSize: 15),),
          )
        ],
      ),
    )
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Drawer",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Drawer"),
          backgroundColor: Colors.blueGrey,
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.blueGrey,
            child: Container(
              child: Text("Drawer Object", style: TextStyle(fontSize: 20, color: Colors.white)),
              margin: const EdgeInsets.only(top: 35, left: 17),
            ),
          ),
        ),
        body: Builder(
          builder: (context) => Center(
            child: Column(
              children: <RaisedButton>[
                RaisedButton(
                  child: Text("Open Drawer"),
                  onPressed: () => Scaffold.of(context).openDrawer()
                ),
                RaisedButton(
                  child: Text("Open Snackbar"),
                  onPressed: () => Scaffold.of(context).showSnackBar(_createSnackBar()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
