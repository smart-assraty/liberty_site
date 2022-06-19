import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'backend_connector.dart' as bc;

bc.BackendConnector _backendConnector = bc.BackendConnector();

class Topic extends StatelessWidget {
  late String name;
  Topic({super.key, required String topicName}) {
    name = topicName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black54,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Center(
                child: FutureBuilder(
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData == true &&
                    snapshot.data != null) {
                  return Html(data: snapshot.data);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
              future: _backendConnector.getTopicRequest(name),
            )),
          )),
    );
  }
}
