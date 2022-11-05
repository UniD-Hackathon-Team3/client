import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<User>fetchUser() async{
  final response=await http.get(Uri.http(''));
  if(response.statusCode == 200) return User.fromJson(jsonDecode(response.body));
  else throw Exception('Failed to load User');
}
Future<Topic>fetchTopic() async{
  final response=await http.get(Uri.http(''));
  if(response.statusCode == 200) return Topic.fromJson(jsonDecode(response.body));
  else throw Exception('Failed to load Topic');
}
Future<Post>fetchPost() async{
  final response=await http.get(Uri.http(''));
  if(response.statusCode == 200) return Post.fromJson(jsonDecode(response.body));
  else throw Exception('Failed to load Post');
}

class User{
  final String userId;
  final String userPw;

  User({required this.userId, required this.userPw});
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