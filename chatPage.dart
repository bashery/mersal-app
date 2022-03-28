

class ChatPageState extends State<MyHomePage> {

   

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
