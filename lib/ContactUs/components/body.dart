import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_app_technothlon/ContactUs/components/know_your_reps.dart';
import 'package:flutter_app_technothlon/homeScreen.dart';
//import 'package:flutter_app_technothlon/ContactUs/components/know_your_reps.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_app_technothlon/main.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:async';
import 'dart:convert';
import 'background.dart';
import '../../components/rounded_button.dart';
import '../../constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app_technothlon/configuration.dart';
import 'package:flutter_app_technothlon/splash.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void initState() {
    _getRep();
    super.initState();
  }

  Future<List<Rep>> _getRep() async {
    var data = await rootBundle.loadString('assets/reps.json');
    var jsonData = json.decode(data);

    List<Rep> reps = [];

    for (var x in jsonData) {
      Rep rep = Rep(x["ï»¿Student Name"], x["Contact"], x["Email"], x["City"],
          x["State"], x["Region"]);
      reps.add(rep);
    }

    return reps;
  }

  Set<String> getStatesList(String selzone, List<Rep> data) {
    Set<String> states = new Set();

    for (var x in data) {
      if (x.zone == selzone) {
        states.add(x.state);
      }
    }

    return states;
  }

  Set<String> getCities(String selzone, String selstate, List<Rep> data) {
    Set<String> cities = new Set();

    for (var x in data) {
      if (x.state == selstate && x.zone == selzone) {
        cities.add(x.city);
      }
    }

    return cities;
  }

  String selectedzone = null;
  String selectedstate = null;
  String selectedcity = null;

  Set<String> zones = new Set();
  Set<String> states = new Set();
  Set<String> cities = new Set();
  _launchCaller(String s) async {
    String url = s;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchEmail(String email) async {
    // String email =
    if (await canLaunch("mailto:$email")) {
      await launch("mailto:$email");
    } else {
      throw 'Could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            // SizedBox(height: size.height * 0.01),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                iconSize: 33.0,
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                  //Navigator.push(context, MaterialPageRoute(
                  // builder: (context) => HomePage()
                },
              ),
            ),

            Hero(
              tag: 'hero',
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: size.width * 0.36,
                child: Image.asset('assets/new_icons/Online world-cuate.png'),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            /*            SvgPicture.asset(
                        "assets/icons/chat.svg",
                        height: size.height * 0.45,
                      ),*/
            //SizedBox(height: size.height * 0.05),
            Text(
              "Contact Us",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),

            //=========================  Commenting out City Reps Part ==============================
//             Center(
//               child: Container(
//                 padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
//                 child: Text(
//                   '''Reach out to our City Reps for any queries or doubts
// ''',
//                   style: TextStyle(
//                     //fontWeight: FontWeight.bold,
//                     fontFamily: 'sniglet',
//                     fontSize: 20,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             Text(
//               "Know Your Cityreps",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//             ),
//             SizedBox(height: size.height * 0.03),
//
//             Container(
//               height: size.height * 0.53,
//               child: FutureBuilder(
//                   future: _getRep(),
//                   builder: (BuildContext context, AsyncSnapshot snapshot) {
//                     if (snapshot.data == null) {
//                       return Center(
//                         child: Container(
//                           child: Text("Loading..."),
//                         ),
//                       );
//                     } else {
//                       List<Rep> snapshotcopy = [];
//                       for (var x in snapshot.data) {
//                         snapshotcopy.add(x);
//                       }
//
//                       for (var ob in snapshot.data) {
//                         zones.add(ob.zone);
//                       }
//
//                       return Column(
//                         children: <Widget>[
// //                        SizedBox(
// //                          height: size.height * 0.005
// //                        ),
//                           Container(
//                             height: size.height * 0.08,
//                             padding: EdgeInsets.only(
//                                 left: size.height * 0.02,
//                                 right: size.height * 0.02,
//                                 top: size.height * 0.01),
//                             color: Colors.white,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 Expanded(
//                                   child: DropdownButtonHideUnderline(
//                                     child: ButtonTheme(
//                                       splashColor: Colors.teal,
//                                       alignedDropdown: true,
//                                       child: DropdownButton<String>(
//                                         value: selectedzone,
//                                         iconSize: size.height * 0.04,
//                                         icon: (null),
//                                         style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: size.height * 0.021,
//                                         ),
//                                         hint: Text('Select Zone'),
//                                         onChanged: (String newValue) {
//                                           setState(() {
//                                             selectedzone = newValue;
//                                             states = getStatesList(
//                                                 selectedzone, snapshotcopy);
//                                             selectedstate = null;
//                                             selectedcity = null;
//                                             cities = new Set();
//                                             print(selectedzone);
//                                           });
//                                         },
//                                         items: zones.map((item) {
//                                               return new DropdownMenuItem(
//                                                 child: new Text(item),
//                                                 value: item,
//                                               );
//                                             })?.toList() ??
//                                             [],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: size.height * 0.005),
//                           Container(
//                             height: size.height * 0.08,
//                             padding: EdgeInsets.only(
//                                 left: size.height * 0.02,
//                                 right: size.height * 0.02,
//                                 top: size.height * 0.01),
//                             color: Colors.white,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 Expanded(
//                                   child: DropdownButtonHideUnderline(
//                                     child: ButtonTheme(
//                                       alignedDropdown: true,
//                                       child: DropdownButton<String>(
//                                         value: selectedstate,
//                                         iconSize: size.height * 0.04,
//                                         icon: (null),
//                                         style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: size.height * 0.021,
//                                         ),
//                                         hint: Text('Select State'),
//                                         onChanged: (String newValue) {
//                                           setState(() {
//                                             selectedstate = newValue;
//                                             cities = getCities(selectedzone,
//                                                 selectedstate, snapshotcopy);
//                                             selectedcity = null;
//                                             print(selectedstate);
//                                           });
//                                         },
//                                         items: states.map((item) {
//                                               return new DropdownMenuItem(
//                                                 child: new Text(item),
//                                                 value: item,
//                                               );
//                                             })?.toList() ??
//                                             [],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: size.height * 0.005,
//                           ),
//                           Container(
//                             height: size.height * 0.08,
//                             padding: EdgeInsets.only(
//                                 left: size.height * 0.02,
//                                 right: size.height * 0.02,
//                                 top: size.height * 0.01),
//                             color: Colors.white,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 Expanded(
//                                   child: DropdownButtonHideUnderline(
//                                     child: ButtonTheme(
//                                       alignedDropdown: true,
//                                       child: DropdownButton<String>(
//                                         value: selectedcity,
//                                         iconSize: size.height * 0.04,
//                                         icon: (null),
//                                         style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: size.height * 0.021,
//                                         ),
//                                         hint: Text('Select City'),
//                                         onChanged: (String newValue) {
//                                           setState(() {
//                                             selectedcity = newValue;
//                                             print(selectedcity);
//                                           });
//                                         },
//                                         items: cities.map((item) {
//                                               return new DropdownMenuItem(
//                                                 child: new Text(item),
//                                                 value: item,
//                                               );
//                                             })?.toList() ??
//                                             [],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                               child: Expanded(
//                             child: ListView.builder(
//                                 scrollDirection: Axis.vertical,
//                                 itemCount: snapshot.data.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   if (snapshot.data[index].city != null) {
//                                     if (snapshot.data[index].city ==
//                                         selectedcity) {
//                                       return Center(
//                                         child: Container(
//                                           child: Container(
//                                               height: size.height * 0.16,
//                                               constraints: BoxConstraints(),
//                                               padding: EdgeInsets.all(
//                                                   size.height * 0.03),
//                                               margin: EdgeInsets.fromLTRB(
//                                                   size.height * 0.02,
//                                                   size.height * 0.005,
//                                                   size.height * 0.02,
//                                                   size.height * 0.020),
//                                               decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     blurRadius: 10,
//                                                     offset: Offset(6, 6),
//                                                     color: Color(0xff333333)
//                                                         .withOpacity(1),
//                                                     spreadRadius: -1,
//                                                   )
//                                                 ],
//                                                 borderRadius:
//                                                     BorderRadius.circular(15.0),
//                                                 border: Border.all(
//                                                   color: Colors.white,
//                                                   width: 1.0,
//                                                 ),
//                                               ),
//                                               child: Column(
//                                                   mainAxisSize:
//                                                       MainAxisSize.min,
//                                                   children: [
//                                                     Text(
//                                                       snapshot.data[index].name,
//                                                       style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           fontSize:
//                                                               size.height *
//                                                                   0.030),
//                                                     ),
//                                                     Center(
//                                                       child: Container(
//                                                         child: Text(
//                                                           snapshot.data[index]
//                                                               .contact
//                                                               .toString(),
//                                                           style: TextStyle(
//                                                             //fontWeight: FontWeight.bold
//                                                             fontSize:
//                                                                 size.height *
//                                                                     0.021,
//                                                           ),
//                                                           textAlign:
//                                                               TextAlign.center,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Center(
//                                                       child: Container(
//                                                         child: Text(
//                                                           snapshot.data[index]
//                                                               .email,
//                                                           style: TextStyle(
//                                                             //fontWeight: FontWeight.bold
//                                                             fontSize:
//                                                                 size.height *
//                                                                     0.021,
//                                                           ),
//                                                           textAlign:
//                                                               TextAlign.center,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ])),
//                                         ),
//                                       );
//                                     } else {
//                                       return Container(
//                                         child: SizedBox(
//                                           height: 0,
//                                         ),
//                                       );
//                                     }
//                                   } else {
//                                     return Container(
//                                       child: SizedBox(
//                                         height: 0,
//                                       ),
//                                     );
//                                   }
//                                 }),
//                           )),
// //                        SizedBox(
// //                          height: size.height * 0.005,
// //                        ),
//                         ],
//                       );
//                     }
//                   }),
//             ),

            //========================= End of Commenting out City Reps Part ==============================

            // Text(
            //   "Meet the heads",
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold, fontSize: size.height * 0.04),
            // ),
            SizedBox(height: size.height * 0.02),

            Container(
              // height: size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                children: <Widget>[
                  for (int i = 0; i < headlist.length; i++)
                    Container(
                      height: size.height * 0.21,
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.18,
                            padding: EdgeInsets.all(size.height * 0.015),
                            margin: EdgeInsets.all(size.height * 0.015),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  offset: Offset(1, 1),
                                  color: Color(0xff333333).withOpacity(0.5),
                                  spreadRadius: -1,
                                )
                              ],
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          size.height * 0.02,
                                          size.height * 0.03,
                                          size.height * 0.02,
                                          size.height * 0.03),
                                      child: CircleAvatar(
                                        radius: size.height * 0.043,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: FirebaseImage(
                                            headlist[i]['iconPath']),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          headlist[i]['name'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: size.height * 0.025),
                                        ),
                                        Center(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              left: size.height * 0.02,
                                              right: size.height * 0.02,
                                            ),
                                            child: Text(
                                              headlist[i]['details'],
                                              style: TextStyle(
                                                //fontWeight: FontWeight.bold
                                                fontSize: size.height * 0.020,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              left: size.height * 0.02,
                                              right: size.height * 0.02,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                // _launchCaller("mailto:" +
                                                //     headlist[index]['email'] +
                                                //     "?subject=Regarding%20Technothlon&body=Good%20Morning");
                                                _launchEmail('your@email.com');
                                              },
                                              child: Text(
                                                headlist[i]['email'],
                                                style: TextStyle(
                                                  //fontWeight: FontWeight.bold
                                                  fontSize: size.height * 0.020,
                                                  // color: Colors.blue,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              left: size.height * 0.02,
                                              // size.height * 0.03,
                                              right: size.height * 0.02,
                                              // size.height * 0.03
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                _launchCaller("tel:" +
                                                    headlist[i]['number']);
                                              },
                                              child: Text(
                                                headlist[i]['number'],
                                                style: TextStyle(
                                                  //fontWeight: FontWeight.bold
                                                  fontSize: size.height * 0.020,
                                                  color: Colors.blue,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Center(
                                //   child: Container(
                                //     padding: EdgeInsets.fromLTRB(
                                //         size.height * 0.02,
                                //         size.height * 0.03,
                                //         size.height * 0.02,
                                //         size.height * 0.03),
                                //     child: Text(
                                //       headlist[index]['number'],
                                //       style: TextStyle(
                                //         //fontWeight: FontWeight.bold
                                //         fontSize: size.height * 0.024,
                                //       ),
                                //       textAlign: TextAlign.center,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Rep {
  String name;
  int contact;
  String email;
  String city;
  String state;
  String zone;

  Rep(this.name, this.contact, this.email, this.city, this.state, this.zone);
}
