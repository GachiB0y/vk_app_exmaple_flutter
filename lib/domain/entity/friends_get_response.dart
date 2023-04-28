import 'package:json_annotation/json_annotation.dart';
import 'package:vk_exmaple/domain/entity/friend.dart';


part'friends_get_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FriendsGetResponse {

  final int count;
  @JsonKey(
    name:"items"
  )
  final List<Friend> friends;

  FriendsGetResponse({
    required this.count,
    required this.friends,
});

  factory FriendsGetResponse.fromJson(Map<String, dynamic> json) => _$FriendsGetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FriendsGetResponseToJson(this);
}