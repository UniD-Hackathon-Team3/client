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

Future<dynamic>addTopic(String userId, String title) async{
  final response=await http.post(Uri.parse('http://13.125.205.227:3000/topic/addTopic'), body:<String, String>{'title': title, 'user_id':userId});
  if(response.statusCode == 200) return response.body;
  else throw Exception('Failed to load User');
}

Future<bool>voteTopic(String userId, String topicId) async{
  final response=await http.post(Uri.parse('http://13.125.205.227:3000/topic/voteTopic'),  body:<String, String>{'user_id': userId, 'untopic_id':topicId});
  if(response.statusCode == 200) {
    if (jsonDecode(response.body)['result']=="투표 성공") return true;
    else return false;
  }
  else throw Exception('Failed to load User');
}

Future<Map>getNowTopic() async{
  final response=await http.get(Uri.parse('http://13.125.205.227:3000/topic/feed/post'));
  if(response.statusCode == 200) return jsonDecode(response.body);
  else throw Exception('Failed to load User');
}


Future<Map>randomTopic() async{
  final response=await http.post(Uri.parse('http://13.125.205.227:3000/topic/randomTopic'));
  if(response.statusCode == 200) return jsonDecode(response.body);
  else throw Exception('Failed to load User');
}


class Topic{
  final int? topicId;
  final String title;
  final String userId;

  Topic({this.topicId, required this.title, required this.userId});


}
