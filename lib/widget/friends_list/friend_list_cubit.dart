import 'package:flutter_bloc/flutter_bloc.dart';

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

class FriendsListCubitState{
  final List<FriendListRowData> friends;


  FriendsListCubitState({ required this.friends});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendsListCubitState &&
          runtimeType == other.runtimeType &&
          friends == other.friends;

  @override
  int get hashCode => friends.hashCode;
}

class FriendListCubit extends Cubit<FriendsListCubitState> {
  FriendListCubit({required FriendsListCubitState initialState}) : super(initialState);
}