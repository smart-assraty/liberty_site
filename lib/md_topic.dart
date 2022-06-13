import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

String buffStr = '';

String url = "http://127.0.0.1:8080/";
Uri _uri = Uri.parse(url);

class MDTopic extends StatelessWidget {
  const MDTopic.withTopic({super.key});

  Future<String> getRequest() async {
    final response = await http.get(_uri);
    if (response == null) {
      return "response is null";
    } else {
      return response.body;
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    getRequest().then((value) => buffStr = value);

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
                child: Html(
              data: buffStr,
            )),
          )),
    );
  }
}
