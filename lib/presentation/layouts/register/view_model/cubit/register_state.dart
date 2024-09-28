part of 'register_cubit.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterSuccessState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterFailedState extends RegisterState {
  String error;
  RegisterFailedState(this.error);
}
