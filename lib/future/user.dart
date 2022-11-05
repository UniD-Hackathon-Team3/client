import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic>signupUser(String userId, String userPw) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.http('http://13.125.205.227:3000','/user/signup'), headers: headers, body:<String, String>{'user_id': userId, 'user_pw': userPw});
  if(response.statusCode == 200) return User(userId: userId, userPw: userPw);
  else {
    throw Exception('Failed to signup User');
  }
}
Future<dynamic>loginUser(String userId, String userPw) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.http('http://13.125.205.227:3000','/user/login'), headers: headers, body:<String, String>{'user_id': userId, 'user_pw': userPw});
  if(response.statusCode == 200) return User(userId: userId, userPw: userPw);
  else {
    throw Exception('Failed to login User');
  }
}

Future<dynamic>getuserInfo(String userId) async{
  Map<String, String> headers={
    'Content-Type':'application/json'
  };

  final response=await http.post(Uri.http('http://13.125.205.227:3000','/user/userinfo'), headers: headers, body:<String, String>{'user_id': userId});
  if(response.statusCode == 200) {
    Map<String, dynamic> json=jsonDecode(response.body);
    return User(userId: userId, posts: json['posts'], followers: json['followers']);
  }
  else {
    throw Exception('Failed to load UserInfo');
  }
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


