import 'package:vk_exmaple/configuration/configuration.dart';
import 'package:vk_exmaple/domain/api_client/network_client.dart';
import 'package:vk_exmaple/domain/entity/friendSearch_get_response.dart';
import 'package:vk_exmaple/domain/entity/user_details.dart';
import 'package:vk_exmaple/domain/entity/user_wall.dart';

import '../entity/friends_get_response.dart';



class FriendApiClient{
  final _networkClient = NetworkClient();
  static const _getMethodUrl = "https://api.vk.com/method";
  static const client_id =Configuration.userId;

  Future<FriendsGetResponse> friends(String user_id,String fields,String access_token,) async {
    FriendsGetResponse parser(dynamic json) {
       final jsonMap = json as Map<String, dynamic>;
       final jsoneKey = jsonMap['response'] as Map<String, dynamic>;
       final response = FriendsGetResponse.fromJson(jsoneKey);
       return response;
    }
    final result = _networkClient.get
      ('/method/friends.get?',
      parser,
      <String, dynamic> {
          'user_id':user_id,
          'fields':fields,
          'access_token':access_token,
          'v':'5.131 HTTP/1.1',
        },
    );
    return result;
  }
  Future<UserDetails> userDetails(String user_ids,String fields,String access_token, String name_case) async {
    UserDetails parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = UserDetails.fromJson(jsonMap);
      return response;
    }
    final result = _networkClient.get
      ('/method/users.get?',
      parser,
      <String, dynamic> {
        'user_ids':user_ids,
        'fields':fields,
        'name_case':name_case,
        'access_token':access_token,
        'v':'5.131 HTTP/1.1',
      },
    );
    return result;
  }

  Future<UserWall> userDetailsWall(String owner_id,String filter,String access_token) async {
    UserWall parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = UserWall.fromJson(jsonMap);
      return response;
    }
    final result = _networkClient.get
      ('/method/wall.get?',
      parser,
      <String, dynamic> {
        'owner_id':owner_id,
        'filter':filter,
        'access_token':access_token,
        'v':'5.131 HTTP/1.1',
      },
    );
    return result;
  }

  Future<String> likesPost(
      { required String owner_id,
        required String type,
        required String access_token,
        required String item_id,
        required bool isLike
      }) async {
    Map<String, dynamic> parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final jsoneKey = jsonMap['response'] as Map<String, dynamic>;
      return jsoneKey;
    }
    final String path = isLike ? '/method/likes.delete?' :'/method/likes.add?';
    final params = <String, dynamic> {
      'owner_id':owner_id,
      'type':type,
      'access_token':access_token,
      'item_id':item_id
    };
    final result = _networkClient.get
      (path,
      parser,
      <String, dynamic> {
        'owner_id':owner_id,
        'type':type,
        'access_token':access_token,
        'item_id':item_id,
        'v':'5.131 HTTP/1.1',
      },
    );
    return '1';
  }

  Future<FriendsSearchGetResponse> searchFriends(String query,String fields,String access_token,) async {
    FriendsSearchGetResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final jsoneKey = jsonMap['response'] as Map<String, dynamic>;
      final response = FriendsSearchGetResponse.fromJson(jsoneKey);
      return response;
    }
    final result = _networkClient.get
      ('/method/search.getHints?',
      parser,
      <String, dynamic> {
        'q':query,
        'search_global':'0',
        'filters':'friends',
        'fields':fields,
        'access_token':access_token,
        'v':'5.131 HTTP/1.1',
      },
    );
    return result;
  }
}
