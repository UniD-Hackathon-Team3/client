import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic>addPost(String userId, String content, int topicId) async{
  final response=await http.post(Uri.http('http://13.125.205.227:3000/feed/post'));
  if(response.statusCode == 200) {
    Map<String, dynamic> json=jsonDecode(response.body);
    return json;
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

// Future<bool>postLike(String userId, String postId, bool isLike) async{
//   final response=await http.post(Uri.parse('http://13.125.205.227:3000/feed/like'),  body:<String, String>{'user_id': userId, 'post_id': postId, 'is_like': isLike});
//   if(response.statusCode == 200) {
//     bool result=jsonDecode(response.body);
//     return result;
//   }
//   else throw Exception('Failed to load User');
// }

// class Post{
//   final String userId;
//   final String content;
//   final int postId;
//   final int topicId;
//   final String? img;

//   Post({required this.userId, required this.content, required this.postId, required this.topicId, required this.img});
//   factory Post.fromJson(Map<String, dynamic> json){
//     return Post(userId: json[], content: json[], postId: json[], topicId: json[]);
//   }
// }