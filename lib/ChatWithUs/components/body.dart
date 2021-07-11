import 'package:flutter/material.dart';
import 'package:flutter_app_technothlon/main.dart';
import 'package:flutter_app_technothlon/webviews/fbweb.dart';
import 'package:flutter_app_technothlon/webviews/igweb.dart';
import 'package:flutter_app_technothlon/webviews/mediumweb.dart';
import 'package:flutter_app_technothlon/webviews/websiteweb.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_auth/Screens/Login/login_screen.dart';
//import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'background.dart';
import '../../components/rounded_button.dart';
import '../../constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app_technothlon/splash.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';
import 'image_previews.dart';

class Body extends StatefulWidget {
  @override
  DemoAppState createState() => DemoAppState();
}

class DemoAppState extends State<Body> {
  String text = '';
  String subject = '';
  List<String> imagePaths = [];
  final _recipientController = TextEditingController(
    text: 'technothon@techniche.org',
  );

  final _subjectController = TextEditingController(text: '');

  final _bodyController = TextEditingController(
    text: '',
  );

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: imagePaths,
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
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
                  //Navigator.push(context, MaterialPageRoute(
                  // builder: (context) => HomePage()
                },
              ),
            ),

            Hero(
              tag: 'hero',
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: size.width * 0.3,
                child: Image.asset('assets/new_icons/Chat bot-amico.png'),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            /*            SvgPicture.asset(
                        "assets/icons/chat.svg",
                        height: size.height * 0.45,
                      ),*/
            //SizedBox(height: size.height * 0.05),
            Text(
              "Chat With Us",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    controller: _subjectController,
                    decoration: InputDecoration(
                      labelText: 'Chat subject:',
                      hintText: 'Enter subject to share (optional)',
                      labelStyle: GoogleFonts.varelaRound(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      subject = value;
                    }),
                  ),
                  TextField(
                    controller: _bodyController,
                    decoration: InputDecoration(
                      labelText: 'Chat text:',
                      hintText: 'Enter some text and/or link to share',
                      labelStyle: GoogleFonts.varelaRound(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      text = value;
                    }),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  ImagePreviews(imagePaths, onDelete: _onDeleteImage),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add image"),
                    onTap: () async {
                      final imagePicker = ImagePicker();
                      final pickedFile = await imagePicker.getImage(
                        source: ImageSource.gallery,
                      );
                      if (pickedFile != null) {
                        setState(() {
                          imagePaths.add(pickedFile.path);
                        });
                      }
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        child: const Text('Send'),
                        // onPressed: text.isEmpty && imagePaths.isEmpty
                        //     ? null
                        //     : () => _onShare(context),
                        onPressed: send,
                      );
                    },
                  ),
                  // const Padding(padding: EdgeInsets.only(top: 12.0)),
                  // Builder(
                  //   builder: (BuildContext context) {
                  //     return ElevatedButton(
                  //       child: const Text('Share With Empty Origin'),
                  //       onPressed: () => _onShareWithEmptyOrigin(context),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
    });
  }

  _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final RenderBox box = context.findRenderObject() as RenderBox;

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }

  // _onShareWithEmptyOrigin(BuildContext context) async {
  //   await Share.share("text");
  // }
}
