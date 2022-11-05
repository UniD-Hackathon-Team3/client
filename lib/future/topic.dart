import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic>getSearchWord(String word) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.parse('http://13.125.205.227:3000/feed/search'),  body:<String, dynamic>{'word': word});
  if(response.statusCode == 200) {
    Map<String, dynamic> json=jsonDecode(response.body);
    return Topic(userId: json['topic_id'], title: json['title']);
  }
  else throw Exception('Failed to load User');
}

Future<dynamic>addTopic(String userId, String title) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.parse('http://13.125.205.227:3000/topic/addTopic'), body:<String, String>{'title': title, 'user_id':userId});
  if(response.statusCode == 200) return response.body;
  else throw Exception('Failed to load User');
}

Future<dynamic>voteTopic(String userId, String topicId) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.parse('http://13.125.205.227:3000/topic/voteTopic'), body:<String, String>{'user_id': userId, 'untopic_id':topicId});
  if(response.statusCode == 200) return response.body;
  else throw Exception('Failed to load User');
}

Future<dynamic>getHotTopic(String userId, String postId, bool is_like) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.parse('http://13.125.205.227:3000/topic/voteTopic'),  body:<String, String>{'user_id': userId, 'untopic_id':topicId});
  if(response.statusCode == 200) return response.body;
  else throw Exception('Failed to load User');
}


Future<dynamic>randomTopic() async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.parse('http://13.125.205.227:3000/topic/randomTopic'));
  if(response.statusCode == 200) return Topic;
  else throw Exception('Failed to load User');
}

class Topic{
  final int? topicId;
  final String title;
  final String userId;

  Topic({this.topicId, required this.title, required this.userId});

}