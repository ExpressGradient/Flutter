import 'package:flutter/material.dart';

class ScreenArgument {
  final String username;
  ScreenArgument(this.username);
}

class HomePage extends StatelessWidget {
  static const routeName = "/homePage";

  @override
  Widget build(BuildContext context) {
    final ScreenArgument argument = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text("Welcome ${argument.username}", style: TextStyle(fontSize: 15.0))
      )
    );
  }
}

class LoginPage extends StatelessWidget {
  static const routeName = "/";
  LoginPage({this.usernameController, this.passwordController, this.onChanged, this.formKey});
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final onChanged;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Container(
              child:TextFormField(
                  cursorColor: Colors.blueGrey,
                  decoration: InputDecoration(
                    labelText: "Enter your Username",
                    labelStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16.5
                    ),
                  ),
                  style: TextStyle(
                      fontSize: 19.0
                  ),
                  controller: usernameController,
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Please enter the correct key.";
                    } else {
                      return null;
                    }
                  }
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12.0)
            ),
            Container(
              child:TextFormField (
                  cursorColor: Colors.blueGrey,
                  decoration: InputDecoration(
                    labelText: "Enter your Password",
                    labelStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16.5
                    ),
                  ),
                  style: TextStyle(
                      fontSize: 19.0
                  ),
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if(value.isEmpty) {
                      return "Please enter the correct key.";
                    } else {
                      return null;
                    }
                  }
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12.0)
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              child: RaisedButton(
                child: Text(
                  "Validate",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blueGrey,
                onPressed: () {
                  if(formKey.currentState.validate()){
                    onChanged();
                    Navigator.pushNamed(context, HomePage.routeName, arguments: ScreenArgument(usernameController.text));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _clearPassword() {
    setState(() => passwordController.text = "");
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => LoginPage(
          usernameController: usernameController,
          passwordController: passwordController,
          onChanged: _clearPassword,
          formKey: _formKey
        ),
        HomePage.routeName: (context) => HomePage()
      }
    );
  }
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

void main() => runApp(MyApp());
