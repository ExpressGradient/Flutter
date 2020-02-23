import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Post> fetchPost() async {
  final response = await http.get("https://jsonplaceholder.typicode.com/posts/22");

  if(response.statusCode == 200) {
    return Post.fromJSON(json.decode(response.body));
  } else {
    throw Exception("Failed to fetch Post from jsonplaceholder.typicode.com");
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']
    );
  }
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    final String appTitle = "Fetch Post";
    return MaterialApp(
        title: appTitle,
        home: Scaffold(
            appBar: AppBar(
              title: Text(appTitle, style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.blueGrey,
            ),
            body: Center(
                child: FutureBuilder<Post>(
                  future: futurePost,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return Text("POST: ${snapshot.data.title} FROM USER_ID: ${snapshot.data.userId}", style: TextStyle(fontSize: 18.0));
                    } else if(snapshot.hasError) {
                      return Text("Post Data not available at the moment due to ${snapshot.error}. Please try again after sometime");
                    }
                    return CircularProgressIndicator();
                  }
                )
            )
        )
    );
  }
}

void main() => runApp(MyApp());
