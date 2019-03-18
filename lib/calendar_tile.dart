import 'package:flutter/material.dart';
import 'package:date_utils/date_utils.dart';

class CalendarTile extends StatelessWidget {
  final VoidCallback onDateSelected;
  final DateTime date;
  final String dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final bool inMonth;
  final List<String> events;
  final TextStyle dayOfWeekStyles;
  final TextStyle dateStyles;
  final Widget child;
  final Color selectedColor;
  final Color eventColor;

  CalendarTile(
      {this.onDateSelected,
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
      this.eventColor});

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
      int eventCount = 0;
      return InkWell(
        onTap: onDateSelected,
        child: Container(
          decoration: isSelected
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedColor != null
                      ? selectedColor
                      : Theme.of(context).primaryColor,
                )
              : BoxDecoration(),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                Utils.formatDay(date).toString(),
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: inMonth ? Colors.black : Colors.grey),
              ),
              events != null && events.length > 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: events.map((event) {
                        eventCount++;
                        if (eventCount > 3) return Container();
                        return Container(
                          margin:
                              EdgeInsets.only(left: 2.0, right: 2.0, top: 3.0),
                          width: 6.0,
                          height: 6.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: eventColor != null
                                ? eventColor
                                : Theme.of(context).accentColor,
                          ),
                        );
                      }).toList())
                  : Container(),
            ],
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
