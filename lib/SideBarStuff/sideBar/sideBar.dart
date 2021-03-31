import 'dart:async';



import 'package:TennisApp/SideBarStuff/bloc.animation_bloc/navigation.bloc.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../Players.dart';
import '../../UnusedStuff/ParentCoachMainPage.dart';

import 'menu_item.dart';


class SideBar extends StatefulWidget {
  @override
  SideBar(this.y);
  bool y;
  
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {

  bool loggedIN = true;
  bool playerdataDetected;
  String lastName;
  String email;
  String firstName;
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  List<Player> players = [];
  List<Widget> playersWidgets = [];
  Color color;
  Color iconColor;
  final _animationDuration = const Duration(milliseconds: 500);

  Future _getIfUserDetails(context) async {
    print("run intisState");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool loggedIn = preferences.getBool("loggedIn") ?? false;
    String lastName = preferences.getString("lastName");
    String email = preferences.getString("email");
    String firstName = preferences.getString("firstName");
    String uid = preferences.getString("accountRandomUID");
    print(email);

    final databaseReference = FirebaseDatabase.instance.reference();
  
  DataSnapshot dataSnapshot = await databaseReference.child("CP_Accounts/" + firstName + lastName + "-" +  uid + "/").once();
    if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
     String firstNamePlayer = value["lastName"];
    String lastNamePlayer = value["firstName"];
     String emailPlayer = value["email"];
     String passwordPlayer = value["password"];
     players.add(Player(firstNamePlayer, lastNamePlayer, emailPlayer, passwordPlayer));
     print("adding all the players ");
     print(players.length);
      });
      playerdataDetected = true;
    } else {
      print("no player data was detected");
      playerdataDetected = false;
    }
    int listLength = players.length;
    this.setState(() {
      if(this.playerdataDetected) {
for(var i = 0; i < listLength; i++){
  if(i == 0) {
    color = Color(0xFF0ADE7C);
    iconColor = color;
  } else {
    color = Colors.white;
    iconColor = Colors.cyan;
  }
        this.playersWidgets.add(
           MenuItemPlayers(
             iconColor: iconColor,
             color: color,
             onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyOrdersClickedEvent);
                        },
                        icon: Icons.person,
                        title: players[i].lastName + " " + players[i].firstName,
                      )
         
   
   
                     );
      }
      
      }
      
      this.email = email;
      this.lastName = lastName;
      this.firstName = firstName;
      this.email = email;


    });

    print("object");
  }


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);

    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
    _getIfUserDetails(context); 
    
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }


  @override
  Widget build(BuildContext context) {
    if(firstName == null ) {
      firstName = "waiting";
    }
    if(email == null ) {
      email = "waiting";
    }
    final screenWidth = MediaQuery.of(context).size.width;
   if (widget.y) {
onIconPressed();
    }
    return StreamBuilder<bool>(
      
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth ,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: const Color(0xFF262AAA),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      ListTile(
                        title: Text(
                          firstName,
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          email,
                          style: TextStyle(
                            color: Color(0xFF1BB5FD),
                            fontSize: 18,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                     Column(children: playersWidgets),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        title: "Settings",
                      ),
                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: "Logout",
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xFF262AAA),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF1BB5FD),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}