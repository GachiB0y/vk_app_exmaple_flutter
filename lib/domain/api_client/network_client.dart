import 'dart:convert';
import 'dart:io';

import 'package:vk_exmaple/configuration/configuration.dart';
import 'package:vk_exmaple/domain/api_client/api_client_exception.dart';

class NetworkClient{
  final _client = HttpClient();
  static const _host = Configuration.host;

  Uri _makeUri( String path, [Map<String, dynamic>? paramentrs]){
    final uri =Uri.parse("$_host$path");

    if(paramentrs != null){
      return uri.replace(queryParameters: paramentrs);
    }else{
      return uri;
    }
  }


  Future <T> get<T>(String path,T Function(dynamic json) parser,  [Map<String, dynamic>? paramentrs,] ) async{
    final url = _makeUri(path,paramentrs);
    try{
      final request = await _client.getUrl(url);
      final response =  await request.close();
      final dynamic json = (await response.jsoneDecode()) ;
      _validateResponse(response, json);
      final result = parser(json);
      return result;
    } on SocketException{
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException{
      rethrow;
    } catch(_){
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }


  Future<T> post<T>(String path,T Function(dynamic json) parser,Map<String, dynamic>? bodyParamentrs,[Map<String, dynamic>? urlParamentrs,]) async{
    try{
      final url = _makeUri(path,urlParamentrs);
      final request = await _client.postUrl(url);

      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(bodyParamentrs));
      final response = await request.close();
      if ( response.statusCode == 200){
        return 1 as T;
      }
      final dynamic json = (await response.jsoneDecode()) ;
      _validateResponse(response, json);
      final result = parser(json);
      return result;
    } on SocketException{
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException{
      rethrow;
    } catch(_){
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }


  void _validateResponse(HttpClientResponse response, dynamic json) {
    if( response.statusCode == 401){
      final dynamic status = json['status_code'];
      final code = status is int ? status : 0;
      if (code == 30) {
        throw ApiClientException(ApiClientExceptionType.auth);
      }else if (code ==5){
        throw ApiClientException(ApiClientExceptionType.sessionExpired);

      }else{
        throw ApiClientException(ApiClientExceptionType.other);
      }
    }
  }
}
extension HttpClientResponseJsoneDecode on HttpClientResponse {
  Future<dynamic> jsoneDecode() async{
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((value) => jsonDecode(value));
  }
}


