import 'package:flutter/material.dart';
import 'package:nowat/future/topic.dart';
import '../style.dart' as style;

class VotePage extends StatefulWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {

  late Future<List<dynamic>> topics;
  @override
  Widget build(BuildContext context) {

    topics = getRandomTopic(); 
    print(topics);

    final deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    final deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    return 
        FutureBuilder<List<dynamic>>(
          future : topics,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Column(
                  children:   
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 28),
                      child: Image.asset('../images/vote.png'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("W", style: style.textWHATYellow,),
                        Text("HAT ", style: style.textWHAT,),
                        Text("I", style: style.textWHATYellow,),
                        Text("S ", style: style.textWHAT,),
                        Text("T", style: style.textWHATYellow,),
                        Text("OMORROW ", style: style.textWHAT,),
                        Text("T", style: style.textWHATYellow,),
                        Text("OPIC ", style: style.textWHAT,),
                        Text("?", style: style.textWHATYellow,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: deviceWidth * 0.8,
                            child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: style.whiteboxcolor,
                                  enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Color(0xFF716EFF),
                            width:1
                          ),
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:Color(0xFF716EFF),
                                width:1
                            ),
                            borderRadius: BorderRadius.circular(30)),
                                )),
                          ),
                        ),
                        IconButton(onPressed: () {},
                            icon: Icon(Icons.upload, color: Colors.white,))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
                      child: Text("pick your topic!", style: style.textWhiteName),
                    ),
                    Container(
                      height: 40,
                      width: deviceWidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                          color: Color(0xFFFFFFFF),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(snapshot.data![0]['title'], style: style.textstyle1),
                          ]
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: deviceWidth * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                            color: Color(0xFFDEDEDE),
                          ),
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(snapshot.data![1]['title'], style: style.textstyle1),
                              ]
                          ),
                        ),
                        Container(
                          height: 40,
                          width: deviceWidth * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                            color: Color(0x90DEDEDE),
                          ),
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 20),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(snapshot.data![2]['title'], style: style.textstyle1),
                              ]
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: deviceWidth * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                        color: Color(0x90DEDEDE),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(snapshot.data![3]['title'], style: style.textstyle1),
                          ]
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: deviceWidth * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                            color: Color(0xFFDEDEDE),
                          ),
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(snapshot.data![4]['title'], style: style.textstyle1),
                              ]
                          ),
                        ),
                        Container(
                          height: 40,
                          width: deviceWidth * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                            color: Color(0xFFDEDEDE),
                          ),
                          margin: EdgeInsets.fromLTRB(30, 0, 20, 20),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(snapshot.data![5]['title'], style: style.textstyle1)
                              ]
                          ),
                        ),
                      ],
                    ),
              
                  ]
                );
              }
            else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }
        )
    ;
  }
}