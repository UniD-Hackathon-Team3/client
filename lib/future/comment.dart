

// Future<dynamic>addComment(String userId, String content, int postId) async{
//   Map<String, String> headers={
//     'Content-Type':'application/json'
//   };

//   final response=await http.post(Uri.http('http://13.125.205.227:3000/feed/comment'), headers: headers, body:<String, dynamic>{'user_id': userId, 'post_id':postId, 'content': content});
//   if(response.statusCode == 200) {
//     Map<String, dynamic> json=jsonDecode(response.body);
//     return Comment(userId: userId, content: content, postId: postId, commentId: json['commentId']);
//   }
//   else throw Exception('Failed to load User');
// }

// class Comment{
//   final String content;
//   final String userId;
//   final int commentId;
//   final int postId;
//   Comment({required this.content, required this.userId, required this.postId, required this.commentId});
//   factory Comment.fromJson(<Map<String, dynamic> json){
//   return Comment(content: json[], userId: json[], postId: json[], commentId: json[]);
//   }
// }