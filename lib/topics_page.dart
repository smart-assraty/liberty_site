import 'package:flutter/material.dart';
import 'backend_connector.dart' as bc;
import 'topic.dart';
import 'main.dart';

bc.BackendConnector _backendConnector = bc.BackendConnector();

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
        body: FutureBuilder(
          builder: ((context, AsyncSnapshot<bc.TopicList> snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == null) {
              return const CircularProgressIndicator();
            } else {
              return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(Icons.abc, size: 200),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            snapshot.data!.name,
                            style: const TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ));
            }
          }),
          future: _backendConnector.initialRequest(),
        ));
  }
}
