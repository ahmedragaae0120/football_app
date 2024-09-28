import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:football_app/core/firebase/firestore_helper.dart';
import 'package:football_app/core/local/shared_preferences_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register(String email, String password, String name) async {
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirestoreHelper.addUser(
          name: name, email: email, id: credential.user!.uid);
      await SharedPreferencesHelper.setId(credential.user!.uid);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailedState('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailedState('The account already exists for that email.'));
      }
    } catch (error) {
      log(error.toString());
      emit(RegisterFailedState(error.toString()));
    }
  }
}
