import '../style.dart' as style;
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import '../future/img.dart' as img;
import '../future/post.dart' as post;

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key, this.userid, this.topicid}) : super(key: key);
  final userid;
  final topicid;
  @override
  State<UploadPage> createState() => _UploadPageState();
}
bool onlyFriendFlag = true;
String todayQuestion = "오늘 가장 기억에 남는 일은??";
final TextEditingController feedbackController = TextEditingController();
dynamic? _image;
File? showImage;
class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final picker = ImagePicker();

    Future getImage(imageSource) async {
      final pickedFile = await picker.pickImage(source: imageSource);

      setState(() {
        if (pickedFile != null) {
          _image = pickedFile.path;
          showImage = File(_image);
        } else {
          print('No image selected.');
        }
      });
      var formData = FormData.fromMap({'image': await MultipartFile.fromFile(_image)});
      img.upload(formData);
    }
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
                  )
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
                          child: Container(
                            height: deviceHeight * 0.5,
                            width: deviceWidth * 0.9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20), //모서리를 둥글게
                                color: Color.fromARGB(255, 255, 255, 255)
                            ),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: showImage == null ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("이미지를 선택해주세요!")
                                ]
                            ) : Image.file(showImage as File),
                          ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              getImage(ImageSource.gallery);
                            },
                            child: Container(
                              height: 40,
                              width: deviceWidth* 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                                  color: style.yellowboxcolor
                              ),
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('갤러리 업로드', style: style.textstyle1),
                                  ]
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              getImage(ImageSource.camera);
                            },
                            child: Container(
                              height: 40,
                              width: deviceWidth * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                                  color: style.yellowboxcolor
                              ),
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('카메라 업로드', style: style.textstyle1),
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                            child: SizedBox(
                              width: deviceWidth * 0.7,
                              child: TextField(
                                controller: feedbackController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: style.whiteboxcolor,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30)),
                                  )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              post.addPost(widget.userid, feedbackController.text, widget.topicid);
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                              child: Container(
                                height: 40,
                                width: deviceWidth * 0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                                    color: style.yellowboxcolor
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.upload)
                                  ],
                                ),
                              ),
                            ),
                          ),
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