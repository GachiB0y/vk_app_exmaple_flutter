import 'package:vk_exmaple/domain/api_client/friend_api_client.dart';
import 'package:vk_exmaple/domain/data-provider/session_data_provider.dart';
import 'package:vk_exmaple/domain/entity/friendSearch_get_response.dart';
import 'package:vk_exmaple/domain/entity/friends_get_response.dart';
import 'package:vk_exmaple/domain/entity/user_details.dart';
import 'package:vk_exmaple/domain/entity/user_wall.dart';
import 'package:vk_exmaple/widget/profil_details/profile_details_model.dart';

class FriendsRepository implements UserDetailsModelFriendsRepositoryProvider{
  final SessionDataProvdier sessionDataProvdier;
  final _friendApiClient = FriendApiClient();

  FriendsRepository(this.sessionDataProvdier);

  Future<FriendsGetResponse> friends(String user_id,String fields,String access_token,) async{
    return _friendApiClient.friends(user_id, fields, access_token);
  }
  Future<FriendsSearchGetResponse> searchFriends(String query,String fields,String access_token,) async{
    return _friendApiClient.searchFriends(query, fields, access_token);
  }

  @override
  Future<UserDetails> loadDetails(
      {required int friendId,
        required String fields,
        required String nameCase}) async {
    final access_token = await sessionDataProvdier.getSessionId();
    final userDetails = await _friendApiClient.userDetails(
        friendId.toString(), fields, access_token as String, nameCase);
    return userDetails;
  }

  @override
  Future<void> updateLike( int index, bool isLike, String ownerIid, String itemId, String type) async {
    final accessToken =await sessionDataProvdier.getSessionId();
    if (accessToken == null) return;
      await _friendApiClient.likesPost(
          owner_id: ownerIid,
          type: type,
          access_token: accessToken,
          item_id: itemId,
          isLike: isLike);
  }

  @override
  Future<UserWall> loadWallUser( {required int friendId,
    required String fill,
    }) async {
    final access_token =await sessionDataProvdier.getSessionId();
    final userWall = await _friendApiClient.userDetailsWall(
        friendId.toString(), fill, access_token as String);
    return userWall;
  }

  @override
  Future<FriendsGetResponse> loadFriends({required int friendId,
  }) async {
    final access_token =await sessionDataProvdier.getSessionId();
    final friendsResponse =
    await _friendApiClient.friends(friendId.toString(), 'photo_50', access_token as String);
    return friendsResponse;
  }
}