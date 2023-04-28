// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendItems_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsItemsSearch _$FriendsItemsSearchFromJson(Map<String, dynamic> json) =>
    FriendsItemsSearch(
      description: json['description'] as String,
      type: json['type'] as String,
      friends: Friend.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FriendsItemsSearchToJson(FriendsItemsSearch instance) =>
    <String, dynamic>{
      'description': instance.description,
      'type': instance.type,
      'profile': instance.friends.toJson(),
    };
