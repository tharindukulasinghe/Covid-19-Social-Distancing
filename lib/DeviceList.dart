import 'dart:convert';
import 'package:flutter/material.dart';

import 'models/User.dart';
import 'package:http/http.dart' as http;

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var users = new List<User>();

  _getUsers() {
    http.get('https://jsonplaceholder.typicode.com/users').then((value) => {
          setState(() {
            Iterable list = json.decode(value.body);
            print(list.length);
            users = list.map((model) => User.fromJson(model)).toList();
          })
        });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Close Contacts"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(users[index].name));
          },
        ));
  }
}
