import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  /*
  Widget _buildGrid() => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4.0),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    children: _buildGridTileList(5),
  );

  List<Container> _buildGridTileList(int count) => List.generate(
    count, (i) => Container(child: Image.asset("assets/images/img$i.jpg"))
  ); */

  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: "GridViews",
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridViews"),
          backgroundColor: Colors.black54,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.grey
          ),
          child: GridView.extent(
            maxCrossAxisExtent: 150,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: List.generate(
                5, (i) => Container(child: Image.asset("assets/images/img$i.jpg"),)
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
