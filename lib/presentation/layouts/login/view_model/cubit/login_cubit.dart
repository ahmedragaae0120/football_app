import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:football_app/core/local/shared_preferences_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await SharedPreferencesHelper.setId(credential.user!.uid);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      print('Error code: ${e.code}'); // طباعة كود الخطأ لتتبعه
      if (e.code == 'user-not-found') {
        emit(LoginFailedState('No user found for that email.'));
      } else if (e.code == 'too-many-requests') {
        emit(LoginFailedState('Too many requests. Please try again later.'));
        await Future.delayed(const Duration(seconds: 30));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailedState('Wrong password provided for that user.'));
      } else {
        emit(LoginFailedState('Unknown FirebaseAuth error: ${e.code}'));
      }
    } catch (error) {
      log(error.toString());
      emit(LoginFailedState(error.toString()));
    }
  }

  // Future<void> updateUserData(String userId) async {
  //   try {
  //     UserModel? databaseUser =
  //         await FirestoreHelper.getUser(userId);
  //     emit(LoginSuccessState(databaseUser));
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
