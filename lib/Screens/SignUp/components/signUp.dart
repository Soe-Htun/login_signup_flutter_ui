import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logon_signup_test/Screens/Login/login_screens.dart';
import 'package:logon_signup_test/Screens/SignUp/components/background.dart';
import 'package:logon_signup_test/components/already_have_an_account.dart';
import 'package:logon_signup_test/constants.dart';
class SignUp extends StatelessWidget {
  const SignUp({ Key key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignUpBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text("SIGNUP",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: size.height * 0.03,),

            SvgPicture.asset("assets/icons/signup.svg",
            height: size.height * 0.35,
            ),

            SizedBox(height: size.height * 0.03,),

            //Email
            Container(
              width: double.infinity,
              height: size.height * 0.04,
              padding: EdgeInsets.only(left: 60, right: 60),
              child: Email()
            ),

            SizedBox(height: size.height * 0.03,),

            //Password

            Container(
              width: double.infinity,
              height: size.height * 0.04,
              padding: EdgeInsets.only(left: 60, right: 60),
              child: Password()
            ),

            SizedBox(height: size.height * 0.03,),

            // SignUp Button
            Container(
              width: double.infinity,
              height: size.height * 0.04,
              padding: EdgeInsets.only(left: 60, right: 60),
              child: ElevatedButton(onPressed: (){},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(color: kPrimaryColor)
                    )
                  )
                ),
                child: Text("Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.05,),

            AlreadyHaveAnAccount(
              login: false,
              press:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              }
            )

          ],
        ),
      ),
    );
  }
  Widget Email(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kPrimaryLightColor
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Email Address",
          prefixIcon: Icon(
            Icons.people,
            color: kPrimaryColor,
          )
        ),
        onChanged: (String value){},
      ),
    );
  } 

  Widget Password(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kPrimaryLightColor
      ),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Password",
          prefixIcon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          )
        ),
        onChanged: (String value){},
      ),
    );
  }
}