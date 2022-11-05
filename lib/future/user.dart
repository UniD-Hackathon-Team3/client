import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic>signupUser(String userId, String userPw) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.http(''), headers: headers, body:<String, String>{'user_id': userId, 'user_pw': userPw});
  if(response.statusCode == 200) return User(userId: userId, userPw: userPw);
  else {
    throw Exception('Failed to signup User');
  }
}
Future<dynamic>loginUser(String userId, String userPw) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.http(''), headers: headers, body:<String, String>{'user_id': userId, 'user_pw': userPw});
  if(response.statusCode == 200) return User(userId: userId, userPw: userPw);
  else {
    throw Exception('Failed to login User');
  }
}

Future<dynamic>getuserInfo(String userId) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.http(''), headers: headers, body:<String, String>{'user_id': userId});
  if(response.statusCode == 200) {
    Map<String, dynamic> json=jsonDecode(response.body);
    return User(userId: userId, posts: json['posts'], followers: json['followers']);
  }
  else {
    throw Exception('Failed to load UserInfo');
  }
}

Future<dynamic>voteTopic(String userId, String topicId) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.http(''), headers: headers, body:<String, String>{'user_id': userId, 'untopic_id':topicId});
  if(response.statusCode == 200) return User.fromJson(jsonDecode(response.body));
  else throw Exception('Failed to load User');
}

Future<dynamic>randomTopic() async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.http(''));
  if(response.statusCode == 200) return Topic;
  else throw Exception('Failed to load User');
}

Future<dynamic>addPost(String userId, String content, int topicId) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.http('http://13.125.205.227:3000/feed/post'));
  if(response.statusCode == 200) {
    Map<String, dynamic> json=jsonDecode(response.body);
    return Post(userId: userId, content: content, topicId: topicId, postId: json['post_id']);
  }
  else throw Exception('Failed to load User');
}

// Future<dynamic>upload(String userId, String content, int topicId) async{
//   Map<String, String> headers={
//     'Content-Type':'multipart/form-data'
//   };
//
//   final response=await http.post(Uri.http('http://13.125.205.227:3000/feed/upload'));
//   if(response.statusCode == 200) {
//     Map<String, dynamic> json=jsonDecode(response.body);
//     return Img(url: json['img']);
//   }
//   else throw Exception('Failed to load User');
// }

Future<dynamic>addComment(String userId, String content, int postId) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.http('http://13.125.205.227:3000/feed/comment'), headers: headers, body:<String, dynamic>{'user_id': userId, 'post_id':postId, 'content': content});
  if(response.statusCode == 200) {
    Map<String, dynamic> json=jsonDecode(response.body);
    return Comment(userId: userId, content: content, postId: postId, commentId: json['commentId']);
  }
  else throw Exception('Failed to load User');
}

Future<dynamic>getSearchWord(String word) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.http('http://13.125.205.227:3000/search'), headers: headers, body:<String, dynamic>{'word': word});
  if(response.statusCode == 200) {
    Map<String, dynamic> json=jsonDecode(response.body);
    return Topic(userId: json['topic_id'], title: json['title']);
  }
  else throw Exception('Failed to load User');
}



class User{
  final String userId;
  final String? userPw;
  List? posts;
  int? followers;

  User({required this.userId, this.userPw, this.posts, this.followers});
  factory User.fromJson(Map<String, dynamic> json){
    return User(userId: json['result'], userPw: json['result']);
  }

}
class Topic{
  final int? topicId;
  final String title;
  final String userId;

  Topic({this.topicId, required this.title, required this.userId});
  factory Topic.fromJson(Map<String, dynamic> json){
    return Topic(title: json[], userId: json[]);
  }

}
class Post{
  final String userId;
  final String content;
  final int postId;
  final int topicId;
  final String? img;

  Post({required this.userId, required this.content, required this.postId, required this.topicId});
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(userId: json[], content: json[], postId: json[], topicId: json[]);
  }
}
class Img{
  final String url;
  Img({required this.url});
  factory Img.fromJson(<Map<String, dynamic> json){
    return Img(url: json[]);
  }
}

class Comment{
  final String content;
  final String userId;
  final int commentId;
  final int postId;
  Comment({required this.content, required this.userId, required this.postId, required this.commentId});
  factory Comment.fromJson(<Map<String, dynamic> json){
    return Comment(content: json[], userId: json[], postId: json[], commentId: json[]);
  }
}