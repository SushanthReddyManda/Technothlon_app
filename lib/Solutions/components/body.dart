import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_auth/Screens/Login/login_screen.dart';
//import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'background.dart';
import '../../components/rounded_button.dart';
import '../../constants.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'dart:io';

import 'dart:async';
import 'dart:convert';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter_app_technothlon/splash.dart';

import 'package:flutter_app_technothlon/main.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void initState() {
    _getData();
    initDownloadsDirectoryState();
    super.initState();
  }

  bool exist = false;
  bool selected = false;

  String selected_Squad = null;
  String selected_Year = null;
  String selected_Paper = null;
  String selected_url = null;

  Set<String> squads = new Set();
  Set<String> years_temp = new Set();
  List<String> years = [];
  Set<String> papers = new Set();

  Set<Sol> sols_copy = new Set();

  Future<List<Sol>> _getData() async {
    var data = await rootBundle.loadString('assets/sol.json');
    var jsonData = json.decode(data);

    List<Sol> sols = [];

    for (var x in jsonData) {
      Sol sol = Sol(x["Link"], x["Squad"], x["Year"], x["Paper"]);
      sols.add(sol);
      sols_copy.add(sol);
      squads.add(x["Squad"]);
      years_temp.add(x["Year"].toString());
      papers.add(x["Paper"]);
    }
    years = years_temp.toList();
    years.sort();
    return sols;
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

  Directory _downloadsDirectory;

  Future<void> initDownloadsDirectoryState() async {
    Directory downloadsDirectory;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
    } catch (e) {
      print('Could not get the downloads directory');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _downloadsDirectory = downloadsDirectory;
    });

    // WidgetsFlutterBinding.ensureInitialized();
    // await FlutterDownloader.initialize(
    //     debug: true // optional: set false to disable printing logs to console
    //     );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Background(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //SizedBox(height: size.height * 0.05),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  iconSize: 33.0,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()))
                  },
                ),
              ),
              //SizedBox(height: size.height * 0.05),

              Image.asset(
                "assets/new_icons/Exams-bro.png",
                height: size.height * 0.36,
              ),
              //SizedBox(height: size.height * 0.05),

/*            SvgPicture.asset(
                "assets/icons/chat.svg",
                height: size.height * 0.45,
              ),*/
              //SizedBox(height: size.height * 0.05),
              Text(
                "Solutions",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Text(
                    '''Look through our repository of past question papers to help you prepare for Technothlon 2021''',
                    // style: TextStyle(
                    //   fontFamily: 'sniglet',
                    //   //fontWeight: FontWeight.bold
                    //   fontSize: 15,
                    // ),
                    style: GoogleFonts.varelaRound(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              // Text(
              //   "Archives",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              // ),
              //
              // SizedBox(
              //   height: 20,
              // ),

              Container(
                child: FutureBuilder(
                    future: _getData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          child: Center(
                            child: Text("Loading"),
                          ),
                        );
                      } else {
                        return Column(
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        splashColor: Colors.white,
                                        alignedDropdown: true,
                                        child: DropdownButton<String>(
                                          value: selected_Squad,
                                          iconSize: 30,
                                          icon: (null),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                          ),
                                          hint: Text(
                                            'Select Squad',
                                            style: GoogleFonts.varelaRound(
                                              fontSize: 15,
                                            ),
                                          ),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              selected_Squad = newValue;
                                              exist = false;
                                              selected = false;
                                              selected_url = null;
                                              print(selected_Squad);
                                            });
                                          },
                                          items: squads.map((item) {
                                                return new DropdownMenuItem(
                                                  child: new Text(
                                                    item,
                                                    style:
                                                        GoogleFonts.varelaRound(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  value: item,
                                                );
                                              })?.toList() ??
                                              [],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        splashColor: Colors.white,
                                        alignedDropdown: true,
                                        child: DropdownButton<String>(
                                          value: selected_Year,
                                          iconSize: 30,
                                          icon: (null),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                          ),
                                          hint: Text('Select Year',
                                              style: GoogleFonts.varelaRound(
                                                  fontSize: 15)),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              selected_Year = newValue;
                                              exist = false;
                                              selected = false;
                                              selected_url = null;
                                              print(selected_Year);
                                            });
                                          },
                                          items: years.map((item) {
                                                return new DropdownMenuItem(
                                                  child: new Text(item,
                                                      style: GoogleFonts
                                                          .varelaRound(
                                                              fontSize: 15)),
                                                  value: item,
                                                );
                                              })?.toList() ??
                                              [],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        splashColor: Colors.white,
                                        alignedDropdown: true,
                                        child: DropdownButton<String>(
                                          value: selected_Paper,
                                          iconSize: 30,
                                          icon: (null),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                          ),
                                          hint: Text('Select Paper',
                                              style: GoogleFonts.varelaRound(
                                                  fontSize: 15)),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              selected_Paper = newValue;
                                              exist = false;
                                              selected = false;
                                              selected_url = null;
                                              print(selected_Paper);
                                            });
                                          },
                                          items: papers.map((item) {
                                                return new DropdownMenuItem(
                                                  child: new Text(item,
                                                      style: GoogleFonts
                                                          .varelaRound(
                                                              fontSize: 15)),
                                                  value: item,
                                                );
                                              })?.toList() ??
                                              [],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Container(
                                child: ((() {
                              if (selected_Year != null &&
                                  selected_Squad != null &&
                                  selected_Paper != null) {
                                selected = true;
                              }

                              if (selected) {
                                for (var x in sols_copy) {
                                  if (x.squad == selected_Squad &&
                                      x.year.toString() == selected_Year &&
                                      x.paper == selected_Paper) {
                                    exist = true;
                                    selected_url = x.link;
                                  }
                                }
                              }

                              if (exist) {
                                return RoundedButton(
                                  text: "Download",
                                  press: () async {
                                    final status = Permission.storage.request();
                                    if (await status.isGranted) {
                                      // final externaldir =
                                      //     await getExternalStorageDirectory();
                                      //print(selected_url);
                                      // FlutterDownloader.enqueue(
                                      //   url: selected_url,
                                      //   savedDir: _downloadsDirectory.path,
                                      //   fileName:
                                      //       "Technothlon_$selected_Squad$selected_Year$selected_Paper.pdf",
                                      //   showNotification: true,
                                      //   openFileFromNotification: true,
                                      // );
                                      _launchInApp(selected_url);
                                    }
                                  },
                                );
                              } else {
                                if (selected_Year == null ||
                                    selected_Squad == null ||
                                    selected_Paper == null) {
                                  return RoundedButton(
                                    color: Colors.grey,
                                    text: "Please Select Fields",
                                    press: () {},
                                  );
                                } else {
                                  return RoundedButton(
                                    color: Colors.grey,
                                    text: "Selection Not Available!",
                                    press: () {},
                                  );
                                }
                              }
                            })())),
                            SizedBox(
                              height: size.height * 0.075,
                            )
                          ],
                        );
                      }
                    }),
              ),

              // RoundedButton(
              //   text: "Attempt Now",
              //   press: () {
              //   /*  Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return LoginScreen();
              //         },
              //       ),
              //     );*/
              //   },
              // ),

              /*RoundedButton(
                text: "SIGN UP",
                color: kPrimaryLightColor,
                textColor: Colors.black,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),*/ //*/
            ],
          ),
        ),
      ),
    );
  }
}

class Sol {
  String link;
  String squad;
  int year;
  String paper;

  Sol(this.link, this.squad, this.year, this.paper);
}

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     // This size provide us total height and width of our screen
//     /*return Container(
//       height: size.height,
//       width: double.infinity,
//       child: Stack(
//         alignment: Alignment.center,

//         children: <Widget>[
//           Positioned(
//             top:0,
//             left:0,
//             child: Image.asset(
//               "assets/images/main_top.png",
//               width: size.width*0.3,
//             ),
//           ),
//           Positioned(
//             bottom:0,
//             left:0,
//             child: Image.asset(
//               "assets/images/main_bottom.png",
//               width: size.width*0.2,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//     */
//     return Background(
//       child: SingleChildScrollView(
//         child: Column(
//           //mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             //SizedBox(height: size.height * 0.05),
//             //SizedBox(height: size.height * 0.05),

//             /*Hero(
//               tag:'hero',
//               child: CircleAvatar(
//                 backgroundColor: Colors.transparent,
//                 radius: 100.0,
//                 child: Image.asset('assets/images/AboutUs.png'),
//               ),
//             ),*/
//             SvgPicture.asset(
//               "assets/icons/technopedia.svg",
//               height: size.height * 0.3,
//             ),
//             SizedBox(height: size.height * 0.05),

// /*            SvgPicture.asset(
//               "assets/icons/chat.svg",
//               height: size.height * 0.45,
//             ),*/
//             //SizedBox(height: size.height * 0.05),
//             Text(
//               "Solutions",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//             ),

//             Center(
//               child: Container(
//                 padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
//                 child: Text(
//                   '''Look through our repository of past question papers to help you prepare for Technothlon 2020''',
//                   style: TextStyle(
//                     //fontWeight: FontWeight.bold
//                     fontSize: 15,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),

//             SizedBox(
//               height: 20,
//             ),

//             Text(
//               "Archives",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//             ),

//             SizedBox(
//               height: 20,
//             ),

//             Container(
//               padding: EdgeInsets.only(left: 15, right: 15, top: 5),
//               color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Expanded(
//                     child: DropdownButtonHideUnderline(
//                       child: ButtonTheme(
//                         splashColor: Colors.teal,
//                         alignedDropdown: true,
//                         child: DropdownButton<String>(
//                           //value: selectedzone,
//                           iconSize: 30,
//                           icon: (null),
//                           style: TextStyle(
//                             color: Colors.black54,
//                             fontSize: 16,
//                           ),
//                           hint: Text('Select Squad'),
//                           // onChanged: (String newValue) {
//                           //   setState(() {
//                           //     selectedzone = newValue;
//                           //     states =
//                           //         getStatesList(selectedzone, snapshotcopy);
//                           //     selectedstate = null;
//                           //     selectedcity = null;
//                           //     cities = new Set();
//                           //     print(selectedzone);
//                           //   });
//                           // },
//                           // items: zones.map((item) {
//                           //       return new DropdownMenuItem(
//                           //         child: new Text(item),
//                           //         value: item,
//                           //       );
//                           //     })?.toList() ??
//                           //     [],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),

//             Container(
//               padding: EdgeInsets.only(left: 15, right: 15, top: 5),
//               color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Expanded(
//                     child: DropdownButtonHideUnderline(
//                       child: ButtonTheme(
//                         splashColor: Colors.teal,
//                         alignedDropdown: true,
//                         child: DropdownButton<String>(
//                           //value: selectedzone,
//                           iconSize: 30,
//                           icon: (null),
//                           style: TextStyle(
//                             color: Colors.black54,
//                             fontSize: 16,
//                           ),
//                           hint: Text('Select Year'),
//                           // onChanged: (String newValue) {
//                           //   setState(() {
//                           //     selectedzone = newValue;
//                           //     states =
//                           //         getStatesList(selectedzone, snapshotcopy);
//                           //     selectedstate = null;
//                           //     selectedcity = null;
//                           //     cities = new Set();
//                           //     print(selectedzone);
//                           //   });
//                           // },
//                           // items: zones.map((item) {
//                           //       return new DropdownMenuItem(
//                           //         child: new Text(item),
//                           //         value: item,
//                           //       );
//                           //     })?.toList() ??
//                           //     [],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),

//             Container(
//               padding: EdgeInsets.only(left: 15, right: 15, top: 5),
//               color: Colors.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Expanded(
//                     child: DropdownButtonHideUnderline(
//                       child: ButtonTheme(
//                         splashColor: Colors.teal,
//                         alignedDropdown: true,
//                         child: DropdownButton<String>(
//                           //value: selectedzone,
//                           iconSize: 30,
//                           icon: (null),
//                           style: TextStyle(
//                             color: Colors.black54,
//                             fontSize: 16,
//                           ),
//                           hint: Text('Select Paper'),
//                           // onChanged: (String newValue) {
//                           //   setState(() {
//                           //     selectedzone = newValue;
//                           //     states =
//                           //         getStatesList(selectedzone, snapshotcopy);
//                           //     selectedstate = null;
//                           //     selectedcity = null;
//                           //     cities = new Set();
//                           //     print(selectedzone);
//                           //   });
//                           // },
//                           // items: zones.map((item) {
//                           //       return new DropdownMenuItem(
//                           //         child: new Text(item),
//                           //         value: item,
//                           //       );
//                           //     })?.toList() ??
//                           //     [],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),

//             // RoundedButton(
//             //   text: "Attempt Now",
//             //   press: () {
//             //   /*  Navigator.push(
//             //       context,
//             //       MaterialPageRoute(
//             //         builder: (context) {
//             //           return LoginScreen();
//             //         },
//             //       ),
//             //     );*/
//             //   },
//             // ),

//             /*RoundedButton(
//               text: "SIGN UP",
//               color: kPrimaryLightColor,
//               textColor: Colors.black,
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return SignUpScreen();
//                     },
//                   ),
//                 );
//               },
//             ),*/ //*/
//           ],
//         ),
//       ),
//     );
//   }
// }
