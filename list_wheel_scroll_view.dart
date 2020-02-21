import 'package:flutter/material.dart';

class TvShow {
  String showName;
  String leadActor;
  double imdbRating;
  String productionCompany;

  TvShow(String showName, String leadActor, double imdbRating, String productionCompany) {
    this.showName = showName;
    this.leadActor = leadActor;
    this.imdbRating = imdbRating;
    this.productionCompany = productionCompany;
  }
}

TvShow mrRobot = new TvShow("Mr.Robot", "Rami Malek and Christian Slater", 8.5, "USA Network");
TvShow houseMD = new TvShow("House, M.D", "Hugh Laurie", 8.7, "Fox Broadcasting Company");
TvShow goodDoctor = new TvShow("The Good Doctor", "Freddie Highmore", 8.2, "American Broadcasting Company");
TvShow nightManager = new TvShow("The Night Manager", "Tom Hiddleston and Hugh Laurie", 8.1, "BBC");
TvShow siliconValley = new TvShow("Silicon Valley", "Thomas Middleditch", 8.5, "HBO");
TvShow suits = new TvShow("Suits", "Gabriel Macht and Patrick J.Adams", 8.5, "USA Network");
TvShow marvelousMaisel = new TvShow("The Marvelous Mrs. Maisel", "Rachel Brosnahan", 8.8, "Amazon Prime Video");
TvShow youngSheldon = new TvShow("Young Sheldon", "Iain Armitage", 7.3, "CBS");

List<TvShow> shows = [
  mrRobot, houseMD, goodDoctor, nightManager, siliconValley, suits, marvelousMaisel, youngSheldon
];

Widget showCard(String showName, String leadActor, double imdbRating, String productionCompany) => Card(
  child: Column(
    children: <Widget>[
      Expanded(
        child: ListTile(
          title: Text("Show Name:  $showName", style: TextStyle(fontSize: 17.0, color: Colors.white)),
          subtitle: Text("Lead Actor(s):  $leadActor", style: TextStyle(fontSize: 13.5, color: Colors.white)),
        ),
      ),
      Divider(thickness: 1.85, color: Colors.white),
      Expanded(
        child: ListTile(
          title: Text("IMDB Rating:  ${imdbRating.toString()}", style: TextStyle(fontSize: 13.0, color: Colors.white)),
          subtitle: Text("Production Company:  $productionCompany", style: TextStyle(fontSize: 12.0, color: Colors.white)),
        ),
      ),
    ],
  ),
  color: Colors.blueGrey,
  elevation: 5.0,
);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTitle = "My Favorite TV Shows";
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle, style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.blueGrey,
          ),
          body: Container(
            child: ListWheelScrollView(
              children: shows.map((show) => showCard(show.showName, show.leadActor, show.imdbRating, show.productionCompany)).toList(),
              itemExtent: 200,
              diameterRatio: 2,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
          )
      ),
    );
  }
}

void main() => runApp(MyApp());
