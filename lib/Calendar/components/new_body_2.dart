import 'dart:async';
import 'new_body.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
// class Body_2 extends StatefulWidget {
//   final int Id;
//   const Body_2({Key? key, required this.Id}) : super(key: key);
//
//   @override
//   _QuestionsPageState createState() => _QuestionsPageState();
// }
//
// class _QuestionsPageState extends State<Body_2> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   bool isApiCallProcess = false;
//   Timer timer;

// @override
// void initState() {
//   super.initState();
//
// }

// @override
// Widget build(BuildContext context) {
//   return  Scaffold(
//       key: scaffoldKey,
//         child: Expanded(
//               child: ValueListenableBuilder<List<Event>>(
//                 valueListenable: _selectedEvents,
//                 builder: (context, value, _) {
//                   return ListView.builder(
//                     itemCount: value.length,
//                     itemBuilder: (context, index) {
//                       print("+++++++++++++++++++++++++");
//                       print(_selectedEvents);
//                       return Container(
//                         margin: const EdgeInsets.symmetric(
//                           horizontal: 12.0,
//                           vertical: 4.0,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(),
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                         child: ListTile(
//                           onTap: () => _launchInApp(
//                             '${value[index]}'.split(";")[1],
//                           ),
//                           title: Text(
//                             '${value[index]}'.split(";")[0],
//                             style: TextStyle(
//                                 color: Colors.blue, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             );
//   );
// }

// }
