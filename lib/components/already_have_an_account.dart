import 'package:flutter/material.dart';
import 'package:logon_signup_test/constants.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccount({Key key,
    this.login = true,
    this.press,  
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Text(
          login? "Don't have an account ? " : "Already have an account ?"
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " Sign Up" : " Sign In",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}