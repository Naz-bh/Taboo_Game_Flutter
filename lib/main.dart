import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'timer.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: Taboo() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}
class Taboo extends StatefulWidget {
  const Taboo({Key? key}) : super(key: key);

  @override
  State<Taboo> createState() => _TabooState();
}


class _TabooState extends State<Taboo> {


  Color teamColor= Colors.green;
  int _counter = 0;
  int buttonCount = 0;

  void _increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }

  static const maxSeconds =30;
  int seconds = maxSeconds;
  Timer? timer;

  bool _teamButtonPressed = false;
  bool _isButtonDisabled = false;
  int score =0;
  int team=1;


  void startTimer(){
    timer=Timer.periodic(Duration(seconds: 1), (_) {
      if(seconds>0) {
        setState(() => seconds--);
      }
      else {
        stopTimer();
      }
      if(seconds==0) {
        team=2;
        teamColor=Colors.red;
      }
    });
  }

  void stopTimer(){
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 151, 136, 1),
        body: Center(
          child: ChangeNotifierProvider<TimeState>(
            create: (context) => new TimeState(),
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height:MediaQuery.of(context).size.height*0.01,
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Center(
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.04,
                                  width: MediaQuery.of(context).size.width*0.75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromRGBO(0, 121, 106, 1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.center ,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget> [
                                      Consumer<TimeState>(
                                          builder: (context, timeState, _)=>
                                              CustomProgressBar(width:290,value: timeState.time ,totalValue: 15)),
                                    ],
                                  ), //BoxDecoration
                                ),
                              ), //Container
                            ), //Flexible
                            SizedBox(
                                height:MediaQuery.of(context).size.height*0.004
                            ), //SizedBox
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Center(
                                child: Flexible(
                                  child:Container(
                                    width: MediaQuery.of(context).size.width*0.95,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(0, 121, 106, 1),)
                                    ,
                                    child: Row(

                                      children: <Widget>[
                                        Flexible(
                                          flex: 1,
                                          fit: FlexFit.tight,
                                          child: Center(
                                              child: Container(
                                                width: MediaQuery.of(context).size.width*0.2,
                                                padding: EdgeInsets.all(3),
                                                // height: MediaQuery.of(context).size.height*0.85,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0),),
                                                ), //BoxDecoration
                                                child: Column(
                                                  children: [
                                                    Container(

                                                        width: MediaQuery.of(context).size.width*0.2,
                                                        height: MediaQuery.of(context).size.height*0.045,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0),),
                                                            color: Colors.green),
                                                        child: Align(
                                                          alignment: Alignment.center,
                                                          child: Text("$_counter",style: TextStyle(fontSize:20, color: Colors.white, fontWeight: FontWeight.bold)
                                                          ),
                                                        )
                                                    ),
                                                    Container(
                                                        width: MediaQuery.of(context).size.width*0.2,
                                                        height: MediaQuery.of(context).size.height*0.03,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white),
                                                        child: Align(
                                                          alignment: Alignment.center,
                                                          child: Text("TEAM-1",style: TextStyle(fontSize:13, fontWeight: FontWeight.bold)),
                                                        )
                                                    ),


                                                  ],
                                                ),
                                              )
                                          ),
                                          //Container
                                        ), //Flexible
                                        SizedBox(
                                          width:MediaQuery.of(context).size.width*0.03,
                                        ), //SizedBox
                                        Flexible(
                                          flex: 1,
                                          fit: FlexFit.tight,
                                          child: Center(
                                              child: Container(
                                                width: MediaQuery.of(context).size.width*0.2,
                                                padding: EdgeInsets.all(3),
                                                // height: MediaQuery.of(context).size.height*0.85,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0),),
                                                ), //BoxDecoration
                                                child: Column(
                                                  children: [
                                                    Container(

                                                      width: MediaQuery.of(context).size.width*0.2,
                                                      height: MediaQuery.of(context).size.height*0.045,
                                                      child: Icon(
                                                        Icons.timer,
                                                        color: Colors.white,
                                                        size: 28.0,
                                                      ),
                                                    ),
                                                    Container(
                                                        width: MediaQuery.of(context).size.width*0.2,
                                                        height: MediaQuery.of(context).size.height*0.03,
                                                        child: Align(
                                                          alignment: Alignment.center,
                                                          child: Text("$seconds",style: TextStyle(fontSize:18, color: Colors.white,fontWeight: FontWeight.bold)),
                                                        )
                                                    ),


                                                  ],
                                                ),
                                              )
                                          ), //Container
                                        ),
                                        SizedBox(
                                          width:MediaQuery.of(context).size.width*0.03,
                                        ),
                                        Flexible(
                                          flex: 1,
                                          fit: FlexFit.tight,
                                          child: Center(
                                              child: Container(
                                                width: MediaQuery.of(context).size.width*0.2,
                                                padding: EdgeInsets.all(3),
                                                // height: MediaQuery.of(context).size.height*0.85,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0),),
                                                ), //BoxDecoration
                                                child: Column(
                                                  children: [
                                                    Container(

                                                        width: MediaQuery.of(context).size.width*0.2,
                                                        height: MediaQuery.of(context).size.height*0.045,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0),),
                                                            color: Colors.red),
                                                        child: Align(
                                                          alignment: Alignment.center,
                                                          child: Text("0",style: TextStyle(fontSize:20, color: Colors.white, fontWeight: FontWeight.bold)
                                                          ),
                                                        )
                                                    ),
                                                    Container(
                                                        width: MediaQuery.of(context).size.width*0.2,
                                                        height: MediaQuery.of(context).size.height*0.03,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white),
                                                        child: Align(
                                                          alignment: Alignment.center,
                                                          child: Text("TEAM-2",style: TextStyle(fontSize:13, fontWeight: FontWeight.bold)),
                                                        )
                                                    ),


                                                  ],
                                                ),
                                              )
                                          ), //Container
                                        ) //Flexible
                                      ], //<Widget>[]
                                      mainAxisAlignment: MainAxisAlignment.center,
                                    ),
                                  ),
                                  // height: MediaQuery.of(context).size.height*0.8
                                ),
                              ),//Container
                            ) //Flexible
                          ], //<Widget>[]
                          mainAxisAlignment: MainAxisAlignment.center,
                        ), //Row
                      ), //Flexible
                      SizedBox(
                        height:MediaQuery.of(context).size.height*0.03,
                      ),
                      //SizedBox
                      Flexible(
                        flex: 3,
                        fit: FlexFit.tight,
                        child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              // height: MediaQuery.of(context).size.height*0.85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white), //BoxDecoration
                              child: Column(
                                children: [
                                  tabooCardDefinition("SOFTWARE", teamColor),
                                  tabooCard("COMPUTER"),
                                  tabooCard("APPLICATION"),
                                  tabooCard("CODING"),
                                  tabooCard("PROGRAMMING"),
                                  tabooCard("ANDROID"),

                                ],
                              ),
                            )
                        ), //Container
                      ), //Flexible
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.04,
                      ),

                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Column(
                          children: [
                            Row(
                              children:<Widget>[
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    // width: MediaQuery.of(context).size.width*0.03,
                                    height: MediaQuery.of(context).size.height*0.07,
                                    child: Consumer<TimeState>(
                                      builder: (context, timeState,_) => ElevatedButton(
                                        onPressed: () {
                                          _teamButtonPressed=true;
                                          _isButtonDisabled=true;

                                          if(_teamButtonPressed==true) {
                                            Timer.periodic(
                                                Duration(seconds: 1), (timer) {
                                              if (timeState.time == 0)
                                                timer.cancel();
                                              else
                                                timeState.time -= 1;
                                            });
                                            startTimer();
                                          }
                                          seconds=30;

                                        },
                                        child:Text("TEAM-$team START",style: TextStyle(fontSize:25, color: Colors.white, fontWeight: FontWeight.bold)),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.yellow,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12), // <-- Radius
                                          ),
                                        ),
                                      ),
                                    ),
                                    //BoxDecoration
                                  ), //Container
                                ),
                              ],
                            ),
                            SizedBox(
                              height:MediaQuery.of(context).size.height*0.01,
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    // width: MediaQuery.of(context).size.width*0.03,
                                    height: MediaQuery.of(context).size.height*0.09,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red,
                                    ),
                                    child: SizedBox(
                                      child: ElevatedButton(
                                        child: Text("TABU",style: TextStyle(fontSize:25, color: Colors.white, fontWeight: FontWeight.bold)),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12), // <-- Radius
                                          ),
                                        ),
                                        onPressed: _isButtonDisabled ?_decreaseCounter : null ,
                                      ),
                                    ),//BoxDecoration
                                  ), //Container
                                ), //Flexible
                                SizedBox(
                                  width:MediaQuery.of(context).size.width*0.03,
                                ), //SizedBox
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    width: 120,
                                    height: MediaQuery.of(context).size.height*0.09,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue,
                                    ) ,
                                    child: SizedBox(
                                      child: ElevatedButton(
                                          onPressed: _isButtonDisabled ? null : null ,
                                          child: Text("PASS",style: TextStyle(fontSize:25, color: Colors.white, fontWeight: FontWeight.bold)),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12), // <-- Radius
                                            ),
                                          )
                                      ),
                                    ),//BoxDecoration
                                  ), //Container
                                ),
                                SizedBox(
                                  width:MediaQuery.of(context).size.width*0.03,
                                ),
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    width: 120,
                                    height: MediaQuery.of(context).size.height*0.09,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green,

                                    ),
                                    child: SizedBox(
                                      child: ElevatedButton(
                                        onPressed: _isButtonDisabled ? _increaseCounter :  null,
                                        child: Text("TRUE",style: TextStyle(fontSize:25, color: Colors.white, fontWeight: FontWeight.bold)),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.green,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12), // <-- Radius
                                          ),
                                        ),
                                      ),
                                    ),//BoxDecoration
                                  ), //Container
                                ) //Flexible
                              ], //<Widget>[]
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ],
                        ), //Row
                      ), //Flexible
                    ], //<Widget>[]
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ), //Column
                ) //Padding
            ),
          ), //Container
        ) //Container
    );

  }

  Widget tabooCard(String txt){
    return Container(
        height: MediaQuery.of(context).size.height*0.085,
        child: Align(
          alignment: Alignment.center,
          child: Text(txt,style: TextStyle(fontSize:25, color: Colors.grey[500], fontWeight: FontWeight.bold)),
        )
    );
  }

  Widget tabooCardDefinition(String txt, Color clr){
    return Container(
        width: 280,
        height: MediaQuery.of(context).size.height*0.09,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0),),
            color: clr),
        child: Align(
          alignment: Alignment.center,
          child: Text(txt,style: TextStyle(fontSize:25, color: Colors.white, fontWeight: FontWeight.bold)
          ),
        )
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
  void tabuPressed(){
    score++;

  }
}


