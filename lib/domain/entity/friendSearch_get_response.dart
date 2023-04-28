import 'package:json_annotation/json_annotation.dart';
import 'package:vk_exmaple/domain/entity/friend.dart';
import 'package:vk_exmaple/domain/entity/friendItems_search.dart';


part'friendSearch_get_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FriendsSearchGetResponse {

  final int count;
  @JsonKey(
      name:"items"
  )
  final List<FriendsItemsSearch> friendsItems;

  FriendsSearchGetResponse({
    required this.count,
    required this.friendsItems,
  });

  factory FriendsSearchGetResponse.fromJson(Map<String, dynamic> json) => _$FriendsSearchGetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FriendsSearchGetResponseToJson(this);
}