import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double width;
  final int value;
  final int totalValue;

  CustomProgressBar({required this.width, required this.value,required this.totalValue});

  @override
  Widget build(BuildContext context) {
    double ratio = value/totalValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(children:<Widget> [
          Container(
            height: MediaQuery.of(context).size.height*0.04,
            width:width,
            // MediaQuery.of(context).size.width*0.75,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 121, 106, 1),
              borderRadius: BorderRadius.circular(5)
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(5),
            child: AnimatedContainer(
              height: MediaQuery.of(context).size.height*0.04,
              width: width * ratio,
              duration: Duration(milliseconds:15000 ),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
        ],)
      ],
    );

  }
}

class TimeState with ChangeNotifier{
  int _time =15;

  int get time => _time;
  set time(int newTime){
    _time = newTime;
    notifyListeners();
  }
}


