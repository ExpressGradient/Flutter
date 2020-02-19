import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _clearInputs() {
    setState(() {
      usernameController.text = "";
      passwordController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            child:TextFormField(
                autocorrect: false,
                autofocus: true,
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
                  if(value != "discoding") {
                    return "Please enter the correct key.";
                  } else if(value.isEmpty) {
                    return "Please enter the key.";
                  } else {
                    return null;
                  }
                }
            ),
          ),
          Container(
            child:TextFormField(
                autocorrect: false,
                autofocus: true,
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
                  if(value != "password") {
                    return "Please enter the correct key.";
                  } else if(value.isEmpty) {
                    return "Please enter the key.";
                  } else {
                    return null;
                  }
                }
            ),
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
                if(_formKey.currentState.validate()){
                  Scaffold
                      .of(context)
                      .showSnackBar(SnackBar(content: Text("Logging In, ${usernameController.text}")));
                  print("Correct Data");
                }
                _clearInputs();
              },
            ),
          ),
        ],
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
          child: LoginForm(),
          margin: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());
