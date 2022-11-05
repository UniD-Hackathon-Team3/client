import 'package:flutter/material.dart';
import '../style.dart' as style;
import '../main.dart';



class LoginPage extends StatefulWidget{
  const LoginPage({Key? key, this.setStart}): super(key: key);
  final setStart;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
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
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: style.whiteboxcolor,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
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
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: style.whiteboxcolor,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {widget.setStart();},
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
