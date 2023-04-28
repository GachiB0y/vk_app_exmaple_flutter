// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:vk_exmaple/domain/api_client/friend_api_client.dart';
// import 'package:vk_exmaple/domain/data-provider/session_data_provider.dart';
// import 'package:vk_exmaple/domain/entity/friend.dart';
// import 'package:vk_exmaple/domain/repository/friends_repository.dart';
// import 'package:vk_exmaple/ui/naviagtion/main_navigation.dart';
//
//
// class FriendListRowData{
//   final int id;
//   final int? online;
//   final String first_name;
//   final String last_name;
//   final String? city;
//   final String? bdate;
//   final String? photoPath;
//
//   FriendListRowData(
//       {required this.id,
//       required this.online,
//       required this.first_name,
//       required this.last_name,
//       required this.city,
//       required this.bdate,
//       required this.photoPath
//       });
// }
//
// class FriendsListViewModel extends ChangeNotifier{
//   final _friendsRepository = FriendsRepository();
//   Timer? searchDebounce;
//
//   final _friends =<FriendListRowData>[];
//   final sessionDataProvdier = SessionDataProvdier();
//   List<FriendListRowData> get friends => List.unmodifiable(_friends);
//   bool _isLoadingInProgres = false;
//   String? searchQuery;
//
//
//   String userAge(String? bdate) {
//     if (bdate?.isNotEmpty == true) {
//       final part = bdate?.split('.');
//       if (part?.length == 3) {
//         final year = int.parse(part![2]);
//         final dt = DateTime.now();
//         var age = (dt.year.toInt() - year).toString() + ' лет';
//         return age;
//       }
//       return '';
//     }
//     return '';
//   }
//
//   Future<void> loadFriendsList() async{
//     if(_isLoadingInProgres) return;
//     _isLoadingInProgres = true;
//     try{
//       final access_token = await sessionDataProvdier.getSessionId();
//
//       final query = searchQuery;
//       if(query == null)
//       {
//         final friendsResponse =  await _friendsRepository.friends('161131685', 'photo_100,city,photo_200_orig,bdate,online', access_token as String );
//         _friends.addAll(friendsResponse.friends.map(_makeRowData).toList());
//       }else{
//        final friendsResponse =await _friendsRepository.searchFriends(query, 'photo_100,city,photo_200_orig,bdate,online', access_token as String);
//        _friends.addAll(friendsResponse.friendsItems.map((e) => e.friends).map(_makeRowData).toList());
//       }
//
//       _isLoadingInProgres = false;
//       notifyListeners();
//     }catch(e){
//       _isLoadingInProgres = false;
//     }
//   }
//   FriendListRowData _makeRowData(Friend friend){
//     final city = friend.city?['title'].toString();
//     return FriendListRowData(
//         id:friend.id,
//         online:friend.online,
//         first_name:friend.first_name,
//         last_name: friend.last_name,
//         bdate: friend.bdate,
//         city: city,
//         photoPath:friend.photo_200_orig,
//     );
//   }
//
//   void onFriendsTap(BuildContext context, int index) {
//     final id = _friends[index].id;
//     Navigator.of(context).pushNamed(MainNavigationRouteNames.profileDetails, arguments:  id,);
//   }
//
//   Future<void> searchFriends(String text) async{
//     searchDebounce?.cancel();
//     searchDebounce = Timer(const Duration(milliseconds: 300), () async{
//       searchQuery =text.isNotEmpty ? text : null;
//       print(searchQuery);
//       _friends.clear();
//       await loadFriendsList();
//     });
//   }
//
// }