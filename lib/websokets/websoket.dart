import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:websocket/websokets/formWidget.dart';

class websoket extends StatefulWidget {
  const websoket({super.key});

  @override
  State<websoket> createState() => _websoketState();
}

class _websoketState extends State<websoket> {
  final TextEditingController _controller = TextEditingController();
  
  final WebSocketChannel channel = WebSocketChannel.connect(
     Uri.parse('ws://localhost:8080/ws/websocket'), );
     void _sendMessage() {
       if (_controller.text.isNotEmpty) { 
        channel.sink.add(_controller.text);
  } }
  @override
  void dispose() { 
   // channel.sink.close(status.goingAway);
     super.dispose(); 
     
     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[400],
        onPressed: (){
    _sendMessage();
    
      }, tooltip: 'Send Message', child: Icon(Icons.send, color: Colors.white, size: 35,),),
      appBar: AppBar(
        title: Text("Websocket", style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, 
        ),),
        backgroundColor: Colors.teal[400],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 11, vertical: 15),
        child: Column(
          children: [
           Form(child: formWidget(
            mycontroller: _controller,
           ))
          ],
        ),
      ),
    );
  }
}