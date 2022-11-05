import '../style.dart' as style;
import 'package:flutter/material.dart';

class MainSearch extends StatelessWidget {
  const MainSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    String todayQuestion = "Search";
    Container my = Container(
      margin: EdgeInsets.only(left: 50),
      width: deviceWidth / 3,
      height: deviceHeight / 3,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(30)),
    );
    return Column(children: [
      Container(
        color: Color(0xFF716EFF),
        height: 100,
        width: deviceWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: deviceHeight / 2,
              width: deviceWidth / 1.6,
              margin: EdgeInsets.only(
                  top: deviceHeight / 20, left: deviceWidth / 10),
              child: TextField(
                  decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black12,
                enabledBorder: OutlineInputBorder(
                    //borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(30)),
                border: OutlineInputBorder(),
                labelText: 'Search..',
                suffixIcon: Icon(Icons.search),
              )),
            ),
            Container(
                margin: EdgeInsets.only(
                    top: deviceHeight / 30, left: deviceWidth / 15),
                child: ClipOval(
                    child: Image.asset(
                  'images/lake.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )))
          ],
        ),
      ),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            ///오늘의 태그
            ///
            Container(
              width: deviceWidth / 3,
              height: deviceHeight / 15,
              margin: EdgeInsets.only(bottom: 10, left: deviceWidth / 15),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Container(
                width: deviceWidth / 3,
                height: deviceHeight / 15,
                margin: EdgeInsets.only(bottom: 10, left: deviceWidth / 15),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(30))),
            Container(
                width: deviceWidth / 3,
                height: deviceHeight / 15,
                margin: EdgeInsets.only(bottom: 10, left: deviceWidth / 15),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(30))),
          ])),
      Row(children: [
        Container(
            margin: EdgeInsets.only(left: 10),
            child: Image.asset(
              'images/crown.jpg',
              width: 50,
              height: 50,
            )),
        Container(
            child: Text(
          "인기 컨텐츠",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ))
      ]),
      //인기 피드
      Container(
        height:300,
      child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
        child:Container(
          child: Column(children: [
            Row(children: [
              Container(
                child: Container(
                    margin: EdgeInsets.only(top:140,right:deviceWidth / 5),
                    child:Icon(Icons.person_rounded)),
                margin: EdgeInsets.only(left: 50, top: 15),
                width: deviceWidth / 3,
                height: deviceHeight / 3,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(30)),
              ),
              Container(
                child: Container(
                    margin: EdgeInsets.only(top:140,right:deviceWidth / 5),
                    child:Icon(Icons.person_rounded)),
                margin: EdgeInsets.only(left: deviceWidth / 7, top: 15),
                width: deviceWidth / 3,
                height: deviceHeight / 3,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(30)),
              )
            ]),
            Row(children: [
              Container(
                child: Container(
                    margin: EdgeInsets.only(top:140,right:deviceWidth / 5),
                    child:Icon(Icons.person_rounded)),
                margin: EdgeInsets.only(left: 50, top: 15),
                width: deviceWidth / 3,
                height: deviceHeight / 3,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(30)),
              ),
              Container(
              child: Container(
              margin: EdgeInsets.only(top:140,right:deviceWidth / 5),
              child:Icon(Icons.person_rounded)),
                margin: EdgeInsets.only(left: deviceWidth / 7, top: 15),
                width: deviceWidth / 3,
                height: deviceHeight / 3,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(30)),
              )
            ]),
            Row(children: [
              Container(
                child: Container(
                  margin: EdgeInsets.only(top:140,right:deviceWidth / 5),
                    child:Icon(Icons.person_rounded))
                ,
                margin: EdgeInsets.only(left: 50, top: 15),
                width: deviceWidth / 3,
                height: deviceHeight / 3,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(30)),
              ),
              Container(
                child: Container(
                    margin: EdgeInsets.only(top:140,right:deviceWidth / 5),
                    child:Icon(Icons.person_rounded)),
                margin: EdgeInsets.only(left: deviceWidth / 7, top: 15),
                width: deviceWidth / 3,
                height: deviceHeight / 3,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(30)),
              )
            ])
          ]))
      )
      )
    ]);
  }
}
