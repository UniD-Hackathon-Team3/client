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
