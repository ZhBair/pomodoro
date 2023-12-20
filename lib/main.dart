import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (context){"";} )
    ],
    child: const MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '«Баклажан»',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color(0xFF151026),
        appBarTheme: const AppBarTheme(
        color: Color(0xFF151026)
        )
      ),

      home: const MyHomePage(title: 'Техника «Баклажана»'),
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
  ValueNotifier valuepressbutton = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableProvider.value(value: valuepressbutton, child: TimerWidget()),
            Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 3.0, color: Colors.white),
                    borderRadius: BorderRadius.circular(25.0),
                ),
                child: SizedBox(
                  child: TextButton(
                    onPressed: () {
                      valuepressbutton.value(true);
                    }, // start timer
                    child: const Text(
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
  late bool valueNotifier;

  @override
  void initState() {
    super.initState();
    valueNotifier = Provider.of<bool>(context, listen: true);
  }

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
    if (valueNotifier == true) {
      Timer.periodic(const Duration(seconds: 1), (timer2) {
        print(timer2.tick);
        timer = timer - (timer2.tick * 1000);
        if (timer < 0) {
          print('Cancel timer');
          timer2.cancel();
        }
        setState(() {

        });
      });
    }
    return Container(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
            width: 250.0,
            child: Text(milToString(timer),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
            ),
        ),
    );
  }
}

