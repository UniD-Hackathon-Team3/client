import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<dynamic>addComment(String userId, String content, int postId) async{

  final response=await http.post(Uri.parse('http://13.125.205.227:3000/feed/comment'), body:<String, dynamic>{'user_id': userId, 'post_id':postId, 'content': content});
  if(response.statusCode == 200) {
    Map<String, dynamic> json=jsonDecode(response.body);
    return json['comment_id'];
  }
  else throw Exception('Failed to load User');
}

class Comment{
  final String content;
  final String userId;
  final int commentId;
  final int postId;
  Comment({required this.content, required this.userId, required this.postId, required this.commentId});

}