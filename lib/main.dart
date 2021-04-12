import 'package:TennisApp/HomePage.dart';
import 'package:TennisApp/HomePageStuff/PopUpPlayers.dart';
import 'package:TennisApp/LoadingPage.dart';
import 'package:TennisApp/LoginPage.dart';
import 'package:TennisApp/SignUp.dart';
import 'package:TennisApp/UnusedStuff/Radera_data.dart';
import 'package:TennisApp/emailVerificationPage.dart';
import 'package:TennisApp/newMatch/newMatchFirstPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePageStuff/View.dart';
/*
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
*/

void main() async {
  runApp(MaterialApp(
    home: TennisAppHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class TennisAppHomePage extends StatefulWidget {
  @override
  _TennisAppHomePageState createState() => _TennisAppHomePageState();

  TennisAppHomePage();
}

class _TennisAppHomePageState extends State<TennisAppHomePage> {
  bool loggedIN;
/*
  @override
  void initState() {
    // TODO: implement initState

    _getIfUserLogedIn(context).whenComplete(() async {
      print("done");
      if (!loggedIN) {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => HomePageView([20, 20, 40])));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginScreen()));
      }
    });
    super.initState();
  }
  */
  Future _getIfUserLogedIn(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool loggedIn = preferences.getBool("loggedIn") ?? false;
    setState(() {
      this.loggedIN = loggedIn;
    });

    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return NewMatchFirstPage();
  }
}
