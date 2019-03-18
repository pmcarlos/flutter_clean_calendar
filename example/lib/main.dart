import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
  }

  List _selectedEvents;
  DateTime _selectedDay;

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
  void initState() {
    super.initState();
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: Text('Calendario'),
      // ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: Calendar(
                events: _events,
                onRangeSelected: (range) =>
                    print("Range is ${range.from}, ${range.to}"),
                onDateSelected: (date) => _handleNewDate(date),
                isExpandable: true,
                showTodayIcon: true,
              ),
            ),
            _buildEventList()
          ],
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.5, color: Colors.black12),
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
              child: ListTile(
                title: Text(_selectedEvents[index].toString()),
                onTap: () {},
              ),
            ),
        itemCount: _selectedEvents.length,
      ),
    );
  }
}
