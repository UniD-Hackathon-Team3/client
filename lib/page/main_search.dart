import '../style.dart' as style;
import 'package:flutter/material.dart';

class MainSearch extends StatelessWidget {
  const MainSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    String todayQuestion = "Search";
    return Column(children: [
      Container(
        color: Color(0xFF716EFF),
        height: 100,
        width: deviceWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Container(
              height: 50,
              width: deviceWidth / 2,
              margin: EdgeInsets.only(bottom: 10, left: 300),
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
                margin: EdgeInsets.only(bottom: 10, left: 50),
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
      Row(children: [
        Container(
            width:deviceWidth/5,
            height: deviceHeight/15,
            margin: EdgeInsets.only(bottom: 30, left: 50),
            decoration: BoxDecoration(
                border:Border.all(width: 1,color: Colors.white),
                borderRadius: BorderRadius.circular(30))
        ),
        Container(
            width:deviceWidth/5,
            height: deviceHeight/15,
            margin: EdgeInsets.only(bottom: 30, left: 50),
            decoration: BoxDecoration(
                border:Border.all(width: 1,color: Colors.white),
                borderRadius: BorderRadius.circular(30))
        ),
        Container(
            width:deviceWidth/5,
            height: deviceHeight/15,
            margin: EdgeInsets.only(bottom: 30, left: 50),
            decoration: BoxDecoration(
                border:Border.all(width: 1,color: Colors.white),
                borderRadius: BorderRadius.circular(30))
        ),
        Container(
            width:deviceWidth/5,
            height: deviceHeight/15,
            margin: EdgeInsets.only(bottom: 30, left: 50),
            decoration: BoxDecoration(
                border:Border.all(width: 1,color: Colors.white),
                borderRadius: BorderRadius.circular(30))
        ),
      ])
    ]);
  }
}