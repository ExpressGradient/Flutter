import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Returning Data", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey
      ),
      body: Center(
        child: SelectionButton()
      )
    );
  }
}

class SelectionButton extends StatelessWidget {

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionScreen()));

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Pick an option", style: TextStyle(color: Colors.white)),
      onPressed: () => _navigateAndDisplaySelection(context),
      color: Colors.blueGrey
    );
  }
}

class SelectionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick an option", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  child: Text("Yes", style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.pop(context, "Yes"),
                  color: Colors.blueGrey
              ),
              RaisedButton(
                  child: Text("Noep", style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.pop(context, "Noep"),
                  color: Colors.blueGrey
              ),
            ],
          ),
          margin: const EdgeInsets.only(top: 15.0),
        )
      )
    );
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Returning Data",
      home: HomeScreen()
    );
  }
}

void main() => runApp(MyApp());
