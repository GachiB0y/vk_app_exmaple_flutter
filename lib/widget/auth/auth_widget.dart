import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vk_exmaple/ui/naviagtion/main_navigation.actions.dart';
import 'package:vk_exmaple/widget/auth/auth_view_cubit.dart';


class _AuthDataStorage{
  String login ='';
  String password ='';
}

class AuthWidget extends StatelessWidget {
  final MainNavigationAction mainNavigationAction;
  const AuthWidget({Key? key, required this.mainNavigationAction}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return BlocListener<AuthViewCubit, AuthViewCubitState>(
      listener: _onAuthViewCubitStateChange,
      child: Provider(
        create: (_)=> _AuthDataStorage(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 70),
                  Text('Авторизация',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
                  SizedBox(height: 140),
                  _AuthFromWidget(),
                ],
              ),]
            ),
          ),
    ),
      ),
  );
  }

  void _onAuthViewCubitStateChange(BuildContext context,AuthViewCubitState state ){

    if(state  is AuthViewCubitSuccesAuthState){
      mainNavigationAction.resetNavigation(context);
      // MainNavigation.resetNavigation(context);
    }
  }

}

class _AuthFromWidget extends StatefulWidget {
  const _AuthFromWidget({Key? key}) : super(key: key);

  @override
  State<_AuthFromWidget> createState() => _AuthFromWidgetState();
}

class _AuthFromWidgetState extends State<_AuthFromWidget> {
  final loginTextController = TextEditingController(text: "admin");
   final passwordTextController = TextEditingController(text: "admin");

   @override
  void initState() {
    super.initState();
    final cubit = context.read<AuthViewCubit>();
  }

  @override
  Widget build(BuildContext context) {
     final authDataStorage = context.read<_AuthDataStorage>(); //NotifierProvider.read<AuthViewModel>(context);
    final textStyle = const TextStyle(fontSize: 16,color: Colors.grey);
    return Column(
      children: [
        _ErrorMessageWidget(),
        TextField(
         onChanged: (text)=> authDataStorage.login = text,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[150],
            contentPadding:  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: InputBorder.none,
            labelText: 'Логин',
          ),
        ),
        SizedBox(height: 15,),
        TextFormField(
          onChanged: (text)=> authDataStorage.password = text,
          obscureText: true,
          decoration: InputDecoration(
            contentPadding:  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            filled: true,
            fillColor: Colors.grey[150],
            border:InputBorder.none,
            labelText: 'Пароль',
          ),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Checkbox(
              value:false,
              onChanged: (value){ /* model.changeChecked()*/},
              ),
            Text('Запоминть меня',style: textStyle,),
          ],),
        Container(
          width: double.infinity,
          child: _AuthButtonWidget(),
        ),
        SizedBox(height: 10,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(6))
          ),
          child: TextButton(
              onPressed: () {},
              style: ButtonStyle( textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),),
              child: Text('Регистрация')),
        ),
        SizedBox(height: 10,),
        Text('Восстановить пароль',style:textStyle ,)
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
   const _AuthButtonWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthViewCubit>();
    final canStartAuth =cubit.state is AuthViewCubitFormFillInProgressState ||cubit.state is AuthViewCubitErrorState;
    final authDataStorage = context.read<_AuthDataStorage>();
    final onPressed = canStartAuth ? ()=> cubit.auth(login:authDataStorage.login,password: authDataStorage.password ) : null;
    final child = cubit.state is AuthViewCubitAuthProgressState ?
    SizedBox(
      height: 20,
        width: 20,
        child: const CircularProgressIndicator())
        : const Text('Войти');
    return ElevatedButton(
        onPressed:onPressed,
        style:  ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blue[600]),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          textStyle:const MaterialStatePropertyAll(TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
          padding:const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15)),
        ),
        child:child
    );

  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select((AuthViewCubit c) {
      final state = c.state;
      return state is AuthViewCubitErrorState ? state.errorMessage : null;
    });
    if(errorMessage == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        errorMessage,
        style: TextStyle(
            fontSize: 16,
            color: Colors.red),
      ),
    );
  }
}

