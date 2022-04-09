import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
   const Contacts({Key? key}) : super(key: key);

  //final String title;

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),

      body: ListView.builder(

        itemCount:7,
        itemBuilder: (context, index) =>   Card(
            child: ListTile(
                leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage("http://placeimg.com/100/100/faces/$index"),

                ),
                title:  Text("Username $index"),
                subtitle: Text("email $index"),
                trailing: const Icon(Icons.arrow_forward) ,
            ),
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

class User {
    final String username;
    final String email;
    final String urlAvarar;

    const User({
        required this.username,
        required this.email,
        required this.urlAvarar,
    });
}
 
List<User> users = [
    const User(
            username: "sarah",
            email: "sarah@email.com",
            urlAvarar: "http://placeimg.com/300/340/faces/"
    ),
    const User(
            username: "sarah",
            email: "sarah@email.com",
            urlAvarar: "http://placeimg.com/300/340/faces/"
    ),
    const User(
            username: "sarah",
            email: "sarah@email.com",
            urlAvarar: "http://placeimg.com/300/340/faces/"
    ),
    const User(
            username: "sarah",
            email: "sarah@email.com",
            urlAvarar: "http://placeimg.com/300/340/faces/"
    ),
    const User(
            username: "sarah",
            email: "sarah@email.com",
            urlAvarar: "http://placeimg.com/300/340/faces/"
    ),
    const User(
            username: "sarah",
            email: "sarah@email.com",
            urlAvarar: "http://placeimg.com/300/340/faces/"
    ),
     const User(
            username: "sarah",
            email: "",
            urlAvarar: "http://placeimg.com/300/340/faces/"
    ),

];


