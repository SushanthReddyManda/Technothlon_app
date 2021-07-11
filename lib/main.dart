import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:flutter_app_technothlon/splash.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:connectivity/connectivity.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_offline/flutter_offline.dart';

class ConnectionStatusSingleton {
  //This creates the single instance by calling the `_internal` constructor specified below
  static final ConnectionStatusSingleton _singleton =
      new ConnectionStatusSingleton._internal();
  ConnectionStatusSingleton._internal();

  //This is what's used to retrieve the instance through the appdev
  static ConnectionStatusSingleton getInstance() => _singleton;

  //This tracks the current connection status
  bool hasConnection = false;

  //This is how we'll allow subscribing to connection changes
  StreamController connectionChangeController =
      new StreamController.broadcast();

  //flutter_connectivity
  final Connectivity _connectivity = Connectivity();

  //Hook into flutter_connectivity's Stream to listen for changes
  //And check the connection status out of the gate
  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  //A clean up method to close our StreamController
  //   Because this is meant to exist through the entire application life cycle this isn't
  //   really an issue
  void dispose() {
    connectionChangeController.close();
  }

  //flutter_connectivity's listener
  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  //The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
        print('-------connected----------');
      } else {
        hasConnection = false;
        print('--------not connected-------');
      }
    } on SocketException catch (_) {
      hasConnection = false;
      print('--------not connected-------');
    } catch (e) {
      hasConnection = false;
      print('--------not connected-------');
    }

    //The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }
}

void main() async {
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,

    // DeviceOrientation.portraitDown,
  ]);
  runApp(MaterialApp(
    home: SplashScreen(),
    theme: ThemeData(fontFamily: 'Circular'),
  ));
// runApp(MyApp());
}

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  String _message = '';
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  _register() {
    _firebaseMessaging.getToken().then((token) => print(token));
    // Firebase.initializeApp();
  }

  StreamSubscription _connectionChangeStream;

  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);
    getMessage();
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  void getMessage() {
    //   _firebaseMessaging.configure(
    //       onMessage: (Map<String, dynamic> message) async {
    //     print('on message $message');
    //     setState(() => _message = message["notification"]["title"]);
    //   }, onResume: (Map<String, dynamic> message) async {
    //     print('on resume $message');
    //     setState(() => _message = message["notification"]["title"]);
    //   }, onLaunch: (Map<String, dynamic> message) async {
    //     print('on launch $message');
    //     setState(() => _message = message["notification"]["title"]);
    //   });
    // }
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        Navigator.pushNamed(context, '/message',
            arguments: {"message": message});
      }
    });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   Navigator.pushNamed(context, '/message', arguments: {"message": message});
    // });
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage())));
    return SplashScreenContent();
  }
}

class SplashScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment(0, 0),
          end: Alignment(2, 2),
          colors: <Color>[Colors.deepPurple, Colors.white],
        )),
        child: Center(
          child: Column(children: <Widget>[
            // Text("Message: $_message"),
            // OutlineButton(
            //   child: Text("Register My Device"),
            //   onPressed: () {
            //     _register();
            //   },
            // ),
            Padding(
              padding: EdgeInsets.only(top: 200.0),
              child: Image(
                image: AssetImage('images/logo.png'),
                // color: Colors.white,
                height: 120.0,
                width: 120.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: Text(
                'Technothlon',
                style: GoogleFonts.varelaRound(
                    textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),
            Text(
              'Experience logic like never before!',
              style: GoogleFonts.varelaRound(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 150.0),
              child: LoadingJumpingLine.circle(
                size: 40,
                backgroundColor: Colors.white,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

// class OfflineScreenContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  Builder(
//       builder: (BuildContext context) {
//         return OfflineBuilder(
//           connectivityBuilder: (BuildContext context,
//               ConnectivityResult connectivity, Widget child) {
//             final bool connected =
//                 connectivity != ConnectivityResult.none;
//             return Stack(
//               fit: StackFit.expand,
//               children: [
//                 child,
//                 Positioned(
//                   left: 0.0,
//                   right: 0.0,
//                   height: 32.0,
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     color:
//                     connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
//                     child: connected
//                         ?  Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           "OFFLINE",
//                           style: TextStyle(color: Colors.white),
//                         ),
//
//                       ],
//                     )
//                         : Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           "OFFLINE",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         SizedBox(
//                           width: 8.0,
//                         ),
//                         SizedBox(
//                           width: 12.0,
//                           height: 12.0,
//                           child: CircularProgressIndicator(
//                             strokeWidth: 2.0,
//                             valueColor:
//                             AlwaysStoppedAnimation<Color>(
//                                 Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class MyApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }
// }
//
// class _MyAppState extends State<MyApp> {
//   String _message = '';
//
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//
//   _register() {
//     _firebaseMessaging.getToken().then((token) => print(token));
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getMessage();
//   }
//
//   void getMessage() {
//     _firebaseMessaging.configure(
//         onMessage: (Map<String, dynamic> message) async {
//       print('on message $message');
//       setState(() => _message = message["notification"]["title"]);
//     }, onResume: (Map<String, dynamic> message) async {
//       print('on resume $message');
//       setState(() => _message = message["notification"]["title"]);
//     }, onLaunch: (Map<String, dynamic> message) async {
//       print('on launch $message');
//       setState(() => _message = message["notification"]["title"]);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text("Message: $_message"),
//                 OutlineButton(
//                   child: Text("Register My Device"),
//                   onPressed: () {
//                     _register();
//                   },
//                 ),
//                 // Text("Message: $message")
//               ]),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'home.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Web Views',
//       theme: ThemeData(
//           primarySwatch: Colors.blue,
//           fontFamily: "Arial",
//           textTheme: TextTheme(
//               button: TextStyle(color: Colors.white, fontSize: 18.0),
//               title: TextStyle(color: Colors.red))),
//       home: Home(),
//     );
//   }
// }
