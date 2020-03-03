import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String carName;
  final int carTopSpeed;
  final DocumentReference reference;

  Car.fromMap(Map<String, dynamic> map, {this.reference})
    : assert(map['car_name'] != null),
      assert(map['car_top_speed'] != null),
      carName = map['car_name'],
      carTopSpeed = map['car_top_speed'];

  Car.fromSnapshot(DocumentSnapshot document)
     : this.fromMap(document.data, reference: document.reference);
}

class HomePage extends StatelessWidget {
  Widget _buildCarItem(BuildContext context, DocumentSnapshot document) {
    final car = Car.fromSnapshot(document);
    return Container(
      child: Expanded(
        child: ListTile(
          title: Text("Car Name: ${car.carName}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white)),
          subtitle: Text("Top Speed: ${car.carTopSpeed.toString()}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white)),
          trailing: IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.white),
            onPressed: () => Firestore.instance.runTransaction((Transaction transaction) async {
              await transaction.delete(car.reference);
            })
          )
        )
      ),
      margin: const EdgeInsets.all(10.0),
      color: Color(0xff0336ff)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FavCars: Home", style: TextStyle(fontFamily: "Fira Code", fontWeight: FontWeight.w600)),
        backgroundColor: Color(0xff0336ff)
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('fav_cars').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return LinearProgressIndicator();
          return ListView.builder(
            itemBuilder: (context, index) => _buildCarItem(context, snapshot.data.documents[index]),
            itemCount: snapshot.data.documents.length,
            itemExtent: 100.0
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xff0336ff),
        onPressed: () => Navigator.pushNamed(context, '/addCarPage')
      )
    );
  }
}

class AddCarPage extends StatefulWidget {
  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  final formKey = GlobalKey<FormState>();
  final carNameController = TextEditingController();
  final carSpeedController = TextEditingController();

  @override
  void dispose() {
    carNameController.dispose();
    carSpeedController.dispose();
    super.dispose();
  }

  void _createRecord(String carName, int carTopSpeed) async {
    await Firestore.instance.collection('fav_cars').add({
      'car_name': carName,
      'car_top_speed': carTopSpeed
    });
    setState(() {
      carNameController.text = "";
      carSpeedController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FavCars: Add Fav Cars", style: TextStyle(fontFamily: "Fira Code", fontWeight: FontWeight.w600)),
        backgroundColor: Color(0xff0336ff)
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Car Name:",
                  labelStyle: TextStyle(color: Color(0xff0336ff), fontSize: 18.0, fontWeight: FontWeight.w600)
                ),
                autofocus: true,
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
                controller: carNameController
              ),
              margin: const EdgeInsets.all(10.0)
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Top Speed:",
                  labelStyle: TextStyle(color: Color(0xff0336ff), fontSize: 18.0, fontWeight: FontWeight.w600)
                ),
                autofocus: true,
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
                controller: carSpeedController
              ),
              margin: const EdgeInsets.all(10.0)
            ),
            RaisedButton(
              child: Icon(Icons.add, color: Colors.white),
              color: Color(0xff0336ff),
              onPressed: () {
                _createRecord(carNameController.text, int.parse(carSpeedController.text));
                Navigator.pop(context);
              }
            )
          ]
        )
      )
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fav Cars App",
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/addCarPage": (context) => AddCarPage()
      }
    );
  }
}

void main() => runApp(MyApp());
