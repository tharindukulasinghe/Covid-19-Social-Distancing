import 'dart:convert';

import 'package:ble/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => new _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  User user = User();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Registration'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: _formKey,
            child: new ListView(
              children: <Widget>[
                new Container(
                    padding: new EdgeInsets.all(20.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlutterLogo(
                          size: 100.0,
                        ),
                      ],
                    )),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Enter your username';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          user.username = newValue;
                        }, // Use email input type for emails.
                        decoration: new InputDecoration(
                          hintText: 'User Name',
                          labelText: 'Enter your user name',
                          icon: new Icon(Icons.person),
                        ))),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Enter your address';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          user.address = newValue;
                        }, // Use email input type for emails.
                        decoration: new InputDecoration(
                          hintText: 'Address',
                          labelText: 'Enter your Address',
                          icon: new Icon(Icons.home),
                        ))),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Enter your Bluetooth ID';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          user.bluetoothId = newValue;
                        }, // Use email input type for emails.
                        decoration: new InputDecoration(
                          hintText: 'Bluetooth ID',
                          labelText: 'Enter Bluetooth ID',
                          icon: new Icon(Icons.bluetooth),
                        ))),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Enter your email';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          user.email = newValue;
                        }, // Use email input type for emails.
                        decoration: new InputDecoration(
                            hintText: 'you@example.com',
                            labelText: 'E-mail Address',
                            icon: new Icon(Icons.email)))),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      height: 50.0,
                      width: 210.0,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 40.0),
                      child: new RaisedButton(
                        child: new Text(
                          'Register',
                          style: new TextStyle(color: Colors.white),
                        ),
                        onPressed: () => save(),
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  save() async {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

      _formKey.currentState.save();

      print(jsonEncode(user));
      bool result = await createUser(user);
      if (result) {
        Navigator.pushNamed(context, '/settings');
      }
    }
  }

  Future<bool> createUser(User user) async {
    final http.Response reponse = await http.post(
      'http://10.0.2.2:3011/api/user/new',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );

    if (reponse.statusCode == 200) {
      Navigator.pushNamed(context, '/home');
      return true;
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error')));
      return false;
    }
  }
}
