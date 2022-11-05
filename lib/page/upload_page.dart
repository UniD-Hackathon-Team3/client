import '../style.dart' as style;
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}
bool onlyFriendFlag = true;
String todayQuestion = "당신의 어린 시절 사진을 공유해주세요!";
class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Material(
      child: Container(
        color: Color(0xFF716EFF),
        height: 100,
        width: deviceWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: AppBar(title: Image.asset('images/logoWhite.png', width: 100,),
                  actions: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30), //모서리를 둥글게
                        color: Color(0xDEDEDEDE),
                      ),
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(''),
                    )])
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: deviceWidth * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                            color: style.yellowboxcolor
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('# ' + todayQuestion,
                                  style: style.textstyle1),
                            ]
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                          child: style.ShowVideoImage(deviceHeight, deviceWidth)
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                        child: Container(
                            height: 40,
                            width: deviceWidth * 0.85,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                                color: Color.fromRGBO(255, 255, 255, 0.8)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Upload", style: style.textstyle1),
                              ],
                            ),
                        ),
                      ),
                    ],
                  ),
              ),
              ),
              ],
            )
    ));
  }
}
