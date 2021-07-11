import 'package:flutter/material.dart';
import 'package:flutter_app_technothlon/splash.dart';
import 'package:flutter_app_technothlon/main.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_auth/Screens/Login/login_screen.dart';
//import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'background.dart';
//import 'package:flutter_auth/components/rounded_button.dart';
import '../../constants.dart';
import 'package:flutter_svg/svg.dart';

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
      child: Stack(children: <Widget>[
        /*Positioned(
            top: 22,
            left: 10,
            child: IconButton(
              iconSize: 33.0,
              icon: Icon(Icons.arrow_back_ios  ),
              onPressed: (){print("heyhye");},
            ),

          ),    */ //NON SCROLLABLE BUTTON

        SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //SizedBox(height: size.height * 0.05),
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
                  radius: 100.0,
                  child: Image.asset('assets/images/AboutUs.png'),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              /*            SvgPicture.asset(
                        "assets/icons/chat.svg",
                        height: size.height * 0.45,
                      ),*/
              //SizedBox(height: size.height * 0.05),
              Text(
                "About Us",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Text(
                    '''Technothlon is an international school championship organized by the student fraternity of IIT Guwahati. Technothlon began in 2004 in a small room with an aim to "Inspire Young Minds". Starting on our journey with a participation of 200 students confined to the city of Guwahati, over the past 15 years we have expanded our reach to over 400 cities all over India and various centers abroad. The championship is organized over 2 rounds:

1. Prelims: is the preliminary examination that involves no prerequisites or general knowledge, and students have to rely on their logical and analytical thinking skills alone.

2. Mains: is an event-based competition. The top 50 students from each squad compete against each other in challenging events designed to test their innovation, creativity, and imagination.''',
                    // style: TextStyle(
                    //   //fontWeight: FontWeight.bold,
                    //   fontFamily: 'sniglet',
                    //   fontSize: 15,
                    // ),
                    style: GoogleFonts.varelaRound(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              /*RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
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
            ),*/
            ],
          ),
        ),
      ]),
    );
  }
}
