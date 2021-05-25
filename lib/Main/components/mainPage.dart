import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logon_signup_test/Screens/Welcome/welcome_screens.dart';
import 'package:logon_signup_test/constants.dart';
// import 'package:firebase/firebase.dart';

class MainPage extends StatefulWidget {
  
  final User user;
    final Widget child;
  const MainPage({Key key, this.user, @required this.child}) : super(key: key);
  
  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome",),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget> [
            Container(
              height: 200,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: kDrawerColor
                ),
                // child: Text("This is Drawer Header"),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Container(
                        width: 100,
                        height: 100,
                        
                        // margin: EdgeInsets.only(top: 5, bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/profile.jpg"),
                            fit: BoxFit.fill
                          )
                        ),
                      ),

                      // Material(
                      //   borderRadius: BorderRadius.all(Radius.circular(50)),
                      //   child: Image.asset("assets/images/profile.jpg",
                      //     width: 100, height: 100,
                      //   ),
                      // ),
                      SizedBox(height: size.height * 0.01 ,),
                      Text(widget.user.displayName,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white
                      ),
                      ),
                      SizedBox(height: size.height * 0.006 ,),
                      Text(widget.user.email,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      )
                    ],
                  ),
                ),
                
              ),
            ),
          
            CustomListTile(Icons.person, 'Profile', ()=> {}),
            CustomListTile(Icons.notifications, 'Notifications', ()=> {}),
            CustomListTile(Icons.settings, 'Settings', ()=> {}),
            CustomListTile(Icons.lock, 'Log Out', ()=> {
              // _signOut().whenComplete(() {
              //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              //     return WelcomeScreen();
              //   }));
              // })

              //sure dialog
              showDialog(context: context,
                builder: (_) => AlertDialog(
                  title: Center(child: Text("Material Dialog")),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text("Are you sure to logout"),
                    ],
                  ),
                  actions: <Widget> [
                    
                    //cancel dialog
                     FlatButton(onPressed: (){
                      Navigator.of(context).pop();
                     },
                     child: Text("Cancel",
                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kDrawerColor),
                     ),
                     
                     ),
                     //ok dialog
                      FlatButton(onPressed: (){
                      _signOut().whenComplete(() {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                          return WelcomeScreen();
                        }));
                      });
                    },
                      child: Text("Ok",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kDrawerColor),
                      ),
                     ),
                     
                  ],
                )

              )
            })
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(widget.user.displayName,
              style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none
            ),
            ),
            Text(widget.user.email,
              style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none
            ),
            )
          ],
        ),
      ),
    );
  }

  Future _signOut() async{
    await _auth.signOut();
  }
}

class CustomListTile extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
        child: InkWell(
          splashColor: kDrawerColor,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Row(
                  children: <Widget> [
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text,
                      style: TextStyle(
                        fontSize: 16
                      ),),
                    ),
                  ],
                ),
                
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}