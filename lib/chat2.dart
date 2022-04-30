import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:requests/requests.dart';

var url = 'http://localhost:3000';

class ChatPage2 extends StatefulWidget {
  const ChatPage2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ChatPage2> createState() => _ProfileState();
}


class  _ProfileState extends State<ChatPage2> {

    final TextEditingController username = TextEditingController();
  
    postData() async {
        var response = await http.post(
            Uri.parse(url+'/putinfo'),
            body:{
                "data": username.text,
                "colomn": "email",
                "userid": "63",
            },
        );
        if (response.statusCode == 200) {
            //username.text = "";
            print("success code: ${response.statusCode}");             
        } else {
            print("error code: ${response.statusCode} ");
        }


       /*
        var r = await Requests.post(url+'/putinfo',
            body:{
                "data": username.text,
                "colomn": "username",
                "userid": "63",
            },
            // bodyEncoding: RequestBodyEncoding.FormURLEncoded
        );

        r.raiseForStatus();
        if (r.statusCode == 200) {
            //username.text = "";
            print("success code: ${r.statusCode}");             
        } else {
            print("error code: ${r.statusCode} ");
        }
        print(r.content().toString());

 
        */
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

