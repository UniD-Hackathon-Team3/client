import '../style.dart' as style;
import '../future/post.dart';
import 'package:flutter/material.dart';
import 'upload_page.dart';
import 'postdetail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}
bool onlyFriendFlag = true;

 

class _MainPageState extends State<MainPage> {
  
  late Future<Map<String,dynamic>> todayQuestion;
  late Future<List> feeds;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
  
    
    todayQuestion = getNowTopic();
    feeds = getRandomFeed(); 
    
    return Container(
      height: 100,
      width: deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("W", style: style.textWHATYellow,),
                Text("HAT ", style: style.textWHAT,),
                Text("I", style: style.textWHATYellow,),
                Text("S ", style: style.textWHAT,),
                Text("T", style: style.textWHATYellow,),
                Text("ODAY ", style: style.textWHAT,),
                Text("T", style: style.textWHATYellow,),
                Text("OPIC ", style: style.textWHAT,),
                Text("?", style: style.textWHATYellow,),
              ],
            )
          ),
          Row(
            children: [
              Expanded(
                flex: 7,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UploadPage()),
                    );
                  },
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
                            FutureBuilder<Map<String, dynamic>>(
                              future : todayQuestion,
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return Text("#${snapshot.data!['title']}", style: style.textstyle1);
                                }
                                else if(snapshot.hasError){
                                  return Text("${snapshot.error}");
                                }
                                return CircularProgressIndicator();
                              }
                            )
                            
                      ]
                    ),
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
                            FutureBuilder<Map<String, dynamic>>(
                              future : todayQuestion,
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  return Text('${snapshot.data!['endtime'].substring(11,13)}:${snapshot.data!['endtime'].substring(14,16)}까지' , style: style.textstyle1);
                                }
                                else if(snapshot.hasError){
                                  return Text("${snapshot.error}");
                                }
                                return CircularProgressIndicator();
                              } 
                            )
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
                              Text('#Following',
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
                              Text('#Ramdom',
                                  style: style.textstyle1),
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: FutureBuilder<List>(
                                future : feeds,
                                builder: (context, snapshot){
                                  if(snapshot.hasData){
                                    return Row(
                                      children: [
                                        for(int i = 0; i < 4; i++) GestureDetector(
                                            onTap: () {
                                              Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => PostDetailPage(feed : snapshot.data![i], img : Image.network('http://13.125.205.227:3000/static/${snapshot.data![i]['post_id']}.png'))
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:style.ShowVideoImage(deviceHeight, deviceWidth, snapshot.data![i], Image.network('http://13.125.205.227:3000/static/${snapshot.data![i]['post_id']}.png'))  
                                            )
                                        ),
                                      ],
                                    );                                    
                                  }
                                  else if(snapshot.hasError){
                                    return Text("${snapshot.error}");
                                  }
                                  return CircularProgressIndicator();
                                } 
                              ) 
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
