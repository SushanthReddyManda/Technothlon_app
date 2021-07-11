import 'package:flutter/material.dart';
import 'package:flutter_app_technothlon/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'background.dart';
import '../../constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_technothlon/splash.dart';

/*Function abcd() { Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomePage()))
}*/
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

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
    super.initState();

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        Navigator.pushNamed(context, '/message',
            arguments: {"message": message});
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new on MessageOpenedApp event was published!');
      Navigator.pushNamed(context, '/message', arguments: {"message": message});
    });

    super.initState();
    getDriversList().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }

  QuerySnapshot querySnapshot;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Background(
        child: SingleChildScrollView(
          child: Column(
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
              // SizedBox(height: size.height * 0.05),
              Image.asset(
                "assets/new_icons/Push notifications-bro.png",
                height: size.height * 0.33,
              ),
              SizedBox(height: size.height * 0.05),
              Text(
                "Notifications",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              SizedBox(height: size.height * 0.05),
              Center(child: __showNotifications()),
            ],
          ),
        ),
      ),
    );
  }

//  */ ============================================

  getDriversList() async {
    return await FirebaseFirestore.instance.collection('notifications').get();
  }

  Widget __showNotifications() {
    // print("${querySnapshot.docs[0].data()}");
    if (querySnapshot != null) {
      return Container(
        height: 500,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: ListView.builder(
          itemCount: querySnapshot.docs.length,
          itemBuilder: (context, int position) {
            return ListTile(
              leading: Icon(Icons.arrow_right_alt),
              title: InkWell(
                onTap: () {
                  _launchInApp("${querySnapshot.docs[position].get('link')}");
                },
                child: Text(
                  "${querySnapshot.docs[position].get('notification')}",
                  style: TextStyle(
                    fontFamily: 'sniglet',
                    color: Colors.blue,
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
//===============================  End =========================================
