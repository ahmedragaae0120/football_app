part of 'profile_cubit.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileSuccessState extends ProfileState {
  UserModel? user;
  ProfileSuccessState(this.user);
}

final class ProfileErrorState extends ProfileState {
  String error;
  ProfileErrorState(this.error);
}

final class ProfileLoadingState extends ProfileState {}

final class LogOutState extends ProfileState {}
