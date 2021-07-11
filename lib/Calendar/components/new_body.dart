import 'dart:collection';
import '../../splash.dart';
import 'background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:table_calendar/table_calendar.dart';
import 'utils.dart';

class Body extends StatefulWidget {
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<Body> {
  ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _rangeStart;
  DateTime _rangeEnd;
  bool isSameDay(DateTime a, DateTime b) {
    if (a == null || b == null) {
      return false;
    }
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  LinkedHashMap<DateTime, List<Event>> kEvents =
      LinkedHashMap<DateTime, List<Event>>();

  @override
  void initState() {
    super.initState();
    getDriversListCalender().then((results) {
      setState(() {
        querySnapshotCalender = results;
      });
      listFirebase();
      _selectedDay = _focusedDay;
      _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
      _onDaySelected(_selectedDay, _focusedDay);
      _showCalender();
    });

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
    _onDaySelected(_selectedDay, _focusedDay);
    _showCalender();
  }

  // @override
  // void dispose() {
  //   _selectedEvents.dispose();
  //   super.dispose();
  // }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    // if (isSameDay(_selectedDay, selectedDay)) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _rangeStart = null; // Important to clean those
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });
    _selectedEvents.value = _getEventsForDay(selectedDay);
    // }
  }

  Future<void> _launchInApp(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  QuerySnapshot querySnapshotCalender;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Row(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  iconSize: 33.0,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ), // Online calendar-bro
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Image.asset(
                "assets/new_icons/Online calendar-bro.png",
                height: size.height * 0.25,
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                "Calendar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              SizedBox(height: size.height * 0.01),
            ],
          ),
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(color: Colors.orange),
                selectedDecoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                todayTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white)),
            onDaySelected: _onDaySelected,
            headerStyle: HeaderStyle(
              rightChevronIcon: Icon(Icons.arrow_right),
              leftChevronIcon: Icon(Icons.arrow_left),
              // centerHeaderTitle: true,
              formatButtonDecoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20.0),
              ),
              formatButtonTextStyle: TextStyle(color: Colors.white),
              formatButtonShowsNext: false,
            ),
            // onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            calendarBuilders: CalendarBuilders(
              selectedBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
              todayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 5.0),
          _showCalender(),
        ],
      ),
    );
  }

  getDriversListCalender() async {
    return await FirebaseFirestore.instance.collection('calender').get();
  }

  List listFirebase() {
    List lis = [];
    if (querySnapshotCalender != null) {
      for (int q = 0; q < querySnapshotCalender.docs.length; q++) {
        lis.add(querySnapshotCalender.docs[q]['arr']);
        print(querySnapshotCalender.docs[q]['arr']);
      }
      print(lis);
      kEvents = popEventSource(lis);
      print("i am not empty");
      // return lis;
    } else {
      print("I am empty");
    }
    // print(querySnapshotCalender.docs[0].get('arr'));
  }

  Widget _showCalender() {
    return Expanded(
      child: ValueListenableBuilder<List<Event>>(
        valueListenable: _selectedEvents,
        builder: (context, value, _) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              print("+++++++++++++++++++++++++");
              print(_selectedEvents);
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  onTap: () => _launchInApp(
                    '${value[index]}'.split(";")[1],
                  ),
                  title: Text(
                    '${value[index]}'.split(";")[0],
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
