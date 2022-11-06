import 'dart:convert';
import 'dart:html';

import '../style.dart' as style;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainSearch extends StatefulWidget {
  const MainSearch({Key? key}) : super(key: key);

  @override
  State<MainSearch> createState() => _MainSearchState();
}
String pa="f";
bool isSearch = false;
var cnt=0;
var todayTopic=[];
var searchImgUrl = [];
class _MainSearchState extends State<MainSearch> {
  @override
  Widget build(BuildContext context) {
    String searchTarget = "";
    var st=[];
    var searchRes = [];
    var searchPostId = [];
    const url = "http://13.125.205.227:3000/feed/serach/result";
/*
    Future<dynamic>signupUser(String userId, String userPw) async{
      Map<String, String> headers={
      ‘Content-Type’:‘application/json’
      };
      final response=await http.post(Uri.http(‘http://13.125.205.227:3000’,‘/user/signup’), headers: headers, body:<String, String>{‘user_id’: userId, ‘user_pw’: userPw});
      if(response.statusCode == 200) return User(userId: userId, userPw: userPw);
      else {
      throw Exception(‘Failed to signup User’);
      }
    }
*/
    Future<dynamic> getRandomTopic() async {
      final _res=await http.post(
          Uri.parse('http://13.125.205.227:3000/topic/randomTopic')
      );
      var resul=jsonDecode(_res.body);
      todayTopic=[];
      for(int i=0;i<resul["randomtopics"].length;i++)
      {
        if(resul["randomtopics"][i]["title"]==Null)
          continue;
        var tmp=resul["randomtopics"][i]["title"]??"Error";
        print(tmp);
        if(tmp!="Error")
          todayTopic.add(tmp);
      }
      print(todayTopic);
    }
    if(!isSearch) {
      getRandomTopic();
    }
    else
      {
        print(searchImgUrl);
      }
    Future<dynamic> plz(String data) async {
      final response = await http.post(
          Uri.parse('http://13.125.205.227:3000/feed/search'),
          body: <String, String>{"word": data});
      searchRes = jsonDecode(response.body);
      //searchRes=검색어를 던짐 => topic_id,title을 줌  =>
      for (var i = 0; i < searchRes.length; i++) {
        var itm = searchRes[i]["topic_id"].toString();
        var res = await http.post(
            Uri.parse('http://13.125.205.227:3000/feed/search/result'),
            body: <String, String>{"topic_id": itm});
        var itm1 = jsonDecode(res.body);
        if (itm1["hot_feed"].length == 0) continue;
        for (var i = 0; i < itm1["hot_feed"].length; i++) {
          var itm2 = itm1["hot_feed"][i]["post_id"].toString();
          searchPostId.add(itm2);
        }
        //searchPostId.add(jsonDecode(res.body));
      }
      searchImgUrl=[];
      for (int i = 0; i < searchPostId.length; i++) {
        var def = "http://13.125.205.227:3000/static/";
        var cus = searchPostId[i] + ".png";
        var fin_url = def + cus;
        setState((){searchImgUrl.add(fin_url);});
      }
      cnt=searchImgUrl.length;
      print(searchImgUrl);
    }

    final myController = TextEditingController();
    const dummy = ["점심 메뉴 추천", "When your friends are idots", "안티티티프레즐"];
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
              width: deviceWidth / 1.4,
              margin: EdgeInsets.only(
                  top: deviceHeight / 20, left: deviceWidth / 8),
              child: TextField(
                  textAlign: TextAlign.center,
                  controller: myController,
                  onChanged: (value) => {
                    searchTarget = value,
                  },
                  onSubmitted: (value) => {
                    setState(() {
                      isSearch = true;
                    }),
                    plz(searchTarget)
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 10.0),
                        borderRadius: BorderRadius.circular(30)),
                    hintText: 'Search..',
                    suffixIcon: Icon(Icons.search),
                  )),
            ),
            Container(
                margin: EdgeInsets.only(
                    top: deviceHeight / 30, left: deviceWidth / 50),
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
            for (int i = 0; i < todayTopic.length; i++)
              Container(
                child: Text('${todayTopic[i]}',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 15, color: Colors.white, height: 2.5)),
                width: deviceWidth / 3,
                height: deviceHeight / 15,
                margin: EdgeInsets.only(bottom: 10, left: deviceWidth / 15),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.3, color: Colors.white),
                    borderRadius: BorderRadius.circular(30)),
              )
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
        /*
        decoration: BoxDecoration(
          border: Border.all(width:1,color: Colors.white),
        ),
        if isSearch True => searchImgUrl.length 만큼만 뜸
        else => random 5개 뜸
         */
          height: 180,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  if (isSearch) //검색 버튼 눌렀을 때
                    for (var i = 0; i < searchImgUrl.length; i++)
                      Container(
                        child: Container(
                            margin: EdgeInsets.only(
                                top: 120, right: deviceWidth / 8),
                            child: Icon(Icons.favorite_rounded)),
                        margin: EdgeInsets.only(left: 60, bottom: 3),
                        width: deviceWidth / 4,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    searchImgUrl[i])),
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                      )
                  else //검색버튼 누르기 전
                    for (var i = 32; i < 36; i++)
                      Container(
                        child: Container(
                            margin: EdgeInsets.only(
                                top: 120, right: deviceWidth / 8),
                            child: Icon(Icons.favorite_rounded)),
                        margin: EdgeInsets.only(left: 50, bottom: 3),
                        width: deviceWidth / 4,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("http://13.125.205.227:3000/static/${i}.png")),
                            borderRadius: BorderRadius.circular(30)),
                      )
                ],
              ))),
      Row(children: [
        Container(
            margin: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.favorite_rounded,
              color: Colors.red,
            )),
        Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "팔로잉 컨텐츠",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ))
      ]),
      Container(
          height: deviceHeight / 4,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  if (isSearch) //검색 버튼 눌렀을 때
                    for (var i = 0; i < 3; i++)
                      Container(
                        child: Container(
                            margin: EdgeInsets.only(
                                top: 120, right: deviceWidth / 8),
                            child: Icon(Icons.person_rounded)),
                        margin: EdgeInsets.only(left: 50, bottom: 3),
                        width: deviceWidth / 4,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "images/f${i+1}.jpg" )),

                            borderRadius: BorderRadius.circular(30)),
                      )
                  else //검색 버튼 누르기 전
                    for (var i = 4; i < 9; i++)
                      Container(
                        child: Container(
                            margin: EdgeInsets.only(
                                top: 120, right: deviceWidth / 8),
                            child: Icon(Icons.person_rounded)),
                        margin: EdgeInsets.only(left: 50, bottom: 3),
                        width: deviceWidth / 4,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/f${i}.jpeg")),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                ],
              ))),
    ]);
  }
}
