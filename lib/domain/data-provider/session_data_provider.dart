import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vk_exmaple/library/flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys{
  static const sessionId='session-id';
}

abstract class SessionDataProvdier{
  Future<String?> getSessionId ();
  Future<void>  setSessionId(String value);
  Future<void>  deleteSessionId();
}

class SessionDataProvdierDefault implements SessionDataProvdier{
  final SecureStorage secureStorage;

  const SessionDataProvdierDefault(this.secureStorage);

  Future<String?> getSessionId () =>secureStorage.read(key: _Keys.sessionId);

  Future<void>  setSessionId(String value)  {
      return secureStorage.write(key: _Keys.sessionId, value: value);
  }

  Future<void>  deleteSessionId()  {
      return secureStorage.delete(key: _Keys.sessionId);
  }
}