import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    print("Current Text: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      autocorrect: false,
      autofocus: true,
      cursorColor: Colors.blueGrey,
      decoration: InputDecoration(
        labelText: "Search For Data",
        labelStyle: TextStyle(
            color: Colors.blueGrey,
            fontSize: 16.5
        ),
      ),
      style: TextStyle(
          fontSize: 19.0
      ),
    );
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final String appTitle = "Login Form";
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle, style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          child: SearchField(),
          margin: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
