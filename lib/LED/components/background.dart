import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          /*Positioned(
            top: 22,
            left: 10,
            child: IconButton(
              iconSize: 33.0,
              icon: Icon(Icons.arrow_back_ios  ),
              onPressed: (){print("heyhye");},
            ),

          ),*/         //NON SCROLLABLE BUTTON
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.2,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/login_bottom.png",
              width: size.width * 0.4,
            ),
          ),
          /*Positioned(
            child: Image.asset(
              "assets/images/center.png",
              width: size.width ,
            ),
          ),*/
          child,
        ],
      ),
    );
  }
}
