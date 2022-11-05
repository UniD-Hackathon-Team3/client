import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

Future<dynamic>upload(String userId, String content, int topicId) async{
  Map<String, String> headers={
    'Content-Type':'multipart/form-data'
  };

  final response=await http.post(Uri.http('http://13.125.205.227:3000/feed/upload'));
  if(response.statusCode == 200) {
    Map<String, dynamic> json=jsonDecode(response.body);
    return Img(url: json['img']);
  }
  else throw Exception('Failed to load User');
}

class Img{
  final String url;
  Img({required this.url});
}