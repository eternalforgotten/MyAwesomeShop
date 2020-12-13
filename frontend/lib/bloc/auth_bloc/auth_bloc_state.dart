part of 'auth_bloc_bloc.dart';

@immutable
abstract class AuthBlocState {}

class AuthBlocInitial extends AuthBlocState {}

class AuthSuccessfulState extends AuthBlocState {}

class AuthErrorState extends AuthBlocState {
  final String errorMessage;

  AuthErrorState(this.errorMessage);
}