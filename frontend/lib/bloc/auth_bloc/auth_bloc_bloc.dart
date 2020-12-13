import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/repos/user_repository.dart';
import 'package:shop/services/requests.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBlocBloc() : super(AuthBlocInitial());
  bool isAuth = false;

  @override
  Stream<AuthBlocState> mapEventToState(
    AuthBlocEvent event,
  ) async* {
    if (event is LoginEvent){
      yield* mapLoginToState(event.email, event.password);
    }
    if (event is SignUpEvent){
      yield* mapSignUpToState(event.email, event.password);
    }
    if (event is LogoutEvent){
      UserRepository.USERTOKEN = null;
      isAuth = false;
    }
  }

  Stream<AuthBlocState> mapLoginToState(String email, String pass) async* {
    UserRepository.USERTOKEN = await Requests.getToken(email, pass);
    if (UserRepository.USERTOKEN == null){
      yield AuthErrorState("Ошибка входа");
    }
    else{
      isAuth = true;
      yield AuthSuccessfulState();
    }
  }

  Stream<AuthBlocState> mapSignUpToState(String email, String pass) async* {
    await Requests.authorizeUser(email, pass);
    UserRepository.USERTOKEN = await Requests.getToken(email, pass);
    if (UserRepository.USERTOKEN == null){
      yield AuthErrorState("Ошибка регистрации");
    }
    else{
      isAuth = true;
      yield AuthSuccessfulState();
    }
  }
  

  
}
