import 'package:http/http.dart' as http;

String url = "http://192.168.1.88:80/";

class BackendConnector {
  BackendConnector();
  String buffString = "";

  Future<String> getTopicRequest(String name) async {
    Uri uri = Uri.parse("$url$name");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      buffString = response.body;
      return buffString;
    } else {
      String status = response.statusCode as String;
      return status;
    }
  }

  TopicList initialResponse(String response) {
    final parsed = TopicList.fromJson(response);
    return parsed;
  }

  Future<TopicList> initialRequest() async {
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    TopicList json = initialResponse(response.body);
    return json;
  }
}

class TopicList {
  late String name;
  late String theme;
  TopicList({required String name, required String theme});

  factory TopicList.fromJson(dynamic json) {
    return TopicList(
        name: json['name'] as String, theme: json['theme'] as String);
  }

  String getName() {
    return name;
  }
}
