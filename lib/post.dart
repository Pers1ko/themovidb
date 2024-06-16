import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Post {
 final int userID;
 final int id;
 final String titles;
 final String body;

  Post({required this.userID, 
      required this.id, 
      required this.titles, 
      required this.body});
}