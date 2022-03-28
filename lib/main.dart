import 'package:flutter/material.dart';
import 'package:mersal/chat.dart';
import 'package:http/http.dart' as http;

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

    final TextEditingController username = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController email = TextEditingController();
  
    postData() async {
        var response = await http.post(
            Uri.parse('http://localhost:1323/signup'),
            body:{
                "username": username.text,
                "password": password.text,
                "email":    email.text
            },
        );
        if (response.statusCode == 200) {

            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ChatPage(title: 'chat page')),
            );

            print("success:\n ${response.statusCode}");
            // redirect to home or login page
        }else {
            print("status code: ${response.statusCode}");
        }
    }
    
    void whenPostData() {setState(() {});}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(      
        padding: const EdgeInsets.all(30),
        child: Column(
           children: <Widget>[
            const Text("username"),
            TextField(controller: username,),
            const Text("email"),
            TextField(controller: email,),
            const Text("password"),
            TextField(controller: password,),
            ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: postData,
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
