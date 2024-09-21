part of 'login_cubit.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginFailedState extends LoginState {
  String error;
  LoginFailedState(this.error);
}
