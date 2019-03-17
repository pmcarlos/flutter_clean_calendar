import 'package:flutter/material.dart';
import './flutter_clean_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym App',
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Map _events = {
    DateTime(2019, 3, 1): ['Event A', 'Event B', 'Event C'],
    DateTime(2019, 3, 4): ['Event A'],
    DateTime(2019, 3, 5): ['Event B', 'Event C'],
    DateTime(2019, 3, 13): ['Event A', 'Event B', 'Event C'],
    DateTime(2019, 3, 15): [
      'Event A',
      'Event B',
      'Event C',
      'Event D',
      'Event E',
      'Event F',
      'Event G'
    ],
    DateTime(2019, 2, 26): ['Event A', 'Event A', 'Event B'],
    DateTime(2019, 2, 18): ['Event A', 'Event A', 'Event B'],
  };

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Clean Calendar'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Calendar(
                events: widget._events,
                onRangeSelected: (range) =>
                    print('Range is ${range.from}, ${range.to}'),
                onDateSelected: (DateTime date) => print('Selected date $date'),
                isExpandable: true,
                showTodayIcon: true,
                selectedColor: Colors.red,
                eventColor: Colors.blue),
          ),
        ],
      ),
    );
  }
}
