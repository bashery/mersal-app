import 'package:flutter/material.dart';
import 'package:mersal/chat.dart';
import 'package:mersal/join.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserProfile> createState() => _UserProfileState();
}


class _UserProfileState extends State<UserProfile> {
   

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
            const Text("email"),
             Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                child:  ElevatedButton(
                  style:null, 
                  child: const Text("register"),
                  onPressed: ()=> toChat(),
               ),
             ),
           ],
        ),
      ),
    );
  }

  void toChat(){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => const ChatPage()));
  }
  void whenPostData() {setState(() {});}
}


