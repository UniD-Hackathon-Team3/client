import 'package:flutter/material.dart';
import '../style.dart' as style;

class VotePage extends StatefulWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 28),
          child: Image.asset('../images/vote.png'),
        ),
        Text("WHAT IS TOMORROW TOPIC ?", style: style.textWHAT),
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
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                    )),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.upload, color: Colors.white,))
          ],
        ),
        Text("pick your topic!", style: style.textWhiteName),
      ]
    );
  }
}
