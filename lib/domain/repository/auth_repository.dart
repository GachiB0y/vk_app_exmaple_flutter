import 'package:vk_exmaple/domain/api_client/auth_api_client.dart';
import 'package:vk_exmaple/domain/data-provider/session_data_provider.dart';
import 'package:vk_exmaple/widget/loader_widget/loader_view_cubit.dart';
import 'package:vk_exmaple/widget/profil_details/profile_details_model.dart';

class AuthRepository implements LoaderViewModelAuthStatusProvider,UserDetailsModelLogoutStatusProvider{
  final SessionDataProvdier sessionDataProvdier;
  final _apiClient = AuthApiClient();

  AuthRepository(this.sessionDataProvdier);

  @override
  Future<bool> isAuth() async{
    final sessionId = await sessionDataProvdier.getSessionId();
    final isAuth = sessionId != null;
    return isAuth;
  }

  Future<void> login (String login, String password) async {
    // sessionId =_apiClient.tokenUser;
    final sessionId = await _apiClient.auth(username: login, password: password);
    await sessionDataProvdier.setSessionId(sessionId) ;
  }

  @override
  Future<void> logout() async{
    await sessionDataProvdier.deleteSessionId();
  }
}