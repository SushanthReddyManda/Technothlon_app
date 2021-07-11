import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_technothlon/Developers/developers.dart';

import 'package:flutter_app_technothlon/configuration.dart';
import '''package:flutter_app_technothlon/FAQ's/faqs.dart''';
import 'package:flutter_app_technothlon/Info/info.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_app_technothlon/AboutUs/welcome_screen.dart';
import 'configuration.dart';
import 'AboutUs/about_us.dart';
import 'package:flutter_app_technothlon/constants.dart';

import 'homeScreen.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // if (Navigator.canPop(context)) {
          //   Navigator.pop(context); // i tried both the way
          //   // Navigator.of(context).pop();
          // } else {
          SystemNavigator.pop();
          // }
          return true;
        },
        child: Container(
          color: leftmenu2,
          padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Image.asset('images/logo.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Technothlon',
                        style: GoogleFonts.varelaRound(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: drawerItems
                    .map((element) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            splashColor: Colors.red,
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => element['page']))
                            },
                            child: Row(
                              children: [
                                Icon(
                                  element['icon'],
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(element['title'],
                                    style: GoogleFonts.varelaRound(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
              Row(
                children: [
                  Icon(
                    Icons.question_answer,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
//              Text('Settings',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  RichText(
                    text: TextSpan(
                      text: "FAQ's",
                      style: GoogleFonts.varelaRound(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => faqs()));
                        },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 2,
                    height: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
//              Text('Developers',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                  RichText(
                    text: TextSpan(
                      text: "Developers",
                      style: GoogleFonts.varelaRound(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Developers()));
                        },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 2,
                    height: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Info",
                      style: GoogleFonts.varelaRound(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => info()));
                        },
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
