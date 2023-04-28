import 'package:json_annotation/json_annotation.dart';

part 'user_wall.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserWall {
  Response? response;
  UserWall({
      this.response,});

  factory UserWall.fromJson(Map<String, dynamic> json) => _$UserWallFromJson(json);

  Map<String, dynamic> toJson() => _$UserWallToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Response {
  int? count;
  List<Items>? items;
  String? nextFrom;

  Response({
      this.count, 
      this.items, 
      this.nextFrom,});

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Items {
  Donut? donut;
  Comments? comments;
  double? shortTextRate;
  String? hash;
  String? type;
  List<CopyHistory>? copyHistory;
  List<Attachments>? attachments;
  int? date;
  int? fromId;
  int? id;
  bool? isFavorite;
  Likes? likes;
  int? ownerId;
  PostSource? postSource;
  String? postType;
  Reposts? reposts;
  String? text;
  Views? views;

  Items({
      this.donut, 
      this.comments, 
      this.shortTextRate, 
      this.hash, 
      this.type, 
      this.attachments, 
      this.date, 
      this.fromId, 
      this.id, 
      this.isFavorite, 
      this.likes, 
      this.ownerId, 
      this.postSource, 
      this.postType, 
      this.reposts, 
      this.text, 
      this.views,});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Views {
  int? count;

  Views({
      this.count,});

  factory Views.fromJson(Map<String, dynamic> json) => _$ViewsFromJson(json);

  Map<String, dynamic> toJson() => _$ViewsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Reposts {
  int? count;
  int? userReposted;

  Reposts({
      this.count, 
      this.userReposted,});

  factory Reposts.fromJson(Map<String, dynamic> json) => _$RepostsFromJson(json);

  Map<String, dynamic> toJson() => _$RepostsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PostSource {
  String? type;

  PostSource({
      this.type,});

  factory PostSource.fromJson(Map<String, dynamic> json) => _$PostSourceFromJson(json);

  Map<String, dynamic> toJson() => _$PostSourceToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Likes {
  int? canLike;
  int? count;
  int? userLikes;
  int? canPublish;
  bool? repostDisabled;

  Likes({
      this.canLike, 
      this.count, 
      this.userLikes, 
      this.canPublish, 
      this.repostDisabled,});

  factory Likes.fromJson(Map<String, dynamic> json) => _$LikesFromJson(json);

  Map<String, dynamic> toJson() => _$LikesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Attachments {
  String? type;
  Video? video;

  Attachments({
      this.type, 
      this.video,});

  factory Attachments.fromJson(Map<String, dynamic> json) => _$AttachmentsFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CopyHistory {
  String? type;
  List<Attachments>? attachments;
  int? date;
  int? fromId;
  int? id;
  int? ownerId;
  PostSource? postSource;
  String? postType;
  String? text;

  CopyHistory({
    this.type,
    this.attachments,
    this.date,
    this.fromId,
    this.id,
    this.ownerId,
    this.postSource,
    this.postType,
    this.text,});

  factory CopyHistory.fromJson(Map<String, dynamic> json) => _$CopyHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$CopyHistoryToJson(this);

}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Video {
  String? accessKey;
  int? canComment;
  int? canLike;
  int? canRepost;
  int? canSubscribe;
  int? canAddToFaves;
  int? canAdd;
  int? comments;
  int? date;
  String? description;
  int? duration;
  List<Image>? image;
  int? id;
  int? ownerId;
  String? title;
  bool? isFavorite;
  String? trackCode;
  String? type;
  int? views;
  int? localViews;
  String? platform;
  int? canDislike;

  Video({
      this.accessKey, 
      this.canComment, 
      this.canLike, 
      this.canRepost, 
      this.canSubscribe, 
      this.canAddToFaves, 
      this.canAdd, 
      this.comments, 
      this.date, 
      this.description, 
      this.duration, 
      this.image, 
      this.id, 
      this.ownerId, 
      this.title, 
      this.isFavorite, 
      this.trackCode, 
      this.type, 
      this.views, 
      this.localViews, 
      this.platform, 
      this.canDislike,});

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Image {
  String? url;
  int? width;
  int? height;
  int? withPadding;

  Image({
      this.url, 
      this.width, 
      this.height, 
      this.withPadding,});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Comments {
  int? canPost;
  int? count;
  bool? groupsCanPost;

  Comments({
      this.canPost, 
      this.count, 
      this.groupsCanPost,});

  factory Comments.fromJson(Map<String, dynamic> json) => _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Donut {
  bool? isDonut;

  Donut({
      this.isDonut,});

  factory Donut.fromJson(Map<String, dynamic> json) => _$DonutFromJson(json);

  Map<String, dynamic> toJson() => _$DonutToJson(this);
}