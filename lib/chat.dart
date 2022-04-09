import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
   const ChatPage({Key? key}) : super(key: key);

  //final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController  message  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),

      body: Container(      
        padding: const EdgeInsets.all(30),
        child: Column(
           children: <Widget>[
            const Text("message"),
            TextField(controller: message,),
            ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

              onPressed: (() {
                print("pressed button");
              }),
        child: const Icon(Icons.send),
      ), 

    );
  }
}


