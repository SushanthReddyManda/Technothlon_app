import 'package:flutter/material.dart';
import 'package:flutter_app_technothlon/main.dart';
import 'package:google_fonts/google_fonts.dart';
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
  // final List<String> messages = [
  //   'Notification 1',
  //   'Notification 2',
  //   'Notification 3'
  // ];

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
      print('A new onMessageOpenedApp event was published!');
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
              SvgPicture.asset(
                "assets/icons/updates.svg",
                height: size.height * 0.25,
              ),
              SizedBox(height: size.height * 0.05),
              Text(
                "Updates",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              SizedBox(height: size.height * 0.05),
              _showUpdates()
            ],
          ),
        ),
      ),
    );
  }

//  */

  getDriversList() async {
    return await FirebaseFirestore.instance.collection('updates').get();
  }

  Widget _showUpdates() {
    if (querySnapshot != null) {
      return ListView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.all(5.0),
        itemCount: querySnapshot.docs.length,
        itemBuilder: (context, int position) {
          return ExpansionTile(
            title: Text("${querySnapshot.docs[position].get('question')}",
                style: GoogleFonts.varelaRound(
                    fontSize: 15, fontWeight: FontWeight.bold)),
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
            children: <Widget>[
              ListTile(
                title: Text(
                  "${querySnapshot.docs[position].get('answer')}",
                  style: GoogleFonts.varelaRound(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
