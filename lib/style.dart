import 'package:flutter/material.dart';

var textstyle1 = TextStyle(
  fontSize: 15.0,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
var textstyle2 = TextStyle(
  fontSize: 18.0,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

var textWHAT = TextStyle(
  fontSize: 23.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

var textWHATYellow = TextStyle(
  fontSize: 23.0,
  color: yellowboxcolor,
  fontWeight: FontWeight.bold,
);

var textWhiteName = TextStyle(
  fontSize: 13.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
var textWhiteComment = TextStyle(
  fontSize: 10.0,
  color: Colors.white,
  fontWeight: FontWeight.normal,
);


var theme = ThemeData(  //appbar의 테마 설정
    appBarTheme: AppBarTheme(
        color: Color(0xFF716EFF),
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 50),
        actionsIconTheme: IconThemeData(color: Colors.black),

    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
);

var yellowboxcolor = Color.fromRGBO(216, 244, 141, 0.9);
var whiteboxcolor = Color.fromRGBO(255, 255, 255, 0.3);

ShowVideoImage(deviceHeight) {
  return Stack(
    children:[
      Container(
        height: deviceHeight * 0.5,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), //모서리를 둥글게
            color: Color(0xFFD9D9D9)
        ),
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("영상 썸네일")
            ]
        ),
      ),
      Positioned(
          bottom: deviceHeight * 0.02,
          right: deviceHeight * 0.02,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.add_circle, color: Colors.lightGreenAccent),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.favorite, color: Colors.pink,),
              ),
            ],
          )
      ),
      Positioned(
          bottom: deviceHeight * 0.024,
          right: deviceHeight * 0.05,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: Text("12", style: textWhiteComment),
              ),
            ],
          )
      ),
      Positioned(
          bottom: deviceHeight * 0.015,
          left: deviceHeight * 0.015,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                    color: Colors.black,
                  ),
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text(''),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: SizedBox(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('halleykimmm', style: textWhiteName),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                        child: Text('seoul sinsa', style: textWhiteComment,),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      )
    ],
  );
}