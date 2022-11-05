import '../style.dart' as style;
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    String todayQuestion = "# 당신의 어린 시절 사진을 공유해주세요!";
    return Container(
      color: Colors.blue,
      height: 100,
      width: deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: deviceWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), //모서리를 둥글게
              color: Color.fromRGBO(216, 244, 141, 0.9)
            ),
            margin: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [Icon(Icons.access_time_outlined),Text("오늘의 질문", style: style.textstyle2),],
                    ),
                    Text(todayQuestion,
                        style: style.textstyle1),
                ],
              )
              ]
            ),
          ),
        ],
      ),
    );
  }
}
