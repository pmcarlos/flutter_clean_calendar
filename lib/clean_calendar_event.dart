import 'package:flutter/material.dart';

class CleanCalendarEvent {
  String summary;
  String description;
  String location;
  DateTime startTime;
  Color color;
  bool isAllDay;
  bool isDone;
  String eventId;

  CleanCalendarEvent(this.summary,
      {this.description = '',
      this.location = '',
      required this.startTime,
      this.color = Colors.blue,
      this.isAllDay = false,
      this.isDone = false,
      required this.eventId
      });
}
