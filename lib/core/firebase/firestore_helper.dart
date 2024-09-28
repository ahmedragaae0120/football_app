import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_app/data/models/user_model/user.dart';
import 'package:injectable/injectable.dart';

@singleton
class FirestoreHelper {
  static CollectionReference<UserModel> getUserCollections() {
    var reference =
        FirebaseFirestore.instance.collection("Users").withConverter(
      fromFirestore: (snapshot, options) {
        Map<String, dynamic>? data = snapshot.data();
        return UserModel.fromFirestore(data ?? {});
      },
      toFirestore: (user, options) {
        return user.toFirestore();
      },
    );
    return reference;
  }

  static Future<void> addUser(
      {required String name, required String email, required String id}) async {
    var document = getUserCollections().doc(id);
    await document.set(UserModel(
        name: name,
        email: email,
        id: id,
        profileImage: null,
        biography: null,
        favouriteTeam: null));
  }

  static Future<void> updateProfileImage(
      {required String userId, required String pathImage}) async {
    var document = getUserCollections().doc(userId);
    await document.update({"profileImage": pathImage});
  }

  static Future<UserModel?> getUser(String userId) async {
    var document = getUserCollections().doc(userId);
    var snapshot = await document.get();
    UserModel? user = snapshot.data();
    return user;
  }
}
