import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_exmaple/domain/api_client/api_client_exception.dart';
import 'package:vk_exmaple/domain/repository/auth_repository.dart';

abstract class AuthViewCubitState {
}

class AuthViewCubitFormFillInProgressState extends AuthViewCubitState{
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewCubitFormFillInProgressState &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthViewCubitErrorState extends AuthViewCubitState{
  final String? errorMessage;

  AuthViewCubitErrorState(this.errorMessage);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewCubitErrorState &&
          runtimeType == other.runtimeType &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => errorMessage.hashCode;
}
class AuthViewCubitAuthProgressState extends AuthViewCubitState{
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewCubitAuthProgressState &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthViewCubitSuccesAuthState extends AuthViewCubitState{
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthViewCubitSuccesAuthState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AuthViewCubit extends Cubit<AuthViewCubitState>{
  final AuthRepository authRepository;
  AuthViewCubit (this.authRepository) : super(AuthViewCubitFormFillInProgressState()){
  }

  bool  _isValid(String login, String password) => login.isNotEmpty || password.isNotEmpty;

  Future<void> auth({required String login,required String password}) async{
    emit(AuthViewCubitAuthProgressState());
    if(!_isValid(login,password)) {
      final newState = AuthViewCubitErrorState('Заполните логин или пароль');
      emit(newState);
      return;
    }

    final errorMessage = await _login(login, password);
    if (errorMessage == null) {
      emit(AuthViewCubitSuccesAuthState());
    }else{
      emit(AuthViewCubitErrorState(errorMessage));
    }
  }

  Future<String?> _login(String login, String password) async{
    try{
      // sessionId =_apiClient.tokenUser;
      await authRepository.login(login, password);
    } on ApiClientException catch (e){
      switch (e.type){
        case ApiClientExceptionType.network:
          return 'Сервер не доступен.Проверьте подключение к интернету';
        case ApiClientExceptionType.auth:
          return 'Неправильный логин или пароль!';
        case ApiClientExceptionType.other:
          return 'Проищошла ошибка. Попробуйте еще раз!';
      }
    } catch(e){
      return 'Произошла ошибка. Попробуйте еще раз!';
    }
    return null;
  }

}

//
// class AuthViewModel extends ChangeNotifier{
//   final _authRepository = AuthRepository();
//
//   final loginTextController = TextEditingController(text: "admin");
//   final passwordTextController = TextEditingController(text: "admin");
//
//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;
//
//   bool isChecked = false;
//   bool _isAuthProgress = false;
//   bool get canStartAuth => !_isAuthProgress;
//   bool get isAuthProgress => _isAuthProgress;
//
//   bool  _isValid(String login, String password) => login.isNotEmpty || password.isNotEmpty;
//
//   Future<String?> _login(String login, String password) async{
//     try{
//       // sessionId =_apiClient.tokenUser;
//       await _authRepository.login(login, password);
//     } on ApiClientException catch (e){
//       switch (e.type){
//         case ApiClientExceptionType.network:
//           return 'Сервер не доступен.ПРоверьте подключение к интернету';
//         case ApiClientExceptionType.auth:
//           return 'Неправильный логин или пароль!';
//         case ApiClientExceptionType.other:
//           return 'Проищошла ошибка. Поробуйте еще раз!';
//       }
//     } catch(e){
//       return 'Проищошла ошибка. Поробуйте еще раз!';
//     }
//     return null;
//   }
//
//   Future<void> auth(BuildContext context) async{
//     final login = loginTextController.text;
//     final password = passwordTextController.text;
//
//     if(!_isValid(login,password)) {
//       _updateState('Заполните логин или пароль', false);
//       return;
//     }
//
//     _updateState(null, true);
//
//     _errorMessage = await _login(login, password);
//     if (_errorMessage == null) {
//       MainNavigation.resetNavigation(context);
//     }else{
//       _updateState(_errorMessage, false);
//     }
//   }
//
//   void changeChecked () {
//     isChecked = !isChecked;
//   }
//
//   void _updateState(String? errorMessage, bool isAuthProgress) {
//     if(_errorMessage == errorMessage && _isAuthProgress == isAuthProgress){
//       return;
//     }
//     _errorMessage = errorMessage;
//     _isAuthProgress = isAuthProgress;
//     notifyListeners();
//   }
//
//
// }
