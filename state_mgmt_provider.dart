import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider(
     create: (context) => CounterModel(),
     child: MaterialApp(
       title: "State Management with Provider",
       home: CounterWidget()
     )
   );
  }
}

class CounterModel extends ChangeNotifier {
  int _counter = 0;
  int get count => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (BuildContext context, CounterModel counter, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("State Management with Provider"),
            backgroundColor: Colors.blueGrey
          ),
          body: Center(
            child: Text("Count: ${counter.count.toString()}", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Colors.blueGrey,
            onPressed: counter.incrementCounter
          ),
        );
      }
    );
  }
}

void main() => runApp(MyApp());
