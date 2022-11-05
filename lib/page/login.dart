import 'package:flutter/material.dart';
import '../style.dart' as style;
import '../main.dart';
import '../future/user.dart';



class LoginPage extends StatefulWidget{
  const LoginPage({Key? key, this.setStart}): super(key: key);
  final setStart;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context){
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    Future<String>? checkLogin = null;
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
                  controller: pwController,
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
                  onTap: () {
                    setState(() {
                      checkLogin = loginUser(idController.text, pwController.text);
                    });
                      print("${idController.text},${pwController.text}");
                   // widget.setStart();
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
              FutureBuilder(
                future: checkLogin,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Text("yes");
                  } else if (snapshot.hasError) {
                    return Text("no");
                  }
                  return Container();
                },
              )
            ],
          )
        )
    );
  }
}