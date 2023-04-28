part of 'friend_list_bloc.dart';

abstract class FriendListEvent{}

class FriendListEventLoad extends FriendListEvent{}
class FriendListEventSearch extends FriendListEvent{
 final String? query;
  FriendListEventSearch(this.query);
}

