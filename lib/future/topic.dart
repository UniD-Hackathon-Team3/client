
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

class Topic{
  final int? topicId;
  final String title;
  final String userId;

  Topic({this.topicId, required this.title, required this.userId});
  factory Topic.fromJson(Map<String, dynamic> json){
    return Topic(title: json[], userId: json[]);
  }

}