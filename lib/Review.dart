import 'dart:convert';

class AuthorDetails {
  final String? name;
  final String? username;
  final String? avatarPath;
  final double? rating;

  AuthorDetails({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  factory AuthorDetails.fromJson (Map<String, dynamic> map){
    return AuthorDetails(
      name: map['name'],
      username: map['username'],
      avatarPath: map['avatarPath'],
      rating: map['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'avatar_path': avatarPath,
      'rating': rating,
    };
  }

}

class Review {
  final String author;
  final AuthorDetails authorDetails;
  final String content;
  final String createdAt;
  final String id;
  final String updatedAt;
  final String url;

  Review({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory Review.fromJson (Map<String, dynamic> map){
    return Review(
      id: map['id'],
      author: map['author'],
      authorDetails:AuthorDetails.fromJson(map[]) ,
      url: map['url'],
      content: map['content'],
      createdAt: map['createAt'],
      updatedAt: map['updatedAt'],

    );
  }
}
