
import 'package:flutter/material.dart';
import 'package:logon_signup_test/Screens/Welcome/components/welcome.dart';

class Background extends StatelessWidget {
  const Background({Key key, SingleChildScrollView child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height ,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget> [
          Positioned(
            top: 0,
            left:0,
            child: Image.asset("assets/images/main_top.png",
              width: size.width * 0.35, 
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("assets/images/main_bottom.png",
              width: size.width * 0.2,
            ),
          ),
          Center(
            child: Welcome(),
          )

        ],
      ),
    );
  }
}