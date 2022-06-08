import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_html/flutter_html.dart';
import 'package:liberty_site/topics_page.dart';

String buffStr = '';

class MDTopic extends StatelessWidget {
  final TopicName topicName;
  const MDTopic.withTopic({super.key, required this.topicName});

  @override
  Widget build(BuildContext context) {
    final File file = File(topicName.path);
    buffStr = readFile(file);

    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            topicName.name,
            style: const TextStyle(color: Colors.white),
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

String readFile(File file) {
  try {
    final String contents = file.readAsStringSync();
    return contents;
  } catch (e) {
    var result = e.hashCode;
    return result.toString();
  }
}
