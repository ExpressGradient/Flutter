import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("First Route", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueGrey),
      body: Center(
          child: Column(children: <Widget>[
            RaisedButton(
                child: Text("To 2nd Route", style: TextStyle(color: Colors.white)),
                onPressed: () => Navigator.pushNamed(context, "/second"),
                color: Colors.blueGrey),
            RaisedButton(
                child: Text("To 3rd Route", style: TextStyle(color: Colors.white)),
                onPressed: () => Navigator.pushNamed(context, "/third"),
                color: Colors.blueGrey)
          ])),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Second Route", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueGrey),
      body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  child:
                  Text("To 1st Route", style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.pop(context),
                  color: Colors.blueGrey),
              RaisedButton(
                  child:
                  Text("To 3rd Route", style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.popAndPushNamed(context, "/third"),
                  color: Colors.blueGrey)
            ],
          )),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Third Route", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueGrey),
      body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("To 1st Route", style: TextStyle(color: Colors.white)),
                onPressed: () => Navigator.pop(context),
                color: Colors.blueGrey,
              ),
              RaisedButton(
                  child: Text("To 2rd Route", style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.popAndPushNamed(context, "/second"),
                  color: Colors.blueGrey)
            ],
          )),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Navigation App", initialRoute: "/", routes: {
      "/": (context) => FirstRoute(),
      "/second": (context) => SecondRoute(),
      "/third": (context) => ThirdRoute()
    });
  }
}

void main() => runApp(MyApp());
