// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Friend _$FriendFromJson(Map<String, dynamic> json) => Friend(
      id: json['id'] as int,
      track_code: json['track_code'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      can_access_closed: json['can_access_closed'] as bool,
      is_closed: json['is_closed'] as bool,
      bdate: json['bdate'] as String?,
      can_post: json['can_post'] as int?,
      can_see_all_posts: json['can_see_all_posts'] as int?,
      can_write_private_message: json['can_write_private_message'] as int?,
      city: json['city'] as Map<String, dynamic>?,
      mobilePhone: json['mobilePhone'] as String?,
      home_phone: json['home_phone'] as String?,
      country: json['country'] as Map<String, dynamic>?,
      domain: json['domain'] as String?,
      university: json['university'] as int?,
      university_name: json['university_name'] as String?,
      faculty: json['faculty'] as int?,
      faculty_name: json['faculty_name'] as String?,
      graduation: json['graduation'] as int?,
      has_mobile: json['has_mobile'] as int?,
      last_seen: json['last_seen'] as Map<String, dynamic>?,
      nickname: json['nickname'] as String?,
      online: json['online'] as int?,
      photo_100: json['photo_100'] as String?,
      photo_200_orig: json['photo_200_orig'] as String?,
      photo_50: json['photo_50'] as String?,
      relation: json['relation'] as int?,
      sex: json['sex'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$FriendToJson(Friend instance) => <String, dynamic>{
      'id': instance.id,
      'track_code': instance.track_code,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'can_access_closed': instance.can_access_closed,
      'is_closed': instance.is_closed,
      'bdate': instance.bdate,
      'can_post': instance.can_post,
      'can_see_all_posts': instance.can_see_all_posts,
      'can_write_private_message': instance.can_write_private_message,
      'city': instance.city,
      'mobilePhone': instance.mobilePhone,
      'home_phone': instance.home_phone,
      'country': instance.country,
      'domain': instance.domain,
      'university': instance.university,
      'university_name': instance.university_name,
      'faculty': instance.faculty,
      'faculty_name': instance.faculty_name,
      'graduation': instance.graduation,
      'has_mobile': instance.has_mobile,
      'last_seen': instance.last_seen,
      'nickname': instance.nickname,
      'online': instance.online,
      'photo_100': instance.photo_100,
      'photo_200_orig': instance.photo_200_orig,
      'photo_50': instance.photo_50,
      'relation': instance.relation,
      'sex': instance.sex,
      'status': instance.status,
    };
