import 'package:flutter/material.dart';
import 'package:liberty_site/md_topic.dart';
import 'topics_page.dart';

TopicName front =
    TopicName('front', '/home/smraty/lbrtrn/liberty_site/lib/front.html');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liberty site',
      theme: ThemeData(
        primaryColor: Colors.grey.shade50,
      ),
      routes: {
        '/main': (context) => const MyHomePage(),
        '/maqalalar': (context) => const TopicsPage(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amberAccent,
        title: Row(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(80, 0, 160, 0),
                child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/main'),
                    child: const Text(
                      'Libertar Qazaq',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ))),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 80, 0),
                child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/maqalalar'),
                    child: const Text(
                      "Maqalalar",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ))),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/maqalalar'),
                    child: const Text(
                      "Kitaptar",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ))),
          ],
        ),
      ),
      body: SafeArea(
        child: MDTopic.withTopic(topicName: front),
      ),
    );
  }
}
