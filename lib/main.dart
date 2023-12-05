import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color(0xfff93e6e),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerWidget(),
            Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2.0),
                    borderRadius: BorderRadius.circular(10.0)),
                child: SizedBox(
                    child: TextButton(
                        onPressed: null,
                        child: Text('START',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25)))))
          ],
        ),
      ),
    );
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
  });


  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  var timer = 25*60*1000;

  String milToString(int millis) {
    var minutes = millis / 60000;
    var seconds = millis % 60000;

    return '00:'+ format(minutes) + ':' + format(seconds);
  }

  String format (dynamic t) {
    final f = NumberFormat("00");
    return f.format(t);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.circular(10.0)),
        child: SizedBox(
            width: 100.0,
            child: Text(milToString(timer),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25))));
  }
}

