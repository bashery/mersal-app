import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class Message {
    final String text;
    final DateTime date;
    final bool byMe;

    const Message({
        required this.text,
        required this.date,
        required this.byMe,

    });
}

class ChatPage extends StatefulWidget {
   const ChatPage({Key? key}) : super(key: key);

  //final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

    ScrollController scrollController =  ScrollController();
    final TextEditingController  message  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),

      body: Column(
        children: [
            Expanded(child: GroupedListView<Message, DateTime>(
                padding: const EdgeInsets.all(8),
                elements: messages,
                groupBy: (msg) => DateTime(msg.date.year, msg.date.month, msg.date.day),
                useStickyGroupSeparators: true,
                floatingHeader: true,
                groupHeaderBuilder: (Message message) =>  SizedBox(
                    height: 40,
                    child: Center(
                        child: Card(
                            color: Colors.red,
                            child: Padding(padding: const EdgeInsets.all(8),
                                child: Text(DateFormat.yMMMd().format(message.date),
                                    style: const TextStyle(color:Colors.white),),
                            ),
                        ),
                    ),
                ),
                itemBuilder: (context, Message message) =>
                Align(
                    alignment:message.byMe ? Alignment.centerRight : Alignment.centerLeft,  
                    child: Card(
                      elevation: 8,
                      child: Padding(padding:const EdgeInsets.all(12), child: Text(message.text),),
                    ),
                ),

            ),
        ),
        Container(
            color: Colors.grey.shade300,
            child:  TextField(
                decoration: const InputDecoration(contentPadding: EdgeInsets.all(12),
                hintText: 'type message here',
                ),
                onSubmitted: (text) {
                    final msg = Message(text: text, date: DateTime.now(), byMe: true);
                    setState(() {
                        messages.add(msg);
                        scrollUp();
                    });
                },
            ),
        ),
        ],
      ),
      ); 
  }


  void scrollUp() {
    final end = scrollController.position.maxScrollExtent;
    scrollController.jumpTo(end);
    
  }
}


List<Message> messages = [
Message(text: "hello",        date:DateTime.parse('2022-03-20 00:00'),byMe: true),
Message(text: "hi",           date:DateTime.parse('2022-03-20 00:00'),byMe: false),
Message(text: "How are u?",   date:DateTime.parse('2022-03-20 00:00'),byMe: true),
Message(text: "fine",         date:DateTime.parse('2022-03-20 00:00'),byMe: true),
Message(text: "are you ok?",  date:DateTime.parse('2022-03-20 00:00'),byMe: false),
Message(text: "littel bit",   date:DateTime.parse('2022-03-20 00:01'),byMe: false),
Message(text: "than not gool",date:DateTime.parse('2022-03-20 00:01'),byMe: true),
Message(text: "sure ?",       date:DateTime.parse('2022-03-20 00:01'),byMe: false),
Message(text: "yeah!",        date:DateTime.parse('2022-04-20 00:01'),byMe: true),
Message(text: "do you speak", date:DateTime.parse('2022-04-20 01:02'),byMe: false),
Message(text: "I speak ar v", date:DateTime.parse('2022-04-20 01:00'),byMe: true),
Message(text: "thats cool",   date:DateTime.parse('2022-04-20 01:00'),byMe: false),
Message(text: "I speak ar v", date:DateTime.parse('2022-04-20 01:00'),byMe: true),
Message(text: "thats cool",   date:DateTime.parse('2022-04-20 01:00'),byMe: false),
Message(text: "I speak ar v", date:DateTime.parse('2022-04-20 01:00'),byMe: true),
Message(text: "thats cool",   date:DateTime.parse('2022-04-20 01:00'),byMe: false),
Message(text: "I speak ar v", date:DateTime.parse('2022-04-20 01:00'),byMe: true),
Message(text: "thats cool",   date:DateTime.parse('2022-04-20 01:00'),byMe: false),
];


