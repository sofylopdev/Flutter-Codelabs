import 'package:flutter/material.dart';

const String _name = "Sofia";

void main() {
  runApp(new FriendlychatApp());
}

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Friendlychat")),
        body: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            new Divider(
              height: 1.0,
            ),
            new Container(
              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            )
          ],
        ));
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => _handleSubmitted(_textController.text),
              )),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
          duration: new Duration(milliseconds: 900), vsync: this),
    );
    setState(() {
      _messages.insert(0, message);
    });
    //animation should play forward whenever a new message is added to the chat list
    message.animationController.forward();
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
  final String text;

  final AnimationController animationController;

  ChatMessage({this.text, this.animationController});

  @override
  Widget build(BuildContext context) {
    return //new FadeTransition(
        //opacity: new CurvedAnimation(
        // parent: animationController, curve: Curves.easeIn),
        new SizeTransition(
            sizeFactor: new CurvedAnimation(
                parent: animationController, curve: Curves.elasticOut),
            axisAlignment: 0.0,
            child: new Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                        margin: EdgeInsets.only(right: 16.0),
                        child: new CircleAvatar(
                          child: Text(_name[0]),
                        )),
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          _name,
                          style: Theme.of(context).textTheme.subhead,
                        ),
                        new Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: new Text(text),
                        )
                      ],
                    )
                  ],
                )));
  }
}
