// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendSearch_get_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsSearchGetResponse _$FriendsSearchGetResponseFromJson(
        Map<String, dynamic> json) =>
    FriendsSearchGetResponse(
      count: json['count'] as int,
      friendsItems: (json['items'] as List<dynamic>)
          .map((e) => FriendsItemsSearch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FriendsSearchGetResponseToJson(
        FriendsSearchGetResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.friendsItems.map((e) => e.toJson()).toList(),
    };
