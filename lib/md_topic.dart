import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

String buffStr = '';

String url = "http://127.0.0.1:8080/";
Uri _uri = Uri.parse(url);

class MDTopic extends StatelessWidget {
  const MDTopic.withTopic({super.key});

  Future<String> getRequest() async {
    final response = await http.get(_uri).then((response) {
      buffStr = response.body;
    });
    if (response != null) {
      return response;
    } else {
      return "no data";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "front.html",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black54,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Center(
                child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.none &&
                    snapshot.hasData == null) {
                  return const Text("No connection");
                }
                return Html(data: buffStr);
              },
              future: getRequest(),
            )),
          )),
    );
  }
}
