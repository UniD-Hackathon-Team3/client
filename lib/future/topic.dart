import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



Future<List<dynamic>> getRandomTopic() async{
  final response=await http.post(Uri.parse('http://13.125.205.227:3000/topic/randomTopic'),  body:{});
  if(response.statusCode == 200) {
    List<dynamic> list=jsonDecode(response.body)['randomtopics'];
    print(list);
    return list;
  }
  else throw Exception('Failed to load User');
}

