import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_exmaple/domain/api_client/friend_api_client.dart';
import 'package:vk_exmaple/domain/data-provider/session_data_provider.dart';
import 'package:vk_exmaple/domain/entity/friend.dart';
import 'package:vk_exmaple/domain/repository/friends_repository.dart';

part 'firnd_list_event.dart';
part 'friend_list_state.dart';

class FriendsListViewBloc extends Bloc<FriendListEvent, FriendListLoaded> {
  final _friendApiClient = FriendApiClient();
  final FriendsRepository friendsRepository;
  final SessionDataProvdier sessionDataProvdier;

  Timer? searchDebounce;


  FriendsListViewBloc(this.friendsRepository, this.sessionDataProvdier) : super(FriendListLoaded.initial()) {
    on<FriendListEvent>((event, emit) async{
      if ( event is FriendListEventLoad){
        await onFriendListEventLoad(event,emit);
      }else if (event is FriendListEventSearch){
        await onFriendListEventSearch(event,emit);
      }
    },);
  }

  Future<void> onFriendListEventLoad(
      FriendListEventLoad event,
      Emitter<FriendListLoaded> emit
      ) async{
    final access_token = await sessionDataProvdier.getSessionId();
    if(state.isSearchMode){
      final query = state.searchQuery;
      final result =  await friendsRepository.searchFriends(query, 'photo_100,city,photo_200_orig,bdate,online', access_token as String);
      final friends =List<FriendListRowData>.from(state.friendContainer.friends)..addAll(result.friendsItems.map((e) => e.friends).map(_makeRowData).toList());
      final container = state.friendContainer.copyWith(friends: friends);
      final newState = state.copyWith(friendContainer:container);
      emit(newState);

    }else{
      final result = await friendsRepository.friends('161131685', 'photo_100,city,photo_200_orig,bdate,online', access_token as String );
      final friends =List<FriendListRowData>.from(state.friendContainer.friends)..addAll(result.friends.map(_makeRowData).toList());
      final container = state.friendContainer.copyWith(friends: friends);
      final newState = state.copyWith(friendContainer:container);
      emit(newState);
    }
  }

  Future<void> onFriendListEventSearch(
      FriendListEventSearch event,
      Emitter<FriendListLoaded> emit
      ) async{
    if (state.searchQuery == event.query) return;
    final newState =  state.copyWith(searchQuery: event.query,friendContainer: FriendListContainer.initial());
    emit(newState);
    add( FriendListEventLoad());
  }

  FriendListRowData _makeRowData(Friend friend){
    final city = friend.city?['title'].toString();
    return FriendListRowData(
      id:friend.id,
      online:friend.online,
      first_name:friend.first_name,
      last_name: friend.last_name,
      bdate: friend.bdate,
      city: city,
      photoPath:friend.photo_200_orig,
    );
  }

  String userAge(String? bdate) {
    if (bdate?.isNotEmpty == true) {
      final part = bdate?.split('.');
      if (part?.length == 3) {
        final year = int.parse(part![2]);
        final dt = DateTime.now();
        var age = (dt.year.toInt() - year).toString() + ' лет';
        return age;
      }
      return '';
    }
    return '';
  }
}
