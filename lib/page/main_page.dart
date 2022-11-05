import '../style.dart' as style;
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    String todayQuestion = "당신의 어린 시절 사진을 공유해주세요!";
    bool onlyFriendFlag = true;
    return Container(
      height: 100,
      width: deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Text("WHAT IS TODAY TOPIC ?", style: style.textWHAT,),
          ),
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                    color: style.yellowboxcolor
                  ),
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          Text('# ' + todayQuestion,
                              style: style.textstyle1),
                    ]
                  ),
                ),
              ),
              Expanded(
                flex : 3,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                      color: style.whiteboxcolor
                  ),
                  margin: EdgeInsets.fromLTRB(15, 0, 20, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer),
                            Text(' 3:22',
                                style: style.textstyle1),
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              children: [
                Row(
                  children: [
                      Container(
                      height: 30,
                      width: deviceWidth * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                          color: style.whiteboxcolor
                      ),
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('only friends',
                                style: style.textstyle1),
                          ]
                      ),
                    ),
                    Container(
                      height: 30,
                      width: deviceWidth * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                          color: style.yellowboxcolor
                      ),
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('random',
                                style: style.textstyle1),
                          ]
                      ),
                    ),
                  ],
                ),
                Container(
                  height: deviceHeight * 0.6,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
