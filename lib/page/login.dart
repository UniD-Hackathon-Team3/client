import 'package:flutter/material.dart';
import '../style.dart' as style;
import '../main.dart';



class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'witt',
      theme: ThemeData(
        primaryColor: Color(0xFF716EFF)
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/logoWhite.png', width: 200,),
              Text("id", style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              )),
              TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: style.whiteboxcolor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  )),
              Text("pw",style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              )),
              TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: style.whiteboxcolor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  )),

            ],
          )
        )
      )
    )
  }
}
