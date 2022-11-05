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
