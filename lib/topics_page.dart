import 'package:flutter/material.dart';
import 'md_topic.dart';
import 'main.dart';

class TopicsPageApp extends StatelessWidget {
  const TopicsPageApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liberty site',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        '/main': (context) => const MyHomePage(),
        '/maqalalar': (context) => const TopicsPage(),
      },
      home: const TopicsPage(),
    );
  }
}

class TopicsPage extends StatefulWidget {
  const TopicsPage({Key? key}) : super(key: key);

  @override
  State<TopicsPage> createState() => _TopicsPage();
}

class _TopicsPage extends State<TopicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //automaticallyImplyLeading: false,
            backgroundColor: Colors.black54,
            title: const Center(
              child: Text('Libertarian site'),
            )),
        body: Row(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(80, 10, 80, 0),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(
                        Icons.abc,
                        size: 200,
                      ),
                      OutlinedButton(
                        onPressed: (() => print("object")), //() {
                        //Navigator.push(
                        //  context,
                        //MaterialPageRoute(
                        //  builder: ((context) =>
                        //    MDTopic.withTopic(topicName: topicOne))));
                        //},
                        child: const Text(
                          "asdfs",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(Icons.abc, size: 200),
                      OutlinedButton(
                        onPressed: (() => print("object")), // () {
                        //Navigator.push(
                        //  context,
                        //MaterialPageRoute(
                        //  builder: ((context) =>
                        //    MDTopic.withTopic(topicName: topicTwo))));
                        //},
                        child: const Text(
                          "adsfasdf",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
