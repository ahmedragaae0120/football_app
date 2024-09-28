import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/core/firebase/firestore_helper.dart';
import 'package:football_app/core/local/shared_preferences_helper.dart';
import 'package:football_app/data/models/user_model/user.dart';
import 'package:path/path.dart' as p;

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  uploadImage(context, File? image) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child(p.basename(image!.path));
      UploadTask storageUploadTask = ref.putFile(image);
      TaskSnapshot taskSnapshot = storageUploadTask.snapshot;
      String url = await taskSnapshot.ref.getDownloadURL();
      String userid = SharedPreferencesHelper.getId();
      await FirestoreHelper.updateProfileImage(userId: userid, pathImage: url);
      await getDataUser();
      log(url);
    } catch (error) {
      log(error.toString());
      emit(ProfileErrorState(error.toString()));
    }
  }

  Future<void> getDataUser() async {
    emit(ProfileLoadingState());
    try {
      String userId = SharedPreferencesHelper.getId();
      UserModel? databaseUser = await FirestoreHelper.getUser(userId);
      emit(ProfileSuccessState(databaseUser));
    } catch (error) {
      emit(ProfileErrorState(error.toString()));
    }
  }

  Future<void> logOut() async {
    log("log out");
    await FirebaseAuth.instance.signOut();
    log(FirebaseAuth.instance.currentUser.toString());
    await SharedPreferencesHelper.clearId();
    emit(LogOutState());
  }
}
