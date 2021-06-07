import 'package:TennisApp/Players.dart';
import 'package:flutter/material.dart';

class Serve extends StatefulWidget {
  @override
  _ServeState createState() => _ServeState();
  Serve(
      this.whoServes,
      this.doubleFaults,
      this.firstServe,
      this.secondServe,
      this.forcedErrors,
      this.unforcedErrors,
      this.returnError,
      this.voleyError,
      this.returnwinner,
      this.voleywinner,
      this.winner,
      this.tournamentData);
  final int whoServes;
  final bool doubleFaults;
  final bool firstServe;
  final bool secondServe;
  final bool winner;
  final bool voleywinner;
  final bool returnwinner;
  final bool returnError;
  final bool voleyError;
  final bool unforcedErrors;
  final bool forcedErrors;
  final Tournament tournamentData;
}

class _ServeState extends State<Serve> {
  Widget serveButton(String text) {
    Widget thewidget = Column(
      children: [
        SizedBox(
          height: 20,
        ),
        MaterialButton(
            onPressed: () {
                if (text == "First Serve IN") {
      
    widget.tournamentData.matches[0].firstServeProcentage++;
    print(widget.tournamentData.matches[0].firstServeProcentage.toString());
    }

    if (text == "Second Serve IN") {
      widget.tournamentData.matches[0].secondServeProcentage++;
       print(widget.tournamentData.matches[0].secondServeProcentage.toString());
      
    }
    if (text == "Double Fault") {
      widget.tournamentData.matches[0].doubleFaults++;
       print(widget.tournamentData.matches[0].doubleFaults.toString());
    }
  
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF272626),
              ),
              height: 170,
              width: 350,
              child: Stack(children: [
                Column(
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ))
      ],
    );
    if (text == "First Serve IN") {
      if (widget.firstServe) {
        return thewidget;
      } else {
        return Container();
      }
    }

    if (text == "Second Serve IN") {
      if (widget.secondServe) {
        return thewidget;
      } else {
        return Container();
      }
    }
    if (text == "Double Fault") {
      if (widget.doubleFaults) {
        return thewidget;
      } else {
        return Container();
      }
    }
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
                        width: 220,
                      ),
                    ],
                  ),
                ])),
          ]),
          SizedBox(height: 10),
          serveButton("First Serve IN"),
          serveButton("Second Serve IN"),
          serveButton("Double Fault"),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: [Color(0xFF272626), Color(0xFF6E6E6E)],
                  ),
                ),
                height: 60,
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Went in",
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
              )),
        ]));
  }
}
