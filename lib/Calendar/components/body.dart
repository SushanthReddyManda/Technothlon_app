import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_technothlon/Calendar/components/utils.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../splash.dart';
import 'background.dart';
import 'utils.dart';
// import 'package:table_calendar/src/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _controller = CalendarController();
    _events = {};
    _selectedEvents = [];
  }

  @override
  Widget build(BuildContext context) {
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
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //SizedBox(height: size.height * 0.05),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                // TableCalendar(
                //   initialCalendarFormat: CalendarFormat.month,
                //   calendarStyle: CalendarStyle(
                //       todayColor: Colors.orange,
                //       selectedColor: Theme.of(context).primaryColor,
                //       todayStyle: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 18.0,
                //           color: Colors.white)),
                //   headerStyle: HeaderStyle(
                //     rightChevronIcon: Icon(Icons.arrow_right),
                //     leftChevronIcon: Icon(Icons.arrow_left),
                //     centerHeaderTitle: true,
                //     formatButtonDecoration: BoxDecoration(
                //       color: Colors.orange,
                //       borderRadius: BorderRadius.circular(20.0),
                //     ),
                //     formatButtonTextStyle: TextStyle(color: Colors.white),
                //     formatButtonShowsNext: false,
                //   ),
                //   //startingDayOfWeek: StartingDayOfWeek.monday,
                //   // startingDayOfWeek: StartingDayOfWeek.monday,
                //   // onDaySelected: (date, events) {
                //   //   setState(() {
                //   //     _selectedEvents = events;
                //   //   });
                //   // },
                //   builders: CalendarBuilders(
                //     selectedDayBuilder: (context, date, events) => Container(
                //         margin: const EdgeInsets.all(4.0),
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //             color: Theme.of(context).primaryColor,
                //             borderRadius: BorderRadius.circular(10.0)),
                //         child: Text(
                //           date.day.toString(),
                //           style: TextStyle(color: Colors.white),
                //         )),
                //     todayDayBuilder: (context, date, events) => Container(
                //         margin: const EdgeInsets.all(4.0),
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //             color: Colors.orange,
                //             borderRadius: BorderRadius.circular(10.0)),
                //         child: Text(
                //           date.day.toString(),
                //           style: TextStyle(color: Colors.white),
                //         )),
                //   ),
                //   calendarController: _controller,
                // ),
                // calendarController: _controller,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// // ============================================================================================================================

// class Body extends StatefulWidget {
//   @override
//   _TableEventsExampleState createState() => _TableEventsExampleState();
// }
//
// class _BodyState extends State<Body> {
//   ValueNotifier<List<Event>> _selectedEvents;
//   CalendarFormat _calendarFormat =
//       CalendarFormat.month; // Can be toggled on/off by longpressing a date
//   DateTime _focusedDay = DateTime.now();
//   DateTime _selectedDay;
//   DateTime _rangeStart;
//   DateTime _rangeEnd;
//   // List listFirebase;
//   bool isSameDay(DateTime a, DateTime b) {
//     if (a == null || b == null) {
//       return false;
//     }
//     return a.year == b.year && a.month == b.month && a.day == b.day;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedDay = _focusedDay;
//     _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
//     // getDriversListCalender().then((results) {
//     //   setState(() {
//     //     querySnapshotCalender = results;
//     //   });
//     // });
//     // getDriversListCalender().then((results) {
//     //   setState(() {
//     //     querySnapshotCalender = results;
//     //   });
//     // if (querySnapshotCalender != null) {
//     //   for (int i = 0; i < querySnapshotCalender.docs.length; i++) {
//     //     return listFirebase.add(querySnapshotCalender.docs[i]);
//     //   }
//     // } else {
//     //   Center(
//     //     child: CircularProgressIndicator(),
//     //   );
//     // }
//     // });
//   }
//
//   @override
//   void dispose() {
//     _selectedEvents.dispose();
//     super.dispose();
//   }
//
//   List<Event> _getEventsForDay(DateTime day) {
//     // Implementation example
//     return kEvents[day] ?? [];
//   }
//
//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _focusedDay = focusedDay;
//         _rangeStart = null; // Important to clean those
//         _rangeEnd = null;
//       });
//
//       _selectedEvents.value = _getEventsForDay(selectedDay);
//     }
//   }
//
//   QuerySnapshot querySnapshotCalender;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TableCalendar - Events'),
//       ),
//       body: Column(
//         children: [
//           TableCalendar<Event>(
//             firstDay: kFirstDay,
//             lastDay: kLastDay,
//             focusedDay: _focusedDay,
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             rangeStartDay: _rangeStart,
//             rangeEndDay: _rangeEnd,
//             calendarFormat: _calendarFormat,
//             eventLoader: _getEventsForDay,
//             startingDayOfWeek: StartingDayOfWeek.monday,
//             calendarStyle: CalendarStyle(
//               // Use `CalendarStyle` to customize the UI
//               outsideDaysVisible: false,
//             ),
//             onDaySelected: _onDaySelected,
//             // onRangeSelected: _onRangeSelected,
//             onFormatChanged: (format) {
//               if (_calendarFormat != format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               }
//             },
//             onPageChanged: (focusedDay) {
//               _focusedDay = focusedDay;
//             },
//           ),
//           const SizedBox(height: 8.0),
//           // Expanded(
//           //   child: ValueListenableBuilder<List<Event>>(
//           //     valueListenable: _selectedEvents,
//           //     builder: (context, value, _) {
//           //       return ListView.builder(
//           //         itemCount: value.length,
//           //         itemBuilder: (context, index) {
//           //           return Container(
//           //             margin: const EdgeInsets.symmetric(
//           //               horizontal: 12.0,
//           //               vertical: 4.0,
//           //             ),
//           //             decoration: BoxDecoration(
//           //               border: Border.all(),
//           //               borderRadius: BorderRadius.circular(12.0),
//           //             ),
//           //             child: ListTile(
//           //               onTap: () => print('${value[index + 1]}'),
//           //               title: Text('${value[index]}'),
//           //             ),
//           //           );
//           //         },
//           //       );
//           //     },
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
//
//   getDriversListCalender() async {
//     return await FirebaseFirestore.instance.collection('calender').get();
//   }
// }
