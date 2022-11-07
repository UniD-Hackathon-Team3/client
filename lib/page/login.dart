import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nowat/page/upload_page.dart';
import '../style.dart' as style;
import '../main.dart';
import '../future/user.dart';
import '../notification.dart';
class LoginPage extends StatefulWidget{
  const LoginPage({Key? key, this.setStart}): super(key: key);
  final setStart;
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  String checkLogin = '';

  goNextPage() async {
    checkLogin = await loginUser(idController.text, pwController.text);
    if (jsonDecode(checkLogin)['result'] == "success") {

      widget.setStart();
    }
  }
  @override
  Widget build(BuildContext context){
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFF716EFF),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/logoWhite.png', width: 200,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 30, 10),
                  child: Text("id",style: style.textWhiteName),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: TextField(
                      controller: idController,
                      decoration: InputDecoration(
                        hintText: '   ID',
                        hintStyle : TextStyle(color: Colors.white
                  ,fontWeight: FontWeight.w800, fontSize: 25),
                        border: InputBorder.none,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 30, 10),
                  child: Text("pw",style: style.textWhiteName,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: TextField(
                    
                      controller: pwController,
                      decoration: InputDecoration(
                        hintText: '   PW',
                        hintStyle : TextStyle(color: Colors.white
                  ,fontWeight: FontWeight.w800, fontSize: 25),
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      goNextPage();
                      print("${idController.text},${pwController.text}");
                    },
                    child: Container(
                      height: 40,
                      width: deviceWidth * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50), //모서리를 둥글게
                          color: Color.fromRGBO(255, 255, 255, 0.8)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("로그인/회원가입", style: style.textstyle1),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }
}