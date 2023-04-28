import 'package:json_annotation/json_annotation.dart';

part 'friend.g.dart';

@JsonSerializable()
class Friend{
  final int id;
  final String track_code;
  final String first_name;
  final String last_name;
  final bool can_access_closed;
  final bool is_closed;
  // @JsonKey(fromJson: _parseDayFromString)
  final String? bdate;
  final int? can_post;
  final int? can_see_all_posts;
  final int? can_write_private_message;
  final Map<String, dynamic>? city;

  final String? mobilePhone;
  final String? home_phone;

  final Map<String, dynamic>? country;
  final String? domain;

  final int? university;
  final String? university_name;
  final int? faculty;
  final String? faculty_name;
  final int? graduation;

  final int? has_mobile;
  final Map<String, dynamic>? last_seen;
  final String? nickname;
  final int? online;
  final String? photo_100;
  final String? photo_200_orig;
  final String? photo_50;
  final int? relation;
  final int? sex;
  final String? status;

  Friend(
  { required this.id,
    required this.track_code,
    required this.first_name,
    required this.last_name,
    required this.can_access_closed,
    required this.is_closed,
    this.bdate,
    this.can_post,
    this.can_see_all_posts,
    this.can_write_private_message,
    this.city,
    this.mobilePhone,
    this.home_phone,
    this.country,
    this.domain, this.university,
    this.university_name,
    this.faculty,
    this.faculty_name,
    this.graduation,
    this.has_mobile,
    this.last_seen,
    this.nickname,
    this.online,
    this.photo_100,
    this.photo_200_orig,
    this.photo_50,
    this.relation,
    this.sex,
    this.status,
});

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);

  Map<String, dynamic> toJson() => _$FriendToJson(this);

  static DateTime? _parseDayFromString(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return null;
    return DateTime.tryParse(rawDate);
  }


}