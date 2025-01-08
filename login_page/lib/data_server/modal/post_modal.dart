import 'package:login_page/data_server/modal/user_profile.dart';

class Post {
  final int id;
  final String title;
  final String body;
  final List<String> tags;
  final Reactions reactions;
  final int views;
  final int userId;
  UserProfile? owner;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.reactions,
    required this.views,
    this.owner,
    required this.userId,
  });

  // Factory constructor for creating a Post object from JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      tags: List<String>.from(json['tags']),
      reactions: Reactions.fromJson(json['reactions']),
      views: json['views'],
      userId: json['userId'],
    );
  }

//   // Convert Post object to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'body': body,
//       'tags': tags,
//       'reactions': reactions.toJson(),
//       'views': views,
//       'userId': userId,
//     };
//   }
}

class Reactions {
  final int likes;
  final int dislikes;

  Reactions({
    required this.likes,
    required this.dislikes,
  });

  // Factory constructor for creating a Reactions object from JSON
  factory Reactions.fromJson(Map<String, dynamic> json) {
    return Reactions(
      likes: json['likes'],
      dislikes: json['dislikes'],
    );
  }

  // Convert Reactions object to JSON
  // Map<String, dynamic> toJson() {
  //   return {
  //     'likes': likes,
  //     'dislikes': dislikes,
  //   };
  // }
}
