import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logon_signup_test/Main/components/mainPage.dart';
import 'package:logon_signup_test/Screens/Login/components/background.dart';
import 'package:logon_signup_test/Screens/SignUp/signup_screens.dart';
import 'package:logon_signup_test/components/already_have_an_account.dart';
import 'package:logon_signup_test/constants.dart';
import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  const Login({
    Key key,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = true;

  //  String _email;
  //  String _password;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   TextEditingController _emailController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();
   FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
          body: LoginBackground(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                    height: size.height * 0.055,
                    child: Email()),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Password
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 60, right: 60),
                    height: size.height * 0.055,
                    child: Password()),
                SizedBox(
                  height: size.height * 0.03,
                ),

                //Login Button
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 60, right: 60),
                  height: size.height * 0.055,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kPrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      side: BorderSide(color: kPrimaryColor)))),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          _signinWithEmailAndPassword();
                        }
                      }
                    ),
                ),

                SizedBox(
                  height: size.height * 0.05,
                ),

                // AlreadyHave acc
                AlreadyHaveAnAccount(press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreens()));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Email() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: kPrimaryLightColor),
      child: TextFormField(
        controller: _emailController,
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
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email is required';
          }
          if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
            return "Please enter a valid email address";
          }
          return null;
        },
        // onSaved: (String value) {
        //   _email = value;
        // },
      ),
    );
  }

  Widget Password() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: kPrimaryLightColor),
      child: TextFormField(
        controller: _passwordController,
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
              _isHidden ? Icons.visibility : Icons.visibility_off,
              color: kPrimaryColor,
            ),
            onTap: tooglePasswordView,
          ),
          border: InputBorder.none
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(18),
          // )
          ),

        validator: (String value){
          if(value.isEmpty){
            return 'Password is required';
          }
          return null;
        },
        // onSaved: (String value){
        //   _password = value;
        // },
      ),
    );
  }

  void tooglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _signinWithEmailAndPassword() async{
    try{
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text)).user;
        if(!user.emailVerified){
          await user.sendEmailVerification();
        }
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return MainPage(user:user);
        }));
    }
    catch(e){
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Failed to sign in with email and password")));
      print(e);
    }
  }

}
