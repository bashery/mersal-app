import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ChatPage> createState() => _ChatState();
}


class _ChatState extends State<ChatPage> {

    final TextEditingController chatFeild = TextEditingController();
  
   
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
            TextField(controller: chatFeild,),
            ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>print("send"),
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
