import 'package:vk_exmaple/configuration/configuration.dart';
import 'package:vk_exmaple/domain/api_client/api_client_exception.dart';
import 'package:vk_exmaple/domain/api_client/network_client.dart';

class AuthApiClient{
  final _networkClient = NetworkClient();

  Future<String> auth({
    required String username,
    required String password,
  }) async{
    if(username == 'admin' && password == '123456'){
      final sessionid =Configuration.tokenUser;// На время просто ворзвращаю токен, который получен через сайт Вкхост чтобы в модели получить токен
      return sessionid;
    }else{
        throw ApiClientException(ApiClientExceptionType.auth);
    }
    // final token = await _makeToken(userId);

  }


  Future<String> _makeToken(String client_id) async {
    String parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = json['access_token'] as String;
      return token;
    }
    final result = _networkClient.get(
      '/authorize?',
      parser,
      <String, dynamic> {
        'client_id':client_id,
        'display':'popup',
        'scope':'friends',
        'response_type':'token',
        'redirect_uri':'https://vk.com/away.php?to=https://oauth.vk.com/blank.html',
        'v':'5.131 HTTP/1.1',
      },);
    return result;
  }
}