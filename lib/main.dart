import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextEdit Bug',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'TextEdit Bug'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _previousText = "Nothing w";

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Write some text below, click send and then immediately write some more (bug: field is not cleared!):',
            ),
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: "Nothing was typed yet"),
            ),
            OutlineButton(
                onPressed: () {
                  textEditingController.clear();
                  //FocusScope.of(context).unfocus(); // Poor workaround
                },
                child: Text(
                  'Send',
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)))
          ],
        ),
      ),
    );
  }
}
