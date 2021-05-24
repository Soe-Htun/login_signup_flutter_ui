import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logon_signup_test/Screens/Login/components/background.dart';
import 'package:logon_signup_test/Screens/SignUp/signup_screens.dart';
import 'package:logon_signup_test/components/already_have_an_account.dart';
import 'package:logon_signup_test/constants.dart';

class Login extends StatefulWidget {
 const Login({Key key, }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),

            //Email address
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 60, right: 60),
                height: size.height * 0.04,
                child: Email()),
            SizedBox(
              height: size.height * 0.02,
            ),

            //Password
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 60, right: 60),
                height: size.height * 0.04,
                child: Password()),
            SizedBox(
              height: size.height * 0.03,
            ),

            //Login Button
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 60, right: 60),
              height: size.height * 0.04,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: BorderSide(color: kPrimaryColor)))),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {}),
            ),

            SizedBox(height: size.height * 0.05,),

            // AlreadyHave acc
            AlreadyHaveAnAccount(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreens() ));
              }
            )
          ],
        ),
      ),
    );
  }

  Widget Email() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: kPrimaryLightColor),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.people,
              color: kPrimaryColor,
            ),
            hintText: "Your Email",
            // fillColor: kPrimaryLightColor,
            // filled: true,

            border: InputBorder.none
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(18),
            // )
            ),
        onChanged: (String value) {
          // _email = value;
        },
      ),
    );
  }

  Widget Password() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: kPrimaryLightColor),
      child: TextFormField(
        obscureText: _isHidden,
        // keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            hintText: "Your Password",
            // fillColor: kPrimaryLightColor,
            // filled: true,
            suffixIcon: InkWell(
              child: Icon(
                _isHidden? Icons.visibility : Icons.visibility_off,
                color: kPrimaryColor,
              ),
              onTap: tooglePasswordView,
            ),
            border: InputBorder.none
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(18),
            // )
            ),
       
      ),
    );
  }

  void tooglePasswordView(){
    setState(() {
    _isHidden = !_isHidden;
    });
  }
}
