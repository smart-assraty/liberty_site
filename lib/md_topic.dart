import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

String buffStr = '';

io.Socket socket = io.io('https://localhost:8080');

class MDTopic extends StatelessWidget {
  const MDTopic.withTopic({super.key});

  @override
  Widget build(BuildContext context) {
    socket.onConnect((data) {
      print('connect');
      socket.emit('msg', 'test');
    });
    socket.on('event', (data) => print(data));
    socket.onDisconnect((_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));

    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "topicName.name",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black54,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Center(
                child: Html(
              data: buffStr,
            )),
          )),
    );
  }
}
