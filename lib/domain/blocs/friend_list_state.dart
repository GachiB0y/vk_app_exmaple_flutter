part of 'friend_list_bloc.dart';
//
// abstract class FriendListState{}
//
// class FriendListInitial extends FriendListState{}
//
// class FriendListLoading extends FriendListState{}

class FriendListLoaded {
  final FriendListContainer friendContainer;
  final String searchQuery;
  bool get isSearchMode => searchQuery.isNotEmpty;

  FriendListLoaded.initial() : friendContainer =  FriendListContainer.initial(),searchQuery ="";

  FriendListLoaded({required this.friendContainer,required this.searchQuery});

  FriendListLoaded copyWith({
    FriendListContainer? friendContainer,
    String? searchQuery
}){
    return FriendListLoaded(
        friendContainer:  friendContainer ?? this.friendContainer,
        searchQuery: searchQuery?? this.searchQuery
    );
}

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendListLoaded &&
          runtimeType == other.runtimeType &&
          friendContainer == other.friendContainer &&
          searchQuery == other.searchQuery;

  @override
  int get hashCode => friendContainer.hashCode ^ searchQuery.hashCode;
}

class FriendListContainer{
   List<FriendListRowData> friends;

  FriendListContainer.initial() : friends = const <FriendListRowData>[];

  FriendListContainer({required this.friends});

  FriendListContainer copyWith({
    List<FriendListRowData>? friends,
}){
    return FriendListContainer(
      friends: friends ?? this.friends,
    );
}

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendListContainer &&
          runtimeType == other.runtimeType &&
          friends == other.friends;

  @override
  int get hashCode => friends.hashCode;
}



class FriendListRowData{
  final int id;
  final int? online;
  final String first_name;
  final String last_name;
  final String? city;
  final String? bdate;
  final String? photoPath;

  FriendListRowData(
      {required this.id,
        required this.online,
        required this.first_name,
        required this.last_name,
        required this.city,
        required this.bdate,
        required this.photoPath
      });
}