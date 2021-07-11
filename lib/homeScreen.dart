import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_technothlon/Notifications/notifications.dart';
import 'package:flutter_app_technothlon/Services/db.dart';
import 'package:flutter_app_technothlon/configuration.dart';
import 'package:flutter_app_technothlon/constants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_image/firebase_image.dart';
//import 'package:flutter_app_technothlon/developers.dart';
//import 'package:flutter_app_technothlon/screen2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Calendar/calendar.dart';
import 'package:share/share.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'Services/models.dart';
import 'YoutubeDefaultWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int photoIndex = 0;
  int photoIndex_theme = 0;
  var photos = [
    'assets/poster1.png',
    'assets/poster2.png',
    'assets/poster3.png',
    'assets/poster4.png',
  ];
  // List<String> didYouKnow = [];
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  String videoURL = "https://youtu.be/fPTxLFld4ks";
  String x;
  YoutubePlayerController _controller;
  final List<YoutubePlayerController> _controllers = [];
  //   'fPTxLFld4ks',
  //   'obOBPiM9Y2c',
  //   'wflhTC9OVCE',
  //   'EMuqPrpzdGo',
  //   'c15J4J9F0wU',
  //   'P9YjIthmfa0',
  //   'nohoFGBUNAQ',
  //   'ym3STi2mcMU',
  // ]
  //     .map<YoutubePlayerController>(
  //       (videoId) => YoutubePlayerController(
  //     initialVideoId: videoId,
  //     flags: const YoutubePlayerFlags(
  //       autoPlay: false,
  //     ),
  //   ),
  // )
  //     .toList();
  // DatabaseManager databaseManager = DatabaseManager();
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

  @override
  void initState() {
    // _controller = YoutubePlayerController(
    //     initialVideoId: YoutubePlayer.convertUrlToId(videoURL));

    super.initState();
    getDriversListDidYouKnow().then((results) {
      setState(() {
        querySnapshotDidYouKnow = results;
      });
    });

    getDriversListCoup().then((results) {
      setState(() {
        querySnapshotCoup = results;
      });
    });
    getDriversListPoster().then((results) {
      setState(() {
        querySnapshotPoster = results;
      });
    });

    getDriversListVideos().then((results) {
      setState(() {
        querySnapshotVideos = results;
      });
      if (querySnapshotVideos != null) {
        for (int i = 0; i < querySnapshotVideos.docs.length; i++) {
          _controllers.add(YoutubePlayerController(
            initialVideoId: YoutubePlayer.convertUrlToId(
                "${querySnapshotVideos.docs[i].get('link')}"),
            flags: YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
              disableDragSeek: false,
              loop: false,
              isLive: false,
              forceHD: false,
              hideThumbnail: true,
            ),
          ));
        }
      } else {
        Center(
          child: CircularProgressIndicator(),
        );
      }
    });

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        hideThumbnail: true,
      ),
    );
  }

  bool _isContainerVisible = true;
  bool _isContainerVisible_check1 = true;
  // bool _isContainerVisible_check2 = true;
  QuerySnapshot querySnapshotPoster;
  QuerySnapshot querySnapshotVideos;
  QuerySnapshot querySnapshotCoup;
  QuerySnapshot querySnapshotDidYouKnow;
  @override
  Widget build(BuildContext context) {
    // return Builder(
    //   builder: (BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // if (Navigator.canPop(context)) {
          // Navigator.pop(context); // i tried both the way
          //   // Navigator.of(context).pop();
          // } else {
          // if (isDrawerOpen) {
          //   isDrawerOpen = false;
          // } else {
          //   SystemNavigator.pop();
          // }
          // }
          return false;
        },
        child: OfflineBuilder(
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              if (_isContainerVisible_check1) {
                _isContainerVisible = false;
              } else {
                Future.delayed(const Duration(seconds: 3), () {
                  if (this.mounted)
                    setState(() {
                      _isContainerVisible = false;
                      _isContainerVisible_check1 = true;
                    });
                });
              }
            } else {
              _isContainerVisible_check1 = false;
            }
            return AnimatedContainer(
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scaleFactor)
                ..rotateY(isDrawerOpen ? -0.5 : 0),
              duration: Duration(milliseconds: 250),
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  backgroundColor: Color.fromRGBO(255, 171, 0, 1),
                  appBar: AppBar(
                    leading: isDrawerOpen
                        ? IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                scaleFactor = 1;
                                isDrawerOpen = false;
                              });
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.menu),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                xOffset = 230;
                                yOffset = 150;
                                scaleFactor = 0.6;
                                isDrawerOpen = true;
                              });
                            }),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    title: Text('TECHNOTHLON',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white)),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Notifications(),
                              ));
                        },
                        color: Colors.white,
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Calendar(),
                              ));
                        },
                        color: Colors.white,
                      )
                    ],
                  ),
                  body: ListView(children: [
                    Stack(children: [
                      child,
                      Container(
                          height: MediaQuery.of(context).size.height * 2.4,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.22,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(25.0))),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  categories[index]['page']))
                                    },
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.width *
                                              0.028,
                                          0,
                                          MediaQuery.of(context).size.width *
                                              0.028,
                                          0),
                                      margin: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.width *
                                              0.028,
                                          0,
                                          MediaQuery.of(context).size.width *
                                              0.028,
                                          0),
                                      child: Container(
                                        child: Image.asset(
                                            categories[index]['iconPath'],
                                            height: 80,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width *
                                            0.028,
                                        0,
                                        MediaQuery.of(context).size.width *
                                            0.028,
                                        0),
                                    // margin:EdgeInsets.fromLTRB(25,10,0,10),
                                    child: Text(
                                      categories[index]['name'],
                                      style: GoogleFonts.varelaRound(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      // style: TextStyle(
                                      //     color: Colors.white,
                                      //     fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.16,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          height: MediaQuery.of(context).size.height * 2.4,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      //========================  Online Offline Code ===========================
                      // AnimatedContainer(
                      //   duration: const Duration(milliseconds: 300),
                      //   color: connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                      //   child: connected
                      //       ? _isContainerVisible
                      //           ? Row(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: <Widget>[
                      //                 Text(
                      //                   "Online",
                      //                   style: TextStyle(color: Colors.white),
                      //                 ),
                      //               ],
                      //             )
                      //           : Row(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: <Widget>[
                      //                 Text(
                      //                   "Online",
                      //                   style: TextStyle(color: Colors.white),
                      //                 ),
                      //               ],
                      //             )
                      //       : Container(),
                      // ),
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        top: MediaQuery.of(context).size.height * 0.155,
                        height: 32.0,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 350),
                          child: connected
                              ? _isContainerVisible
                                  ? Container(
                                      color: Colors.lightGreenAccent[400],
                                      height: 25,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'ONLINE',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ))
                                  : Container()
                              : Container(
                                  color: Colors.red,
                                  height: 25,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'OFFLINE',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(width: 8.0),
                                      SizedBox(
                                        width: 12.0,
                                        height: 12.0,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.0,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),

                      //================= Poster =====================

                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        top: MediaQuery.of(context).size.height * 0.195,
                        //right:128,
                        child: Center(
                          child: Container(
                            child: Text(
                              'TIMELINE',
                              style: GoogleFonts.varelaRound(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Colors.purple,
                              ),
                              // style: TextStyle(
                              //     fontSize: 20.0,
                              //     fontWeight: FontWeight.bold,
                              //     color: Colors.purple),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.25,
                        left: 10.0,
                        right: 10.0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width,
                          child: _showPoster(),
                        ),
                      ),

                      //================= Videos ========================

                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.84,
                        //right: 153,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          child: Text(
                            'Videos',
                            style: GoogleFonts.varelaRound(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.purple,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: 350,
                                // decoration: BoxDecoration(
                                //     border: Border.all(color: Colors.orangeAccent)),
                                child: _showVideos(),
                                // child: YoutubePlayer(
                                //   controller: _controller,
                                // ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //================  CoupDoeil ==================

                      Positioned(
                        top: MediaQuery.of(context).size.height * 1.3,
                        //right: 153,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Coup D'oeil",
                          style: GoogleFonts.varelaRound(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.purple,
                          ),
                          // style: TextStyle(
                          //     fontFamily: 'VarelaRound-Regular',
                          //     fontSize: 35.0,
                          //     color: Colors.purple),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 1.35,
                        left: 10.0,
                        right: 10.0,
                        // child: Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: <Widget>[
                        //     Container(
                        //       height: MediaQuery.of(context).size.height * 0.4,
                        child: _showCoupDoeil(),
                        //     )
                        //   ],
                        // ),
                      ),

                      //================= DidYouKnow ================

                      Positioned(
                        top: MediaQuery.of(context).size.height * 1.86,
                        //right: 153,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          child: Text(
                            'GK Booster',
                            style: GoogleFonts.varelaRound(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.purple,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 1.91,
                        left: 10.0,
                        right: 10.0,
                        child: __showDidYouKnow(),
                      ),
                      //  =================== Share App ================

                      // Positioned(
                      //   top: MediaQuery.of(context).size.height * 2.4,
                      //   left: 0.0,
                      //   right: 0.0,
                      //   child: Container(
                      //     height: MediaQuery.of(context).size.height * 0.22,
                      //     padding: EdgeInsets.all(
                      //         MediaQuery.of(context).size.height * 0.015),
                      //     margin: EdgeInsets.all(
                      //         MediaQuery.of(context).size.height * 0.015),
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       boxShadow: [
                      //         BoxShadow(
                      //           blurRadius: 5,
                      //           offset: Offset(1, 1),
                      //           color: Color(0xff333333).withOpacity(0.5),
                      //           spreadRadius: -1,
                      //         )
                      //       ],
                      //       borderRadius: BorderRadius.circular(20.0),
                      //       border: Border.all(
                      //         color: Colors.white,
                      //         width: 1.0,
                      //       ),
                      //     ),
                      //     child: Column(
                      //       children: [
                      //         Row(
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsets.fromLTRB(
                      //                   MediaQuery.of(context).size.height *
                      //                       0.00,
                      //                   MediaQuery.of(context).size.height *
                      //                       0.0,
                      //                   MediaQuery.of(context).size.height *
                      //                       0.02,
                      //                   MediaQuery.of(context).size.height *
                      //                       0.0),
                      //               child: CircleAvatar(
                      //                 backgroundColor: Colors.transparent,
                      //                 radius: 68.0,
                      //                 child: Image.asset(
                      //                     'assets/new_icons/Share link-amico.png'),
                      //               ),
                      //             ),
                      //             Column(
                      //               children: [
                      //                 Text("Share With Friends",
                      //                     style: GoogleFonts.varelaRound(
                      //                         fontWeight: FontWeight.w800,
                      //                         fontSize: MediaQuery.of(context)
                      //                                 .size
                      //                                 .height *
                      //                             0.018,
                      //                         color: Colors.black
                      //                         // Color.fromRGBO(255, 171, 0, 1),
                      //                         )),
                      //                 Center(
                      //                   child: Container(
                      //                     padding: EdgeInsets.only(
                      //                       left: MediaQuery.of(context)
                      //                               .size
                      //                               .height *
                      //                           0.02,
                      //                       right: MediaQuery.of(context)
                      //                               .size
                      //                               .height *
                      //                           0.02,
                      //                     ),
                      //                     child: Text(
                      //                       "Help your\nFriendsFall in\nLoveWith\nTechnothlon",
                      //                       style: GoogleFonts.varelaRound(
                      //                         //fontWeight: FontWeight.bold
                      //                         fontSize: MediaQuery.of(context)
                      //                                 .size
                      //                                 .height *
                      //                             0.017,
                      //                       ),
                      //                       textAlign: TextAlign.center,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.fromLTRB(
                      //                   MediaQuery.of(context).size.height *
                      //                       0.00,
                      //                   MediaQuery.of(context).size.height *
                      //                       0.0,
                      //                   MediaQuery.of(context).size.height *
                      //                       0.02,
                      //                   MediaQuery.of(context).size.height *
                      //                       0.0),
                      //               child: CircleAvatar(
                      //                   backgroundColor: Colors.purple,
                      //                   radius: 15.0,
                      //                   child: Icon(
                      //                     Icons.arrow_forward_rounded,
                      //                     color: Colors.white,
                      //                   )),
                      //             ),
                      //           ],
                      //         ),
                      //         // Center(
                      //         //   child: Container(
                      //         //     padding: EdgeInsets.fromLTRB(
                      //         //         size.height * 0.02,
                      //         //         size.height * 0.03,
                      //         //         size.height * 0.02,
                      //         //         size.height * 0.03),
                      //         //     child: Text(
                      //         //       headlist[index]['number'],
                      //         //       style: TextStyle(
                      //         //         //fontWeight: FontWeight.bold
                      //         //         fontSize: size.height * 0.024,
                      //         //       ),
                      //         //       textAlign: TextAlign.center,
                      //         //     ),
                      //         //   ),
                      //         // ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ])
                  ]),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  floatingActionButton: FloatingActionButton(
                    child: Center(
                      child: Image(
                        image: AssetImage('images/logo.png'),
                        width: 40,
                        height: 40,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.purple.shade400,
                    // elevation: 20.0,
                    onPressed: () {
                      if (isDrawerOpen)
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isDrawerOpen = false;
                        });
                      else {
                        setState(() {
                          xOffset = 230;
                          yOffset = 150;
                          scaleFactor = 0.6;
                          isDrawerOpen = true;
                        });
                      }
                      print('Technothlon Logo');
                    },
                  ),
                  bottomNavigationBar: BottomAppBar(
                    clipBehavior: Clip.antiAlias,
                    shape: CircularNotchedRectangle(),
                    child: Material(
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new TabBar(
                            indicatorColor: Colors.purple,
                            labelColor: Colors.purple,
                            labelStyle: GoogleFonts.varelaRound(
                              fontWeight: FontWeight.bold,
                            ),
                            tabs: <Widget>[
                              Container(
                                height: 80,
                                width: double.infinity,
                                child: InkWell(
                                  onTap: () {
                                    _launchInApp(
                                        "https://technothlon.techniche.org.in/technothlon2021");
                                  },
                                  child: new Tab(
                                    text: 'Login',
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: double.infinity,
                                child: InkWell(
                                  onTap: () {
                                    _launchInApp(
                                        "https://technothlon.techniche.org.in/register");
                                  },
                                  child: new Tab(
                                    text: 'Register',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          child: Column(),
        ));
    //   },
    // );
  }

  getDriversListDidYouKnow() async {
    return await FirebaseFirestore.instance.collection('didYouKnow').get();
  }

  Widget __showDidYouKnow() {
    // print("${querySnapshot.docs[0].data()}");
    if (querySnapshotDidYouKnow != null) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Swiper(
          curve: Curves.easeIn,
          itemCount: querySnapshotDidYouKnow.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: Offset(1, 1),
                    color: Color(0xff333333).withOpacity(1),
                    spreadRadius: -1,
                  )
                ],
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: FirebaseImage(
                    "${querySnapshotDidYouKnow.docs[index].get('link')}",
                  ),
                ),
              ),
            );
          },
          viewportFraction: 0.8,
          scale: 0.9,
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: new DotSwiperPaginationBuilder(
                color: Colors.deepPurpleAccent, activeColor: Colors.orange),
          ),
          control: new SwiperControl(
            color: Colors.deepOrange,
          ),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  getDriversListCoup() async {
    return await FirebaseFirestore.instance
        .collection('coupdoeil_images')
        .get();
  }

  Widget _showCoupDoeil() {
    if (querySnapshotCoup != null) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        height: MediaQuery.of(context).size.height * 0.38,
        width: MediaQuery.of(context).size.width * 0.82,
        child: Swiper(
          curve: Curves.easeIn,
          itemCount: querySnapshotCoup.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.5,
              margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: Offset(1, 1),
                    color: Color(0xff333333).withOpacity(1),
                    spreadRadius: -1,
                  )
                ],
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: FirebaseImage(
                    "${querySnapshotCoup.docs[index].get('link')}",
                  ),
                ),
              ),
            );
          },
          viewportFraction: 0.82,
          scale: 0.9,
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: new DotSwiperPaginationBuilder(
                color: Colors.deepPurpleAccent, activeColor: Colors.orange),
          ),
          control: new SwiperControl(
            color: Colors.deepOrange,
          ),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  getDriversListVideos() async {
    return await FirebaseFirestore.instance.collection('videos').get();
  }

  Widget _showVideos() {
    //${querySnapshotVideos.docs[index].get('link')}
    if (querySnapshotVideos != null) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Swiper(
          curve: Curves.easeIn,
          itemCount: querySnapshotVideos.docs.length,
          itemBuilder: (BuildContext context, int index) {
            // return YoutubePlayer(
            //   controller: _controllers[index],
            //   // controller: YoutubePlayerController(
            //   //   initialVideoId: YoutubePlayer.convertUrlToId(
            //   //       "${querySnapshotVideos.docs[index].get('link')}"),
            //   //   flags: YoutubePlayerFlags(
            //   //     autoPlay: false,
            //   //     // mute: false,
            //   //     // // disableDragSeek: true,
            //   //     // loop: false,
            //   //     // isLive: false,
            //   //     // forceHD: false,
            //   //     hideThumbnail: true,
            //   //     // hideControls: false,
            //   //   ),
            //   // ),
            //   liveUIColor: Colors.amber,
            //   showVideoProgressIndicator: true,
            // );
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => YoutubeDefaultWidget(
                              videoId: makeUrlId(querySnapshotVideos.docs[index]
                                  .get('link')))));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(1, 1),
                        color: Color(0xff333333).withOpacity(1),
                        spreadRadius: -1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(getYoutubeThumbnail(
                          querySnapshotVideos.docs[index].get('link'))),
                    ),
                  ),
                ));
          },
          viewportFraction: 1,
          scale: 1,
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: new DotSwiperPaginationBuilder(
                color: Colors.deepPurpleAccent, activeColor: Colors.orange),
          ),
          control: new SwiperControl(
            color: Colors.deepOrange,
          ),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  getDriversListPoster() async {
    return await FirebaseFirestore.instance.collection('poster').get();
  }

  Widget _showPoster() {
    if (querySnapshotPoster != null) {
      return Swiper(
        itemCount: querySnapshotPoster.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            child: Image(
              image: FirebaseImage(
                "${querySnapshotPoster.docs[index].get('link')}",
              ),
              fit: BoxFit.cover,
              width: 1000,
            ),
          );
        },
        viewportFraction: 1,
        scale: 1,
        // pagination: SwiperPagination(
        //   margin: new EdgeInsets.only(top: 20),
        // ),
        // control: SwiperControl(color: Colors.orange),
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: new DotSwiperPaginationBuilder(
              color: Colors.deepPurpleAccent, activeColor: Colors.orange),
        ),
        control: new SwiperControl(
          color: Colors.deepOrange,
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  String getYoutubeThumbnail(String videoUrl) {
    String urlVideo = videoUrl.substring(videoUrl.length - 11);

    return 'https://img.youtube.com/vi/$urlVideo/0.jpg';
  }

  String makeUrlId(String url) {
    return url.substring(url.length - 11);
  }
}
