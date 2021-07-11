import 'package:flutter/material.dart';
import 'components/new_body.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // body: initializeDateFormatting().then((_) => runApp(TableEventsExample()));
      // body: Body(),
      body: Body(),
    );
  }
}

//=====================================================================

//
// List<List<dynamic>> listFirebase = [];
//
// /// Example event class.
// class Event {
//   final String title;
//   const Event(this.title);
//   @override
//   String toString() => title;
// }
//
// bool isSameDay(DateTime a, DateTime b) {
//   if (a == null || b == null) {
//     return false;
//   }
//   return a.year == b.year && a.month == b.month && a.day == b.day;
// }
//
// var kEvents = LinkedHashMap<DateTime, List<Event>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )..addAll(_kEventSource);
//
// var _kEventSource = Map.fromIterable(
//   listFirebase,
//   key: (item) => DateTime.utc(item[0], item[1], item[2]),
//   value: (item) => List.generate(
//     item[3], (index) => Event(item[4 + index]),
//     // (index) => Event('Event $item | ${index + 1}'),
//   ),
// );
//
// int getHashCode(DateTime key) {
//   return key.day * 1000000 + key.month * 10000 + key.year;
// }
//
// DateTime kToday = DateTime.now();
// DateTime kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
// DateTime kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
//
// class Calendar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // body: initializeDateFormatting().then((_) => runApp(TableEventsExample()));
//       // body: Body(),
//       body: TableEventsExample(),
//     );
//   }
// }
//
// class TableEventsExample extends StatefulWidget {
//   @override
//   _TableEventsExampleState createState() => _TableEventsExampleState();
// }
//
// class _TableEventsExampleState extends State<TableEventsExample> {
//   ValueNotifier<List<Event>> _selectedEvents;
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
//       .toggledOff; // Can be toggled on/off by longpressing a date
//   DateTime _focusedDay = DateTime.now();
//   DateTime _selectedDay;
//   DateTime _rangeStart;
//   DateTime _rangeEnd;
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
//
//     _selectedDay = _focusedDay;
//     _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
//     getDriversListCalender().then((results) {
//       setState(() {
//         querySnapshotCalender = results;
//       });
//       // print(querySnapshotCalender.docs[0].get('arr'));
//       if (querySnapshotCalender != null) {
//         for (int q = 0; q < querySnapshotCalender.docs.length; q++) {
//           listFirebase.add(querySnapshotCalender.docs[q]['arr']);
//           print(querySnapshotCalender.docs[q]['arr']);
//         }
//         print(listFirebase);
//       } else {
//         Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//     });
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
//         _rangeSelectionMode = RangeSelectionMode.toggledOff;
//       });
//
//       _selectedEvents.value = _getEventsForDay(selectedDay);
//     }
//   }
//
//   Future<void> _launchInApp(String url) async {
//     if (await canLaunch(url)) {
//       await launch(
//         url,
//         forceSafariVC: false,
//         forceWebView: false,
//         headers: <String, String>{'header_key': 'header_value'},
//       );
//     } else {
//       throw 'Could not launch $url';
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
//             rangeSelectionMode: _rangeSelectionMode,
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
//           Expanded(
//             child: ValueListenableBuilder<List<Event>>(
//               valueListenable: _selectedEvents,
//               builder: (context, value, _) {
//                 return ListView.builder(
//                   itemCount: value.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 12.0,
//                         vertical: 4.0,
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       child: ListTile(
//                         onTap: () =>
//                             _launchInApp('${value[index]}'.split(";")[1]),
//                         title: Text(
//                           '${value[index]}'.split(";")[0],
//                           style: TextStyle(
//                               color: Colors.blue, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   getDriversListCalender() async {
//     return await FirebaseFirestore.instance.collection('calender').get();
//   }
//
// }
//==========================================================================================
// import 'dart:collection';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app_technothlon/Calendar/components/body.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'components/background.dart';
// import 'package:flutter_app_technothlon/homeScreen.dart';
// //import 'package:flutter_auth/Screens/Welcome/components/body.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart';
//
// import 'components/utils.dart';

// final lis = ValueNotifier<List>([]);

// class Calendar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // body: initializeDateFormatting().then((_) => runApp(TableEventsExample()));
//       // body: Body(),
//       body: TableEventsExample(),
//     );
//   }
// }

// class TableEventsExample extends StatefulWidget {
//   @override
//   _TableEventsExampleState createState() => _TableEventsExampleState();
// }
//
// class _TableEventsExampleState extends State<TableEventsExample> {
//   ValueNotifier<List<Event>> _selectedEvents;
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
//       .toggledOff; // Can be toggled on/off by longpressing a date
//   DateTime _focusedDay = DateTime.now();
//   DateTime _selectedDay;
//   DateTime _rangeStart;
//   DateTime _rangeEnd;
//   bool isSameDay(DateTime a, DateTime b) {
//     if (a == null || b == null) {
//       return false;
//     }
//     return a.year == b.year && a.month == b.month && a.day == b.day;
//   }
//
//   // LinkedHashMap<DateTime, List<Event>> kEvents;
//
//   @override
//   void initState() {
//     super.initState();
//     getDriversListCalender().then((results) {
//       setState(() {
//         querySnapshotCalender = results;
//       });
//     });
//     _selectedDay = _focusedDay;
//     _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
//   }
//
//   // @override
//   // void dispose() {
//   //   _selectedEvents.dispose();
//   //   super.dispose();
//   // }
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
//         _rangeSelectionMode = RangeSelectionMode.toggledOff;
//       });
//
//       _selectedEvents.value = _getEventsForDay(selectedDay);
//     }
//   }
//
//   Future<void> _launchInApp(String url) async {
//     if (await canLaunch(url)) {
//       await launch(
//         url,
//         forceSafariVC: false,
//         forceWebView: false,
//         headers: <String, String>{'header_key': 'header_value'},
//       );
//     } else {
//       throw 'Could not launch $url';
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
//           // _showCalender(),
//           Expanded(
//             child: ValueListenableBuilder<List<Event>>(
//               valueListenable: _selectedEvents,
//               builder: (context, value, _) {
//                 print("++++++++++++++++++++++++++++++++++++++++++++++++");
//                 print(_selectedEvents);
//                 return ListView.builder(
//                   itemCount: value.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                         horizontal: 12.0,
//                         vertical: 4.0,
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border.all(),
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       child: ListTile(
//                         onTap: () =>
//                             // print(
//                             // "-------------------------------------------"),
//                             _launchInApp('${value[index]}'.split(";")[1]),
//                         title: Text(
//                           '${value[index]}'.split(";")[0],
//                           style: TextStyle(
//                               color: Colors.blue, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   getDriversListCalender() async {
//     return await FirebaseFirestore.instance.collection('calender').get();
//   }
//
//   // Widget _showCalender() {
//   //   if (querySnapshotCalender != null) {
//   //     for (int q = 0; q < querySnapshotCalender.docs.length; q++) {
//   //       list.add(querySnapshotCalender.docs[q]['arr']);
//   //       print(querySnapshotCalender.docs[q]['arr']);
//   //     }
//   //     print(list);
//   //     // MySharedPreferences.instance.setStringList('calendarList', lis ?? "");
//   //     return Expanded(
//   //       child: ValueListenableBuilder<List<Event>>(
//   //         valueListenable: _selectedEvents,
//   //         builder: (context, value, _) {
//   //           print("++++++++++++++++++++++++++++++++++++++++++++++++");
//   //           print(_selectedEvents);
//   //           return ListView.builder(
//   //             itemCount: value.length,
//   //             itemBuilder: (context, index) {
//   //               return Container(
//   //                 margin: const EdgeInsets.symmetric(
//   //                   horizontal: 12.0,
//   //                   vertical: 4.0,
//   //                 ),
//   //                 decoration: BoxDecoration(
//   //                   border: Border.all(),
//   //                   borderRadius: BorderRadius.circular(12.0),
//   //                 ),
//   //                 child: ListTile(
//   //                   onTap: () =>
//   //                       print("-------------------------------------------"),
//   //                   // _launchInApp('${value[index]}'.split(";")[1]),
//   //                   title: Text(
//   //                     '${value[index]}'.split(";")[0],
//   //                     style: TextStyle(
//   //                         color: Colors.blue, fontWeight: FontWeight.bold),
//   //                   ),
//   //                 ),
//   //               );
//   //             },
//   //           );
//   //         },
//   //       ),
//   //     );
//   //   } else {
//   //     return Center(
//   //       child: CircularProgressIndicator(),
//   //     );
//   //   }
//   // }
// }
//
// // }
