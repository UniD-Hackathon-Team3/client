import '../future/post.dart';
import '../style.dart' as style;
import 'package:flutter/material.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({Key? key, this.feed, this.img}) : super(key: key);

  final feed; 
  final img;
  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}
bool onlyFriendFlag = true;

class _PostDetailPageState extends State<PostDetailPage> {
  late Future<Map<String,dynamic>> todayQuestion;
  
  @override
  Widget build(BuildContext context) {

    todayQuestion = getNowTopic();
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
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: deviceWidth * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                              color: style.yellowboxcolor
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FutureBuilder<Map<String, dynamic>>(
                                  future : todayQuestion,
                                  builder: (context, snapshot){
                                    if(snapshot.hasData){
                                      return Text(snapshot.data!['title'], style: style.textstyle1);
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
                        Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                            child:  style.ShowVideoImage(deviceHeight, deviceWidth, widget.feed, widget.img)
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
                                      hintText: "comments..",
                                      filled: true,
                                      fillColor: style.whiteboxcolor,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30)),
                                    )),
                              ),
                            ),
                            IconButton(onPressed: () {},
                                icon: Icon(Icons.upload, color: Colors.white,))
                          ],
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
