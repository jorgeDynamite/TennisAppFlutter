import 'dart:async';

import 'package:flutter/material.dart';

import 'package:TennisApp/HomePageStuff/View.dart';
import 'package:TennisApp/Players.dart';
import 'package:TennisApp/newMatch/newMatchFirstPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MatchPanel extends StatefulWidget {
  MatchPanel(
      this.tournamentDataPack, this.opponentName, this.castLiveResults, this.matchID);
  final String matchID;
  final Tournament tournamentDataPack;
  final String opponentName;
  final bool castLiveResults;
  @override
  _MatchPanelState createState() => _MatchPanelState();
}

class _MatchPanelState extends State<MatchPanel> {
  TextEditingController controller = TextEditingController();
  double greenLineWidth = 214;
  bool castMatchPressed;
  Timer timer;
   String onOff = "OFF"; 
  String imageURL = "Style/Pictures/antenna-white.png";

  String url;
  final databaseReference = FirebaseDatabase.instance.reference();
  String coachlastName;
  String coachfirstName;
  String coachemail;
  String coachuid;
  String playerFirstName;
  String playerLastName;
  int time = 0;
 
  Widget iconPressed;
  bool iconPressedBool = false;
  int theWidgetIndex = 0;
  Widget theWidget = Container();
  String matchTypeButtonText = "Tournament";
  String surfaceTypeButtonText = "Surface";
  Color surfaceButtoniconColor = Colors.white;
  Color matchTypeButtoniconColor = Colors.white;
  double paddingMenuBar = 216;
  Widget nextButtonWidgetStateDependent;
  Widget surfaceTypesVariable;
  bool surfacenotClickOnTwoButtonsTwice = false;
  bool matchTypenotClickOnTwoButtonsTwice = false;
  bool textFieldChangedBool = false;
  String tournamentName;
  Tournament newTournament;
  String surface;
  Matches match;
  List<int> trackedStats = [1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0];
  List<Color> setDevidersLines = [Colors.grey, Colors.transparent, Colors.transparent, Colors.transparent,Colors.transparent];
  List<Color> setsColor = [Colors.white, Colors.transparent, Colors.transparent, Colors.transparent,Colors.transparent];
  
//Varibles for the match
bool trackStats = true;
int whoServes = 1;
List<int> gameStandings = [0,0];
List<int> firstsetStandings = [0,0];
List<int> secondsetStandings = [0,0];
List<int> thirdsetStandings = [0,0];
List<int> fourthsetStandings = [0,0];
List<int> fifthsetStandings = [0,0];



//End 

Future timeTracker() async {

 


  

}

  String nameToLongFunc(String title, int maxAmountLetters) {
    List<String> splitTitle = title.split("");
    print(splitTitle);
    print(splitTitle.length);
    String newTitle = "";
    if (splitTitle.length > maxAmountLetters) {
      for (var i = 0; i < maxAmountLetters; i++) {
        newTitle = newTitle + splitTitle[i];
        print(newTitle);
      }

      return newTitle;
    } else {
      return title;
    }
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
  
   
  }

  

  Widget castMatch(bool onOFF) {
    if(castMatchPressed == null ) {
castMatchPressed = widget.castLiveResults;
imageURL = "Style/Pictures/antenna-green.png";
    }
   
    

    return Column(
      children: [
        IconButton(
            icon: Image.asset(imageURL, height: 30,), onPressed: () {
           
    this.setState(() {
      if (!castMatchPressed) {
      imageURL = "Style/Pictures/antenna-green.png";
      onOff = "ON";
      
    } else {
      
      onOff = "OFF";
      imageURL = "Style/Pictures/antenna-white.png";
     
    }
      castMatchPressed = !castMatchPressed;
    });
              
            }), // Image.asset("")
        
      ],
    );
  }

 //Serveindecator

Widget serveIndacator(serveIndex){
  double height;
  if(whoServes == serveIndex) {
height = 17;
  } else {
    height = 0;
  }

  return Padding( child: Image.asset("Style/Pictures/TennisBall.png", height: height,), padding: EdgeInsets.only(left: 8),);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          SizedBox(height: 25),
          Stack(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xFF272626),
                ),
                height: 49,
                width: 350,
                child: Column(children: [
                  SizedBox(height: 17),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 55),
                        child: Text(
                          "Score",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Helvetica",
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 60),
                        child: Text(
                          "Serve",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Helvetica",
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          "Rally",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Helvetica",
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ]),
              ),
            ]),
            Padding(
                padding: EdgeInsets.only(
                  top: 44,
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 1,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color(0xFF707070),
                          ),
                          height: 3,
                          width: 321,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFF0ADE7C),
                        ),
                        height: 4,
                        width: 112,
                      ),
                    ],
                  ),
                ])),
          ]),
          SizedBox(height: 30),
          Stack(
            children: [
             
              Padding(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xFF272626),
                  ),
                  height: 270,
                  width: 350,
                  child: Column(
                    children: [
                      // ScoreBoard
                      Padding(
                        padding: EdgeInsets.only(left: 15, top: 65, right: 3),
                        child: Container(
                            height: 55,
                            width: 300,
                            color: Color(0xFF3E3B3B),
                            child: Padding(
                                padding: EdgeInsets.only(left: 15, right: 45),
                                child: Row(children: [
                                  Text(
                                    nameToLongFunc("George Tobieson", 18),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  serveIndacator(1),
                                ]))),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 15, top: 15, right: 3),
                        child: Container(
                            height: 55,
                            width: 300,
                            color: Color(0xFF3E3B3B),
                            child: Padding(
                                padding: EdgeInsets.only(left: 15, right: 45),
                                child: Row(children: [
                                  Text(
                                    nameToLongFunc("Karl Tobieson", 18),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                serveIndacator(2),
                                ]))),
                      ),
                      // Game Stats 
                      SizedBox(height: 20,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Container(height: 35, width: 80,  decoration: BoxDecoration(color: Color(0xFF3E3B3B),borderRadius: BorderRadius.all(Radius.circular(20)),), child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("40", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15),), Text(" - ",style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15),), Text("40", style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15),) ]),)],
                      )
                      // Ends
                      
                    ],
                  ),
                ),
                padding: EdgeInsets.only(
                  left: 13.5,
                  right: 13.5,
                ),
              ),

               Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 10,
                  left: 50,
                ),
                child: Row(
                  children: [
                    Text(
                      "Score board: ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
Padding(
                padding: EdgeInsets.only(
                  right: 0,
                
                  left: 140,
                ),
                child:castMatch(castMatchPressed))
                  
                  ],
                ),
              ),
//Streck som delar in vart score är 
Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 65,
                  left: 285,
                ),
                child: Row(children: [Container(height: 125, width: 2, color: setDevidersLines[1],)],),),

Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 65,
                  left: 315,
                ),
                child: Row(children: [Container(height: 125, width: 2, color:  Color(0xFF707070),)],),),
Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 65,
                  left: 255,
                ),
                child: Row(children: [Container(height: 125, width: 2, color:  setDevidersLines[2],)],),),

Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 65,
                  left: 225,
                ),

                child: Row(children: [Container(height: 125, width: 2, color: setDevidersLines[3],)],),),

             Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 65,
                  left: 195,
                ),
                child: Row(children: [Container(height: 125, width: 2, color: setDevidersLines[4],)],),),


//Streck SLUT

// Gem markörerna
 Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 82,
                  left: 324,
                ),
                child: Row(children: [Text("2",  style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: setsColor[0]))],),),
  
Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 152,
                  left: 324,
                ),
                child: Row(children: [Text("0", style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: setsColor[0]))],),),
      
Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 82,
                  left: 294,
                ),
                child: Row(children: [Text("6", style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: setsColor[1]))],),),
    
Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 152,
                  left: 294,
                ),
                child: Row(children: [Text("0", style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: setsColor[1]))],),),
       
Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 82,
                  left: 264,
                ),
                child: Row(children: [Text("6", style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: setsColor[2]))],),),
    
Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 152,
                  left: 264,
                ),
                child: Row(children: [Text("0", style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: setsColor[2]))],),),
       
Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 82,
                  left: 234,
                ),
                child: Row(children: [Text("6", style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: setsColor[3]))],),),
    
Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 152,
                  left: 234,
                ),
                child: Row(children: [Text("0", style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: setsColor[3]))],),),
         
Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 82,
                  left: 204,
                ),
                child: Row(children: [Text("6", style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: setsColor[4]))],),),
    
Padding(
                padding: EdgeInsets.only(
                  right: 0,
                  top: 152,
                  left: 204,
                ),
                child: Row(children: [Text("0", style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: setsColor[4]))],),),
                                     
//Gemmarkörer slut 
 Padding(
                padding: EdgeInsets.only(top: 280, ),
                child:
 Row(
              children: [
                Expanded(
                  child: Padding(
                    child: MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
                      child: Container(
                        height: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFF0ADE7C),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 19, 0, 0),
                              child: Row(children: [
                                Image.asset(
                                  "Style/Pictures/TennisBall.png",
                                  height: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text("Who Won",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.5,
                                          fontFamily: "Telugu Sangam MN",
                                          fontWeight: FontWeight.w600)),
                                )
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(22, 28, 10, 0),
                              child: Text(
                                "George Won",
                                style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(22, 10, 10, 0),
                              child: Column(
                                children: [
                                  Text("",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.5,
                                          fontFamily: "Telugu Sangam MN",
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      padding: EdgeInsets.all(0),
                    ),
                    padding: EdgeInsets.fromLTRB(16, 18, 8, 0),
                  ),
                ),
                Expanded(
                  child: Padding(
                    child: MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
                      child: Container(
                        height: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF272626),
                                          Color(0xFF6E6E6E)
                                        ],
                                      ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Row(children: [
                                Image.asset(
                                  "Style/Pictures/chartgreen.png",
                                  height: 28,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text("Who Won",
                                      style: TextStyle(
                                          color: Color(0xFF9B9191),
                                          fontSize: 11.5,
                                          fontFamily: "Telugu Sangam MN",
                                          fontWeight: FontWeight.w200)),
                                )
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 38, 25, 0),
                              child: Text(
                                "Karl Won",
                                style: TextStyle(
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(22, 25, 10, 0),
                              child: Column(
                                children: [
                                  Text("",
                                      style: TextStyle(
                                          color: Color(0xFF9B9191),
                                          fontSize: 11.5,
                                          fontFamily: "Telugu Sangam MN",
                                          fontWeight: FontWeight.w200)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      padding: EdgeInsets.all(0),
                    ),
                    padding: EdgeInsets.fromLTRB(8, 18, 16, 0),
                  ),
                ),
              ],
            ),),

            //End of who won buttons
            
            
            ],
          ),
          SizedBox(
            height: 120,
          ),
         Text("Match ID: " + widget.matchID,  style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),),

          
         
          SizedBox(height: 14),
          
            Align(alignment: Alignment.bottomCenter,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Stack(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFF272626),
                    ),
                    height: 60,
                    width: 348,
                  ),]),
                  Padding(
                    child: Column(children: [
                    MaterialButton(
                    onPressed: () {
                      greenLineWidth = greenLineWidth - 107;

                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          colors: [Color(0xFF272626), Color(0xFF6E6E6E)],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            child: Column(children: [Text(
                              "Quit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),],),
                            padding: EdgeInsets.only(top: 8),
                          )
                        ],
                      ),
                    ),
                  ),
                    ]),
                    padding: EdgeInsets.only(left: 0, bottom: 28, top: 5,)
                  ),
                  Padding(
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                child: Switch(value: trackStats, onChanged: (value){
                                  this.setState(() {
                                     trackStats = value;
                                  });
                               
                                }, ),
                                padding: EdgeInsets.only(
                                  bottom: 1,
                                  left: 13,
                                ),
                              ),
                              Padding(
                                  child: Text(
                                    "Track Stats",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  padding: EdgeInsets.only(
                                    top: 38,
                                    left: 13,
                                  ))
                            ],
                          ),
                        ],
                      )
                    ]),
                    padding: EdgeInsets.only(left: 123.5, bottom: 0),
                  ),
                  Padding(
                    child: Column(children: [
                    MaterialButton(
                    onPressed: () {
                      greenLineWidth = greenLineWidth - 107;

                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          colors: [Color(0xFF272626), Color(0xFF6E6E6E)],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            child: Column(children: [Text(
                              "Finish & Save",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),],),
                            padding: EdgeInsets.only(top: 12, left: 4),
                          )
                        ],
                      ),
                    ),
                  ),
                    ]),
                    padding: EdgeInsets.only(left: 205, bottom: 28, top: 5,)
                  ),
                 
                ],
              ),
            ]),
          ),
        ]));
  }
}

_buildTextField(TextEditingController controller, IconData icon,
    String labelText, bool obscure, bool ifEddited) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color(0xFF3E3B3B),
        border: Border.all(color: Colors.transparent)),
    child: TextField(
      onChanged: (text) {
        if (text != "") {
          ifEddited = true;
        }
      },
      obscureText: obscure,
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          // prefix: Icon(icon),
          border: InputBorder.none),
    ),
  );
}
