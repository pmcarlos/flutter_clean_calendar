import 'package:flutter/material.dart';
import 'package:date_utils/date_utils.dart';
import "package:intl/intl.dart";

class CalendarTile extends StatelessWidget {
  final VoidCallback onDateSelected;
  final DateTime date;
  final String dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final bool inMonth;
  final List<Map> events;
  final TextStyle dayOfWeekStyles;
  final TextStyle dateStyles;
  final Widget child;
  final Color selectedColor;
  final Color todayColor;
  final Color eventColor;
  final Color eventDoneColor;

  CalendarTile({
    this.onDateSelected,
    this.date,
    this.child,
    this.dateStyles,
    this.dayOfWeek,
    this.dayOfWeekStyles,
    this.isDayOfWeek: false,
    this.isSelected: false,
    this.inMonth: true,
    this.events,
    this.selectedColor,
    this.todayColor,
    this.eventColor,
    this.eventDoneColor,
  });

  Widget renderDateOrDayOfWeek(BuildContext context) {
    if (isDayOfWeek) {
      return new InkWell(
        child: new Container(
          alignment: Alignment.center,
          child: new Text(
            dayOfWeek,
            style: dayOfWeekStyles,
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: onDateSelected,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: isSelected
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedColor != null
                        ? Utils.isSameDay(this.date, DateTime.now()) ? Colors.red : selectedColor
                        : Theme.of(context).primaryColor,
                  )
                : BoxDecoration(),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  DateFormat("d").format(date),
                  // Utils.formatDay(date)..toString(),
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: isSelected ? Colors.white : Utils.isSameDay(this.date, DateTime.now()) ? todayColor : inMonth ? Colors.black : Colors.grey),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return new InkWell(
        child: child,
        onTap: onDateSelected,
      );
    }
    return new Container(
      child: renderDateOrDayOfWeek(context),
    );
  }
}
