import 'package:flutter/material.dart';
import 'package:vk_exmaple/domain/api_client/api_client_exception.dart';
import 'package:vk_exmaple/domain/entity/friend.dart';
import 'package:vk_exmaple/domain/entity/friends_get_response.dart';
import 'package:vk_exmaple/domain/entity/user_details.dart';
import 'package:vk_exmaple/domain/entity/user_wall.dart';

class UserInfoDetailsData{
 final String? avatarPath;
 final String? avatarPath200;
 final int online;
 final String cityTitle;
 UserInfoDetailsData({this.avatarPath,required this.cityTitle, required this.online,this.avatarPath200});
}

class UserDetailsWallData {
  UserWall? userWall;


  UserDetailsWallData(
      {this.userWall});
}

class UserDetailsData{
String firstName = '';
String lastName = '';
bool isLoading = true;
UserInfoDetailsData userInfoData = UserInfoDetailsData(online: 0,cityTitle:'Не указан');
}

abstract class UserDetailsModelLogoutStatusProvider{
  Future<void> logout();
}

abstract class UserDetailsModelFriendsRepositoryProvider{
  Future<FriendsGetResponse> loadFriends({required int friendId,
  });
  Future<UserWall> loadWallUser( {required int friendId,
    required String fill,
  });
  Future<UserDetails> loadDetails(
      {required int friendId,
        required String fields,
        required String nameCase});
  Future<void> updateLike( int index, bool isLike, String ownerIid, String itemId, String type);
}

abstract class UserDetailsModelMainNavigationActionProvider{
  void resetNavigation( BuildContext context);
}

class UserDetailsModel extends ChangeNotifier {
  final UserDetailsModelLogoutStatusProvider authRepository;
  final UserDetailsModelFriendsRepositoryProvider friendRepository;
  final UserDetailsModelMainNavigationActionProvider mainNavigationAction;

  final data = UserDetailsData();
  var dataWall = UserDetailsWallData();

  UserDetails? _userDetails;
  UserWall? _userWall;
  final int friendId;
  final _friends = <Friend>[];
  bool _isProcessing = false;

  final String _fields =
      'universities,bdate,photo_max_orig,photo_100,photo_200,photo_200_orig,photo_400_orig,online,sex,followers_count,contacts, city, country,about,status,schools,education,online';
  final _nameCase = 'nom';
  final String _fill = 'owner';
  final String _type = 'post';

  bool get isProcessing => _isProcessing;
  UserDetails? get userDetails => _userDetails;
  UserWall? get userWall => _userWall;
  List<Friend> get friends => List.unmodifiable(_friends);

  UserDetailsModel(
      {required this.friendId,
        required this.authRepository,
        required this.friendRepository,
        required this.mainNavigationAction});

  Future<void> setupLocale(BuildContext context) async {
    UpdateData(null);
    await loadDetails(context);
    await loadFriends();
    await loadWallUser();
  }

  Future<void> loadDetails(BuildContext context) async {
    try {
      _userDetails = await friendRepository.loadDetails(friendId: friendId, fields: _fields, nameCase: _nameCase);
      UpdateData(_userDetails);
    } on ApiClientException catch(exception){
      _handleApiClientException(exception, context);
    }
  }

  void UpdateData(UserDetails? details) {
    data.firstName = details?.response?[0].firstName ?? 'Loading..';
    data.isLoading = details == null;
    if(details == null) {
      notifyListeners();
      return;
    }
    data.lastName = details.response?[0].lastName ?? '';
    data.userInfoData  = UserInfoDetailsData(
        avatarPath:details.response?[0].photo_400_orig,
        online:details.response?[0].online ?? 0,
        cityTitle: details.response?[0].city?.title ?? 'Не указан',
        avatarPath200: details.response?[0].photo_200_orig,
    );

    notifyListeners();
  }

  String parseDate (int dateUnix){
    final String dateIn = DateTime.fromMillisecondsSinceEpoch((dateUnix * 1000)).toString();
    final parsedDate = DateTime.parse(dateIn);
    final year = parsedDate.year.toString();
    final month = parsedDate.month.toString();
    final day = parsedDate.day.toString();
    final date = '$day.$year.$month';
    return date;
  }

  void UpdateWallData(UserWall? wall) {
    if(wall == null) {
      notifyListeners();
      return;
    }
    dataWall = UserDetailsWallData(userWall:wall);
    notifyListeners();
}

  Future<void> loadFriends() async {
    final friendsResponse =  await friendRepository.loadFriends(friendId: friendId);
    _friends.addAll(friendsResponse.friends);
    print(_friends.length);
    notifyListeners();
  }

  Future<void> loadWallUser() async {
    _userWall = await friendRepository.loadWallUser(friendId: friendId, fill: _fill);
     UpdateWallData(_userWall);
     notifyListeners();
  }

  Future<void> toggleLike(BuildContext context, int index,) async {

    final isLike = dataWall.userWall?.response?.items?[index].likes?.canLike == 0;
    final ownerIid = dataWall.userWall?.response?.items?[index].ownerId.toString() ?? '';
    final itemId = dataWall.userWall?.response?.items?[index].id.toString() ?? '';

    try {
      _isProcessing = true;
      await friendRepository.updateLike(index, isLike, ownerIid, itemId, _type);
      await loadWallUser();
      _isProcessing = false;
      notifyListeners();
    } on ApiClientException catch (e){
      _handleApiClientException(e,context);
    }
  }

  void _handleApiClientException(ApiClientException exception, BuildContext context) {
    switch(exception.type){
      case ApiClientExceptionType.sessionExpired:
        authRepository.logout();
        mainNavigationAction.resetNavigation(context);
        break;
      default:
        print(exception);
    }
  }
}
