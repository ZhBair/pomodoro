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
      title: '«Помидор»',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color(0xFF151026),
        appBarTheme: AppBarTheme(
        color: const Color(0xFF151026)
        )
      ),

      home: const MyHomePage(title: 'Техника «Помидора»'),
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
        centerTitle: true,
        title: Text(widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerWidget(),
            Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.white),
                    borderRadius: BorderRadius.circular(45.0),
                ),
                child: SizedBox(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                        'START',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                    ),
                  ),
                ))
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
  var timer = 25 * 60 * 1000;

  String milToString(int millis) {
    var minutes = millis / 60000;
    var seconds = millis % 60000;

    return '00:' + format(minutes) + ':' + format(seconds);
  }

  String format(dynamic t) {
    final f = NumberFormat("00");
    return f.format(t);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.0),
        child: SizedBox(
            width: 250.0,
            child: Text(milToString(timer),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 55,
                    color: Colors.white
                ),
            ),
        ),
    );
  }
}
