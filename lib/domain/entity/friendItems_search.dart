import 'package:json_annotation/json_annotation.dart';
import 'package:vk_exmaple/domain/entity/friend.dart';


part'friendItems_search.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class FriendsItemsSearch {

  final String description;
  final String type;
  @JsonKey(
      name:"profile"
  )
  final Friend friends;

  FriendsItemsSearch({
    required this.description,
    required this.type,
    required this.friends,
  });

  factory FriendsItemsSearch.fromJson(Map<String, dynamic> json) => _$FriendsItemsSearchFromJson(json);
  Map<String, dynamic> toJson() => _$FriendsItemsSearchToJson(this);
}