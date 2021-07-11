import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_technothlon/homeScreen.dart';
import 'package:flutter_app_technothlon/main.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_auth/Screens/Login/login_screen.dart';
//import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import '../../drawerScreen.dart';
import 'background.dart';
import '../../components/rounded_button.dart';
import '../../constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app_technothlon/splash.dart';

List<Map> devlist = [
  {
    'tag': 'sushanth',
    'name': 'Sushanth Reddy Manda',
    'iconPath':
        'gs://technothlon-8632e.appspot.com/Developers_images/sushanth.png',
    'details': 'South Zone Head',
    'email': 'sushanth@techniche.org',
    'number': '+91 9515422810',
  },
  {
    'tag': 'shridam',
    'name': 'Shridam Mahajan',
    'iconPath':
        'gs://technothlon-8632e.appspot.com/Developers_images/Shridam_Mahajan.jpg',
    'details': 'Ex - Head'
  },
  {
    'tag': 'sparsh',
    'name': ' Sparsh Dutta  ',
    'iconPath':
        'gs://technothlon-8632e.appspot.com/Developers_images/sparsh.jpg',
    'details': 'Ex - Head'
  },
  {
    'tag': 'atharva',
    'name': 'Atharva Shrawge',
    'iconPath':
        'gs://technothlon-8632e.appspot.com/Developers_images/atharva.jpg',
    'details': 'Ex - Team Member'
  },
  {
    'tag': 'parag',
    'name': 'Parag Panigrahi',
    'iconPath':
        'gs://technothlon-8632e.appspot.com/Developers_images/parag.jpg',
    'details': 'Ex - Team Member'
  },
  {
    'tag': 'tushar',
    'name': ' Tushar Bajaj  ',
    'iconPath':
        'gs://technothlon-8632e.appspot.com/Developers_images/tushar.jpg',
    'details': 'Ex - Team Member'
  }
];

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

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.05),

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

            Hero(
              tag: 'hero',
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 180.0,
                child: Image.asset('assets/new_icons/Code typing-bro.png'),
              ),
            ),

            //SizedBox(height: size.height * 0.05),

            Text(
              "Developers",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              height: 1100,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                children: <Widget>[
                  //===== First Developer ===========
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
                                      backgroundImage:
                                          FirebaseImage(devlist[0]['iconPath']),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        devlist[0]['name'],
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
                                            devlist[0]['details'],
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
                                              devlist[0]['email'],
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
                                                  devlist[0]['number']);
                                            },
                                            child: Text(
                                              devlist[0]['number'],
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
                  for (int i = 1; i < devlist.length; i++)
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
                                            devlist[i]['iconPath']),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          devlist[i]['name'],
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
                                              devlist[i]['details'],
                                              style: TextStyle(
                                                //fontWeight: FontWeight.bold
                                                fontSize: size.height * 0.020,
                                              ),
                                              textAlign: TextAlign.center,
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
