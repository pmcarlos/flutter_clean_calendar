# flutter_clean_calendar

Simple flutter calendar based on flutter_calendar package.
Thanks to @AppleEducate for his contributions.
You can pull up and down the calendar to show between weekly/monthly calendar.
It shows the number of events for thats specific date.
It shows the already Done events in other color

### Breaking Changes
Changed naming properties from show to hide, i.e. `hideArrows` instead of `showArrows`

![Screenshot](https://github.com/pmcarlos/flutter_clean_Calendar/blob/master/screenshot.png)
![Screenshot](https://github.com/pmcarlos/flutter_clean_Calendar/blob/master/calendar.gif)

## Properties

```
{ onDateSelected: function, //receives a DateTime
  onRangeSelected: function, //receives to, from as DateTime
  isExpandable: bool, //can expand
  dayBuilder: (BuildContext context, DateTime day) {}, //return inside a widget to render
  hideArrows: bool, //show arrows to change month/week
  hideTodayIcon: bool, //show today icon to focus calendar on today
  events: Map, //map of events to display bullets on each day with events
  selectedColor: Color, //set the circle background for selected day if not uses the primaryColor
  todayColor: Color, //set the font color of todays date
  eventColor: Color, //set the event dot color, if not uses the accentColor
  eventDoneColor: Color, //set the event dot color for already Done events, if not uses the accentColor
  dayOfWeekStyle: TextStyle, // Set style for top day of week,
  startOnMonday: bool // false by default, month starts on sunday by default. If set to true please change weekdays
  weekdays: List<String> // replace weekdays naming when starting on monday or to override in another language
}

event List<Map> // add isDone to each event to change color for done events
```

Sample event data

```
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
```
