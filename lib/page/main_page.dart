import '../style.dart' as style;
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}
bool onlyFriendFlag = true;
String todayQuestion = "당신의 어린 시절 사진을 공유해주세요!";
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
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
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              children: [
                Row(
                  children: [
                      GestureDetector(
                        onTap: () {
                          (setState(() => (onlyFriendFlag = true)));
                        },
                        child: Container(
                          height: 30,
                          width: deviceWidth * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                            color: onlyFriendFlag ? style.yellowboxcolor : style.whiteboxcolor
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
                      ),
                    GestureDetector(
                      onTap: () {
                        (setState(() => (onlyFriendFlag = false)));
                      },
                      child: Container(
                        height: 30,
                        width: deviceWidth * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                            color: onlyFriendFlag == false ? style.yellowboxcolor : style.whiteboxcolor
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
                    ),
                  ],
                ),
                Stack(
                  children:[
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
                              padding: const EdgeInsets.all(4),
                              child: Text("12"),
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
                                    color: style.whiteboxcolor,
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
                                    Text('halleykimmm', style: style.textWhiteName),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                                      child: Text('seoul sinsa', style: style.textWhiteComment,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
