import 'package:flutter/material.dart';
//import 'package:mersal/chat.dart';
//import 'package:mersal/contacts.dart';
import 'package:http/http.dart' as http;


var url = 'http://localhost:3000';

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Profile> createState() => _ProfileState();
}


class  _ProfileState extends State<Profile> {

    final TextEditingController username = TextEditingController();
  
    postData() async {
        var response = await http.post(
            Uri.parse(url+'/putinfo'),
            body:{
                "username": username.text,
                "userid": "63",
            },
        );
        if (response.statusCode == 200) {
        // TODO add hint or tost &&
        // redirect to home or login page
            print("success code: ${response.statusCode}");             
        } else {
            print("error code: ${response.statusCode} ");
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
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                controller: username,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText:  'inter your email',
                ),    
            ),
            ),
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


