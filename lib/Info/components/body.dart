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
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
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
                Image.asset(
                  "assets/new_icons/Online report-bro.png",
                  height: size.height * 0.3,
                ),
                SizedBox(height: size.height * 0.05),

/*            SvgPicture.asset(
                "assets/icons/chat.svg",
                height: size.height * 0.45,
              ),*/
                //SizedBox(height: size.height * 0.05),
                Text(
                  "Info",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),

                Center(
                    child: Container(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Text(
                    """(These are general Info and do not relate to Technothlon 2021. For changes in the procedure of Technothlon 2021 visit updates)""",
                    style: GoogleFonts.varelaRound(),
                    textAlign: TextAlign.center,
                  ),
                )),

                ListView(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(5.0),
                  children: <Widget>[
                    ListTile(
                        title: Text(
                      'Through a series of events involving mental aptitude, logic, and dexterity, we seek to provide school students, a platform to build fundamental experience and knowledge, to exercise co-ordination skills, and to think OUT OF THE BOX!',
                      style: GoogleFonts.varelaRound(),
                    )),
                    ExpansionTile(
                        title: Text('WHAT ARE WE',
                            style: GoogleFonts.varelaRound(
                                fontWeight: FontWeight.bold)),
                        backgroundColor:
                            Theme.of(context).accentColor.withOpacity(0.025),
                        children: <Widget>[
                          ListTile(
                              title: Text(
                                  'Technothlon is an international school championship organized by the student fraternity of IIT Guwahati.Technothlon began in 2004 in a small room with an aim to Inspire Young Minds.Starting on our journey with a participation of 200 students confined to the city of Guwahati, over the past 14 years we have expanded our reach to over 400 cities all over India and various centres abroad.\nThe championship is organized over 2 rounds.\n\nPRELIMS : A written preliminary examination which takes place in numerous schools all over India in the month of July.\nMAINS : An event based competition which is conducted at IIT Guwahati, among the top 100 students from each squad.',
                                  style: GoogleFonts.varelaRound())),
                        ]),
                    ExpansionTile(
                        title: Text('STRUCTURE',
                            style: GoogleFonts.varelaRound(
                                fontWeight: FontWeight.bold)),
                        backgroundColor:
                            Theme.of(context).accentColor.withOpacity(0.025),
                        children: <Widget>[
                          ListTile(
                              title: Text(
                                  'Students participate in teams of TWO.\n\n There are two squads :\n 1) JUNIOR SQUAD : Students of classes 9th and 10th.\n2) HAUTS SQUAD : Students of classes 11th and 12th.\n\nNOTE: The classes of the student at the time of the examination is considered.',
                                  style: GoogleFonts.varelaRound())),
                        ]),
                    ExpansionTile(
                        title: Text('LEVELS',
                            style: GoogleFonts.varelaRound(
                                fontWeight: FontWeight.bold)),
                        backgroundColor:
                            Theme.of(context).accentColor.withOpacity(0.025),
                        children: <Widget>[
                          ListTile(
                              title: Text(
                                  'PRELIMS (to be held on 8th August 2021) :\n\nPrelims is in general an objective written exam.It involves no syllabus or general knowledge and relies solely on the Student’s LOGIC and ANALYTICAL THINKING ABILITIES.\nThe exam is generally of 2.5 hour length.The two team members are given a common Question Paper and answer sheet, and they can discuss it amongst themselves and attempt the paper together.\n\nMAINS(to be held at IIT Guwahati during TECHNICHE 2021) :\n\nMains is an event based competition.The selected teams of the same squad compete against each other in various events.Each team will have to face 3 events from which top 5 teams from each squad will be selected for The Final Showdown.The events, like prelims, do not require any pre-requisite knowledge and students will be taught any extra knowledge they require.The events vary every year and in the past there have been events like Robotics, Air Crash Investigation, Water Rocket, A Little Bid, Fluxo de Energia and many more!\nIn addition to these, students can attend the workshops and fun events to spend the night.Other than events, the students can witness the competitions of Techniche and attend the Lecture Series of famous personalities(past speakers include Mr.Subramanian Swamy,Mr.Fred Raab,Miss Ada Yonath etc.).They can also enjoy the Pronite performances.',
                                  style: GoogleFonts.varelaRound())),
                        ]),
                    ExpansionTile(
                        title: Text('SELECTION PROCESS',
                            style: GoogleFonts.varelaRound(
                                fontWeight: FontWeight.bold)),
                        backgroundColor:
                            Theme.of(context).accentColor.withOpacity(0.025),
                        children: <Widget>[
                          ListTile(
                              title: Text(
                                  'Selection is solely based on the marks scored in Prelims.The teams are selected on the basis of the total marks scored in Prelims.The Top 50 teams from each squad are called to IIT Guwahati for the Mains Round.',
                                  style: GoogleFonts.varelaRound())),
                        ]),
                    ExpansionTile(
                        title: Text('MODES OF REGISTRATION',
                            style: GoogleFonts.varelaRound(
                                fontWeight: FontWeight.bold)),
                        backgroundColor:
                            Theme.of(context).accentColor.withOpacity(0.025),
                        children: <Widget>[
                          ListTile(
                              title: Text(
                                  'The interested students can register themselves for the exam online or offline.\n\n\n1) OFFLINE: Technothlon is conducted over various cities and centres with the help of city representatives.The city representatives are responsible to collect the registrations offline.Participating schools can collect the registration fee themselves and then prepare a demand draft to be handed over to the city representatives.\n\n2) ONLINE: You can register online too!Online registration portal is now active!Click here to Register Online\nFor Registration from Jawahar Navodaya Vidyalaya or from Kendriya Vidyalaya Click Here\n\nPlease note that you will be able to access Technopedia only after successful payment of registratio fees.\n\nThe fees is non-refundable.',
                                  style: GoogleFonts.varelaRound())),
                        ]),
                    ExpansionTile(
                        title: Text('REWARDS',
                            style: GoogleFonts.varelaRound(
                                fontWeight: FontWeight.bold)),
                        backgroundColor:
                            Theme.of(context).accentColor.withOpacity(0.025),
                        children: <Widget>[
                          ListTile(
                              title: Text(
                                  'Exciting Prizes to be won!!!\n\n\nOther than the top 100 participants which are selected for Mains in each Squad (and given Gold Certificate), the next 400 participants in both the Squads are awarded with Silver Certificates from TECHNICHE,IIT Guwahati.\n\nAlso there are various other prizes which will be disclosed later.\n\nEveryone participating in Technothlon 2019 will receive e-Certificate of Participation.',
                                  style: GoogleFonts.varelaRound())),
                        ]),
                    ExpansionTile(
                        title: Text('TESTIMONIALS',
                            style: GoogleFonts.varelaRound(
                                fontWeight: FontWeight.bold)),
                        backgroundColor:
                            Theme.of(context).accentColor.withOpacity(0.025),
                        children: <Widget>[
                          ListTile(
                              title: Text(
                                  'H C VERMA:\n\nI saw your questions, and it is good that I don’t have to appear in that.It’s very tough and very very challenging and you are targeting the best brains.The “Best Brains” need the challenge!\n\n\nAabir Lal Biswas(AIR 2, Techno' +
                                      "'" +
                                      '19):\n\nBeing able to take part in Mains round of Techniche is Privilage . Its a competition which can be won without any factual knowledge but absolute logic and reasoning.\n\n\nSukeerth Ramkumar(AIR 2, Techno' +
                                      "'" +
                                      '19):\n\nTechnothlon has been one of the most memorable experiences . The set of challenging activities interwined with fun and excitement has created several cherishable moments!\n\n\nSHUBHAM JAIN(AIR 56, IITJEE 2012):\n\nIt was my trip to IIT Guwahati in 2009 for Technothlon that motivated me and helped me achieve such a wonderful rank.I look to participate again in Techniche.',
                                  style: GoogleFonts.varelaRound())),
                        ]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
