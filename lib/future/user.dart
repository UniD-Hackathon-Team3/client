import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
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

  final response=await http.post(Uri.http(''), headers: headers, body:<String, String>{'user_id': userId, 'topic_id':topicId});
  if(response.statusCode == 200) return User.fromJson(jsonDecode(response.body));
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
  final String title;
  final String userId;

  Topic({required this.title, required this.userId});
  factory Topic.fromJson(Map<String, dynamic> json){
    return Topic(title: json[], userId: json[]);
  }

}
class Post{
  final String userId;
  final String topic;
  final String postId;

  Post({required this.userId, required this.topic, required this.postId});
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(userId: json[], topic: json[], postId: json[]);
  }
}