import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

Future<dynamic>upload(dynamic input) async{
  var dio = new Dio();
  try{
    dio.options.contentType='multipart/form-data';
    dio.options.maxRedirects.isFinite;

    var response=await dio.patch('http://13.125.205.227:3000/feed/upload', data: input);

    return response.data;
  }
  catch(e){
    print(e);
  }
}

class Img{
  final String url;
  Img({required this.url});
}