import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    } catch (error) {
      if (error.toString() ==
          "[firebase_storage/object-not-found] No object exists at the desired reference.") {
        return uploadImage(context, image);
      }
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

  editDataUser(
      {required String textcontroller,
      required String edit,
      required context}) async {
    try {
      String userid = SharedPreferencesHelper.getId();
      await FirestoreHelper.updateProfileData(
          userId: userid, edit: edit, textcontroller: textcontroller);
      await getDataUser();
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    } catch (error) {
      print("error edit:$error");
      emit(ProfileErrorState(error.toString()));
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
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
