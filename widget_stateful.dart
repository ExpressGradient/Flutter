import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if(_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.blueGrey,
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text("$_favoriteCount"),
          ),
        )
      ],
    );
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Interactive Widgets",
      home: Scaffold(
        appBar: AppBar(
          title: Text("StateFul Widgets"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: FavoriteWidget(),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
