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

Future<List>getRandomFeed(int topicId) async{
  final response=await http.post(Uri.parse('http://13.125.205.227:3000/feed/hot'),  body:<String, dynamic>{'topic_id':topicId});
  if(response.statusCode == 200) {
    List list=jsonDecode(response.body);
    return list;
  }
  else throw Exception('Failed to load User');
}

Future<bool>postLike(String userId, String postId, bool isLike) async{
  final response=await http.post(Uri.parse('http://13.125.205.227:3000/feed/like'),  body:<String, dynamic>{'user_id': userId, 'post_id': postId, 'is_like': isLike});
  if(response.statusCode == 200) {
    bool result=jsonDecode(response.body);
    return result;
  }
  else throw Exception('Failed to load User');
}


