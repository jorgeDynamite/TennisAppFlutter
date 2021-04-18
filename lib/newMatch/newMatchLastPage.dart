import 'package:TennisApp/HomePageStuff/View.dart';
import 'package:TennisApp/newMatch/newMatchFirstPage.dart';
import 'package:flutter/material.dart';

class NewMatchLastPage extends StatefulWidget {
  @override
  _NewMatchLastPageState createState() => _NewMatchLastPageState();
}

class _NewMatchLastPageState extends State<NewMatchLastPage> {
  TextEditingController controller;
  double greenLineWidth = 214;
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
  
    
  List<String> tournaments = ["Södertälje", "Audi cup", "miami open"];
  List<bool> firststatButtonsOnPressedBool = [
    true,
    true,
    true,
    false,
    false,
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
List<bool> changeablestatButtonsOnPressedBool = [true, false ];


@override
    void dispose() {
        controller.dispose(); //prevents memory leak
    }
// Current Tournaments 

Widget currentTournamentarg;

Widget currentTournamentState(widget) {
if(widget == null){
 return currentTournament();
} else {
  return widget;
}
  
}

Widget currentTournament(){
  return Stack(children: [
                        Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 15, right: 45),
                            child: MaterialButton(
                                highlightColor: null,
                                splashColor: null,
                                onPressed: () {
                                  
                                
                                  this.setState(() {
                                    if (theWidgetIndex == 0) {
                                      if (!matchTypenotClickOnTwoButtonsTwice) {
                                      statCheatCurrentWidget = Container();
                                      nextButtonWidgetStateDependent =
                                          SizedBox(height: 10);
                                      theWidget = surfaceTypesWidget();
                                      witchTournamentStateActiveOrNot =
                                          witchTournamentWidget();
                                      theWidgetIndex = 1;
                                      paddingMenuBar = 0;
                                       surfacenotClickOnTwoButtonsTwice = true;
                                       }
                                    } else {
                                      if (!matchTypenotClickOnTwoButtonsTwice) {
                                      statCheatCurrentWidget =
                                          null;

                                      nextButtonWidgetStateDependent =
                                          nextButton();
                                      theWidgetIndex = 0;
                                      theWidget = Container();
                                      paddingMenuBar = 216;
                                      witchTournamentStateActiveOrNot =
                                          Container();
                                           surfacenotClickOnTwoButtonsTwice = false;
                                    }}
                                  });
                                 
                                },
                                child: Container(
                                  height: 50,
                                  
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Color(0xFF3E3B3B),
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Row(children: [
                                    Text(
                                      matchTypeButtonText,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          left: 0,
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                          color: matchTypeButtoniconColor,
                                        ))
                                  ]),
                                ))),
                      ]);
}




// New Tournament Button

Widget newTournamentButtonArg; 

Widget newTournamentTextFieldState(widget) {
  if (widget == null) {
return Container();
  } else {
    return widget;
  }



  
}


Widget newTounamentField(TextEditingController controller, IconData icon,
    String labelText, bool obscure) {
  return Padding(child: Container(
    height: 50,
   
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xFF3E3B3B),
        border: Border.all(color: Colors.transparent)),
    child: TextField(
      onChanged: (text) {
if(text != "") {
  textFieldChangedBool = true; 
} else {
  textFieldChangedBool = false;
}
      },
      obscureText: obscure,
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          labelStyle: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          // prefix: Icon(icon),
          border: InputBorder.none),
    ),
  ), padding: EdgeInsets.only(left: 30, top: 15, right: 60),);
}
// Statcheat buttons

  Widget statCheatCurrentWidget;

  Widget statCheatWidgetState(widget) {
    if (widget == null) {
      return statCheatWidget();
    } else {
      return widget;
    }
  }

  Widget statCheatButtons(
      String stat,
      int buttonIndex,
      double topTextPadding,
      double botTextPadding,
      double leftTextPadding,
      double rightTextPadding,
      double fontSize) {
    Color borderColor;
    bool onPressedBool;
   setState(() {
     if (firststatButtonsOnPressedBool[buttonIndex]) {
      borderColor = Colors.cyan;
    } else {
      borderColor = Colors.transparent;
    }
   });

    
    
    
if(borderColor == null ) {
  print("color null");

}
    return Expanded(
        child: Container(
      height: 68,
      width: 68,
        
      child: MaterialButton(
          onPressed: () {
            print(firststatButtonsOnPressedBool[buttonIndex]);
           
              if (firststatButtonsOnPressedBool[buttonIndex]) {
                 this.setState(() {
                   firststatButtonsOnPressedBool[buttonIndex] =
                    !firststatButtonsOnPressedBool[buttonIndex];
                borderColor = Colors.cyan;
                
                     });
              } else {
                 this.setState(() {
                   firststatButtonsOnPressedBool[buttonIndex] =
                    !firststatButtonsOnPressedBool[buttonIndex];
                     borderColor = Colors.transparent;
                     });
               
                
              }
           
          },
          child: Padding(
            padding: EdgeInsets.only(
                bottom: botTextPadding,
                left: leftTextPadding,
                right: rightTextPadding,
                top: topTextPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(stat,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: fontSize,
                    ))
              ],
            ),
          )),
          decoration: BoxDecoration(
          color: Color(0xFF3E3B3B),
          shape: BoxShape.circle,
       border: Border.all(color: borderColor, width: 3)), 
    ));
  }

  Widget statCheatWidget() {
    return Column(children: [
      Stack(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xFF272626),
            ),
            height: 310,
            width: 350,
          ),
        ]),
        Padding(
          padding: EdgeInsets.only(left: 7, right: 7, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Select statitics you want to track",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, right: 35),
                child: Row(
                  children: [
                    statCheatButtons("Winners", 0, 0, 2, 0, 0, 12),
                    statCheatButtons("Double Faults", 1, 2, 5, 7, 0, 12),
                    statCheatButtons("Unforced   Errors", 2, 2, 4, 1, 0, 12),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  statCheatButtons("First Serves", 3, 0, 2, 6, 0, 12),
                  statCheatButtons("Second Serves", 4, 0, 2, 3, 0, 12),
                  statCheatButtons("Forced Errors", 5, 0, 2, 5, 0, 12),
                  statCheatButtons("Aces", 6, 0, 2, 0, 0, 14),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  statCheatButtons("Volley Errors", 7, 0, 2, 6, 0,
                      12), // last 4 is textPadding args and fontSize args
                  statCheatButtons("Volley winners", 8, 0, 0, 2, 0, 12), // tblr
                  statCheatButtons("Return Winners", 9, 0, 0, 0, 0, 12),
                  statCheatButtons("Return Errors", 10, 0, 2, 4, 0, 12),
                ],
              ),
              /*
            Padding(padding: EdgeInsets.only(top: 20), child: 
            Text("Select", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,)))*/
            ],
          ),
        )
      ])
    ]);
  }

  //Witch Tournament Widgets
  Widget witchTournamentStateActiveOrNot = Container();
  Widget witchTournamentWidgetState(widget) {
    return widget;
  }

  Widget witchTournamentWidget() {
    List<Widget> torunamentsWidget = [];
    for (var i = 0; i < tournaments.length; i++) {
      if (i == tournaments.length - 1) {
        torunamentsWidget.add(Column(children: [
          SurfaceButton(tournaments[i], 2, 1),
        ]));
      } else {
        torunamentsWidget.add(Column(children: [
          SurfaceButton(tournaments[i], 2, 1),
          Divider(
            thickness: 0.5,
            color: Colors.white,
            height: 0,
            endIndent: 20,
            indent: 20,
          ),
        ]));
      }
    }

    return Container(
      color: Color(0xFF3E3B3B),
      height: 450,
      width: 270,
      child: Column(
        children: torunamentsWidget,
      ),
    );
  }

bool controllerHasText(bool theBool){
  bool returnBool = false;
  String text;
  try { 
    

    } on Exception catch (_) {
      print("throwing new error");
      
      throw Exception("No text in field ");
    }
    return returnBool;
}
void checkForErrorFunction(){
  if(iconPressedBool){
if(textFieldChangedBool){
 
                if(surfaceTypeButtonText != "Surface") {
                  
                  Navigator.push(context,
                MaterialPageRoute(builder: (_) => NewMatchFirstPage()));
                } else {
                  setState(() {
                    errorMessageArg = errorMessage();
                  errorMessagePadding = 37;
                  });
                  
                }
            } else {
 setState(() {
                    errorMessageArg = errorMessage();
                  errorMessagePadding = 37;
                  });
            }
  } else {
    if(matchTypeButtonText != "Tournament") {
       if(surfaceTypeButtonText != "Surface") {
                  
                  Navigator.push(context,
                MaterialPageRoute(builder: (_) => NewMatchFirstPage()));
                } else {
 setState(() {
                    errorMessageArg = errorMessage();
                  errorMessagePadding = 37;
                  });
                }
    } else {
 setState(() {
                    errorMessageArg = errorMessage();
                  errorMessagePadding = 37;
                  });
    }
  }
     
}
  Widget nextButtonState(widget) {
    if (widget == null) {
      return nextButton();
    } else {
      return widget;
    }
  }

  Widget nextButton() {
    return MaterialButton(
        onPressed: () {
          setState(() {
            if (greenLineWidth != 321) {
              greenLineWidth = greenLineWidth + 107;
            }
         checkForErrorFunction();
           
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              colors: [Color(0xFF272626), Color(0xFF6E6E6E)],
            ),
          ),
          height: 70,
          width: 350,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Start the match",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 22,
                color: Colors.white,
              )
            ],
          ),
        ));
  }

  Widget SurfaceButton(matchTypeText, matchTyperIndex, int surfaceOrTournament) {
    return Padding(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        MaterialButton(
          splashColor: Colors.green,
          onPressed: () {
            setState(() {
              
              surfaceTypesVariable = Container();
              statCheatCurrentWidget =
                                          null;
              witchTournamentStateActiveOrNot = Container();
              theWidget = Container();
              
              
              theWidgetIndex = 0;

            });
            //Rules and MAtchType text fixes

            setState(() {
              nextButtonWidgetStateDependent = nextButton();
              paddingMenuBar = 216;
              if(surfaceOrTournament == 2) {
                surfaceTypeButtonText = matchTypeText;
                surfaceButtoniconColor = Color(0xFF0ADE7C); 
                 
                 matchTypenotClickOnTwoButtonsTwice = false;
              } else {
matchTypeButtonText = matchTypeText;
matchTypeButtoniconColor = Color(0xFF0ADE7C);
surfacenotClickOnTwoButtonsTwice = false ;

              }
              
            });
          },
          child: Text(
            matchTypeText,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        )
      ]),
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
    );
  }

  Widget surfaceTypeWidgetState(widget) {
    if (widget == null) {
      return Container();
    } else {
      return widget;
    }
  }

  Widget surfaceTypesWidget() {
    return Container(
      color: Color(0xFF3E3B3B),
      height: 235,
      width: 270,
      child: Column(
        children: [
          SurfaceButton("Hard Court", 1, 2 ),
          Divider(
            thickness: 0.5,
            color: Colors.white,
            height: 0,
            endIndent: 20,
            indent: 20,
          ),
          SurfaceButton("Clay", 2, 2),
          Divider(
            thickness: 0.5,
            color: Colors.white,
            height: 0,
            endIndent: 20,
            indent: 20,
          ),
          SurfaceButton("Grass", 3 ,2 ),
          Divider(
            thickness: 0.5,
            color: Colors.white,
            height: 0,
            endIndent: 20,
            indent: 20,
          ),
          SurfaceButton("Carpet", 4 ,2 ),
        ],
      ),
    );
  }


double errorMessagePadding = 250;
Widget errorMessageArg;

Widget errorMessageState(widget) {
  if(widget == null){

return Container();

  } else {

return widget;

  }
}

Widget errorMessage() {
return Text("Error: Must fill in all information ", style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),);
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
                          "Opponent",
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
                          "Rules",
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
                          "Details",
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
                        width: 321,
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
                  height: 210,
                  width: 350,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0, top: 10),
                        child: Row(children: [
                          Stack(
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  if (!iconPressedBool) {
                                    this.setState(() {
                                      iconPressed = Icon(Icons.check,
                                          color: Color(0xFF0ADE7C));
                                          newTournamentButtonArg = newTounamentField(controller, Icons.text_snippet, "New Tournament Name", false);
                                          currentTournamentarg = Container();
                                                                            iconPressedBool = !iconPressedBool;

                                    });
                                  } else {
                                    this.setState(() {
                                      iconPressed = null;
                                   
                                  iconPressedBool = !iconPressedBool;
                                  newTournamentButtonArg = null;
                                  currentTournamentarg = currentTournament();
                                   });
                                  }
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  color: Color(0xFF3E3B3B),
                                  child: iconPressed,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 62, top: 15),
                                  child: Text(
                                    "New Tournament",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ))
                            ],
                          ),
                        ]),
                      ),
                      // Tournament button start
newTournamentTextFieldState(newTournamentButtonArg),
currentTournamentState(currentTournamentarg),
                     
                      // Surface Type Button start
                      Padding(
                          padding:
                              EdgeInsets.only(left: 15, top: 15, right: 45),
                          child: MaterialButton(
                              highlightColor: null,
                              splashColor: null,
                              onPressed: () {
                               
                                this.setState(() {
                                  
                                  if (theWidgetIndex == 0) {
                                     if (!surfacenotClickOnTwoButtonsTwice) {
                                    statCheatCurrentWidget = Container();
                                    nextButtonWidgetStateDependent =
                                        SizedBox(height: 10);
                                    surfaceTypesVariable = surfaceTypesWidget();
                                    matchTypenotClickOnTwoButtonsTwice = true; 
                                    theWidgetIndex = 1;
                                    paddingMenuBar = 0;
                                    }
                                  } else {
                                    if (!surfacenotClickOnTwoButtonsTwice) {
                                    statCheatCurrentWidget =
                                          null;

                                    nextButtonWidgetStateDependent =
                                        nextButton();
                                    surfaceTypesVariable = Container();
                                    matchTypenotClickOnTwoButtonsTwice = false;
                                    theWidgetIndex = 0;
                                    paddingMenuBar = 216;
                                  }}
                                });
                                
                              },
                              child: Container(
                                height: 50,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xFF3E3B3B),
                                    border:
                                        Border.all(color: Colors.transparent)),
                                child: Row(children: [
                                  Text(
                                    surfaceTypeButtonText,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                        left: 0,
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: surfaceButtoniconColor,
                                      ))
                                ]),
                              ))),

                      //Surface type button end
                    ],
                  ),
                ),
                padding: EdgeInsets.only(
                  left: 13.5,
                  right: 13.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, top: 130, right: 50),
                child: Container(
                  child: Column(children: [
                    witchTournamentWidgetState(witchTournamentStateActiveOrNot),
                  ]), // surfaceTypeWidgetState(theWidget)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, top: 200, right: 50),
                child: Container(
                  child: Column(children: [
                    surfaceTypeWidgetState(surfaceTypesVariable),
                  ]), // surfaceTypeWidgetState(theWidget)
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          statCheatWidgetState(statCheatCurrentWidget),
          SizedBox(height: 0), // paddingMenuBar
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: errorMessagePadding),
            child:Row(children: [ MaterialButton(
              onPressed: () {
                greenLineWidth = greenLineWidth - 107;

                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NewMatchFirstPage()));
              },
              child: Container(
                height: 50,
                width: 80,
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
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      padding: EdgeInsets.only(),
                    )
                  ],
                ),
              ),
            ),
            errorMessageState(errorMessageArg),
            ],)
          ),
          SizedBox(height: 15),
          nextButtonState(nextButtonWidgetStateDependent),
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
        if(text != "") {
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
