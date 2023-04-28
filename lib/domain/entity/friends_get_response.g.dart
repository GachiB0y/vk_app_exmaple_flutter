// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_get_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsGetResponse _$FriendsGetResponseFromJson(Map<String, dynamic> json) =>
    FriendsGetResponse(
      count: json['count'] as int,
      friends: (json['items'] as List<dynamic>)
          .map((e) => Friend.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FriendsGetResponseToJson(FriendsGetResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.friends.map((e) => e.toJson()).toList(),
    };
