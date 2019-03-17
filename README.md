# flutter_clean_calendar

A new Flutter package project.

## Properties

```
{ onDateSelected: function, //receives a DateTime 
  onRangeSelected: function, //receives to, from as DateTime 
  isExpandable: bool, //can expand 
  dayBuilder: (BuildContext context, DateTime day) {}, //return inside a widget to render 
  showArrows: bool, //show arrows to change month/week 
  showTodayIcon: bool, //show today icon to focus calendar on today 
  events: Map, //map of events to display bullets on each day with events 
  selectedColor: Color, //set the circle background for selected day if not uses the primaryColor 
  eventColor: Color, //set the event dot color, if not uses the accentColor
}
```


