import 'package:flutter/material.dart';
//import 'package:mersal/chat.dart';
//import 'package:mersal/contacts.dart';
//import 'package:http/http.dart' as http;
import 'package:mersal/join.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mersal app',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Messanger'),
    );
  }
}


