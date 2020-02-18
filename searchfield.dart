import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {

  @override
  SearchFieldState createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        onChanged: (text) {
          print("Current Text: $text");
        },
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search, color: Colors.blueGrey,),
        ),
        cursorColor: Colors.blueGrey,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SearchField",
      home: Scaffold(
        appBar: AppBar(
          title: Text("SearchField", style: TextStyle(color: Colors.white)),
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
