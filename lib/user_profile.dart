import 'package:flutter/material.dart';
import 'package:mersal/chat.dart';
import 'package:mersal/contacts.dart';


class UserProfile extends StatefulWidget {

   final User user;
   const UserProfile({Key? key, required this.user}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}


class _UserProfileState extends State<UserProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.user.username),
      ),
      body:       
        //padding: const EdgeInsets.all(30),
        Column(
           children: <Widget>[
            Image.network(
            widget.user.urlAvarar,height: 400,width: double.infinity,fit:BoxFit.cover,
            ),
            Text(widget.user.username,style: const TextStyle(fontSize: 40,fontWeight:FontWeight.bold)),
            Text(widget.user.email),
             Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                child:  ElevatedButton(
                  style:null, 
                  child: const Text("message"),
                  onPressed: ()=> toChat(),
               ),
             ),
           ],
      ),
    );
  }

  void toChat(){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => const ChatPage()));
  }
  void whenPostData() {setState(() {});}
}


