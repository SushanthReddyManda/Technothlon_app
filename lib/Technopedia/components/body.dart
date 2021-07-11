import 'package:flutter/material.dart';
import 'package:flutter_app_technothlon/homeScreen.dart';
import 'package:flutter_app_technothlon/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_auth/Screens/Login/login_screen.dart';
//import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import '../../drawerScreen.dart';
import 'background.dart';
import '../../components/rounded_button.dart';
import '../../constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app_technothlon/splash.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    /*return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,

        children: <Widget>[
          Positioned(
            top:0,
            left:0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width*0.3,
            ),
          ),
          Positioned(
            bottom:0,
            left:0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width*0.2,
            ),
          )
        ],
      ),
    );
  }
} 
    
    */
    return Background(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.05),
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
          //SizedBox(height: size.height * 0.05),

          /*Hero(
                tag:'hero',
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 100.0,
                  child: Image.asset('assets/images/AboutUs.png'),
                ),
              ),*/
          SvgPicture.asset(
            "assets/icons/technopedia.svg",
            height: size.height * 0.3,
          ),
          SizedBox(height: size.height * 0.05),

/*            SvgPicture.asset(
                "assets/icons/chat.svg",
                height: size.height * 0.45,
              ),*/
          //SizedBox(height: size.height * 0.05),
          Text(
            "Technopedia",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Text(
                '''Technopedia is the online module of Technothlon providing its students with an ultimate experience of the prelims beforehand. With the monthly quizzes, Technopedia aims at keeping the young minds involved in brainstorming questions and helping them prepare for the prelims''',
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

          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                onPressed: () async {
                  const url =
                      'https://technothlon.techniche.org.in/technopediainfo';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                color: Colors.purple,
                textColor: Colors.white,
                child: Text(
                  "Attempt Now",
                  style: GoogleFonts.varelaRound(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.95,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                onPressed: () async {
                  const url =
                      'https://technothlon.techniche.org.in/technothlon2021';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                // color: Colors.purple,
                textColor: Colors.blueAccent,
                child: Text("click here if your are registered participant",
                    style: GoogleFonts.varelaRound(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    )),
              ),
            ),
          ),
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
    );
  }
}
