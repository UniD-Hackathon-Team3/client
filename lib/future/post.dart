import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic>addPost(String userId, String content, int topicId) async{
  final response=await http.post(Uri.http('http://13.125.205.227:3000/feed/post'));
  if(response.statusCode == 200) {
    Map<String, dynamic> json=jsonDecode(response.body);
    return json['post_id'];
  }
  else throw Exception('Failed to load User');
}

Future<Map<String, dynamic>> getNowTopic() async{
  final response=await http.get(Uri.parse('http://13.125.205.227:3000/feed/now'));
  if(response.statusCode == 200) {
    return jsonDecode(response.body)['now_topic'];
  }
  else throw Exception('Failed to load User');
}

Future<List> getRandomFeed() async{
  final response=await http.post(Uri.parse('http://13.125.205.227:3000/feed/hot'),  body:{});
  if(response.statusCode == 200) {
    List<dynamic> list=jsonDecode(response.body);
    print(list);
    return list;
  }
  else throw Exception('Failed to load User');
}
