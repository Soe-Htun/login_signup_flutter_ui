import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logon_signup_test/Screens/Login/login_screens.dart';
import 'package:logon_signup_test/Screens/SignUp/signup_screens.dart';
import 'package:logon_signup_test/Screens/Welcome/components/background.dart';
import 'package:logon_signup_test/constants.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO EDU",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SvgPicture.asset("assets/icons/chat.svg", height: size.height * 0.45),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              padding: EdgeInsets.only(left: 60, right: 60),
              width: double.infinity,
              height: size.height * 0.055,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ));
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(color: kPrimaryColor),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            Container(
              padding: EdgeInsets.only(left: 60, right: 60),
              width: double.infinity,
              height: size.height * 0.055,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreens()));
                },
                child: Text(
                  "SIGN UP",
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: kPrimaryLightColor))),
                    backgroundColor:
                        MaterialStateProperty.all(kPrimaryLightColor)),
              ),
            )
          ],
        ),
      )
    );
  }
}
