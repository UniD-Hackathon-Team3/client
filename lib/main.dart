import 'package:flutter/material.dart';
import './style.dart' as style;
import './page/vote_page.dart';
import './page/main_page.dart';
import './page/main_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NowAt',
      theme: style.theme,
      home: const MainFrame(),
    );
  }
}

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  State<MainFrame> createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  int tab = 0;


  @override
  Widget build(BuildContext context) {

    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Material(
      color: Color(0xFF716EFF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: AppBar(title: Image.asset('../images/logoWhite.png', width: 100,),),
          ),
          Expanded(child: [MainPage(), MainSearch(), VotePage()][tab]),
          Container(
              height: 50,
              width: deviceWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                color: Color.fromRGBO(255, 255, 255, 0.8),
              ),
              margin: EdgeInsets.fromLTRB(60, 0, 60, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: GestureDetector(
                      onTap: () =>
                        setState(() {
                          tab = 0;
                      }),
                      child: Container(child: Text("메인", style: style.textstyle1, textAlign: TextAlign.center,))
                  )),
                  Expanded(child: GestureDetector(
                      onTap: () =>
                          setState(() {
                            tab = 1;
                          }),
                      child: Container(child: Text("탐색", style: style.textstyle1, textAlign: TextAlign.center,))
                  )),
                  Expanded(child: GestureDetector(
                      onTap: () =>
                          setState(() {
                            tab = 2;
                          }),
                      child: Container(child: Text("투표", style: style.textstyle1, textAlign: TextAlign.center,))
                  )),
                  ],
              )
          ),
        ],
      ),
    );
  }
}
