import 'package:flutter_bloc/flutter_bloc.dart';

enum LoaderViewCubitState{
  authorized,notAuthorized,unknown
}

abstract class LoaderViewModelAuthStatusProvider{
  Future<bool> isAuth();
}

class LoaderViewCubit extends Cubit<LoaderViewCubitState>{
  final LoaderViewModelAuthStatusProvider authStatusProvider;


  LoaderViewCubit (this.authStatusProvider) : super(LoaderViewCubitState.unknown){
    asyncInit();
  }

  Future<void> asyncInit() async{
    await checkAuth();
  }

  Future<void> checkAuth() async {
    final isAuth = await authStatusProvider.isAuth();
    isAuth ?  emit(LoaderViewCubitState.authorized) : emit(LoaderViewCubitState.notAuthorized);
  }
}

