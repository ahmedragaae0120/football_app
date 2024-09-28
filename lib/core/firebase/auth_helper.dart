import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthHelper {
  Future<UserCredential> createNewUser(
      {required String email,
      required String password,
      required String fullName}) async {
    // authprovider provider = Provider.of<authprovider>(context, listen: false);
    // DialogUtils.showLoaingDialog(context);
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    return credential;
    // try {

    //   await FirestoreHelper.AddUser(
    //       email: email, fullname: fullName, userid: credential.user!.uid);
    //   DialogUtils.hideLoaingDialog(context);
    //   DialogUtils.showMessage(
    //     context: context,
    //     message: "Register successed id: ${credential.user?.uid}",
    //     positiveText: "ok",
    //     positiveButton: () {
    //       provider.setUsers(
    //           newfirebaseAuthUser: credential.user,
    //           newdatabaseUser: userModel(
    //               fullName: fullName, email: email, id: credential.user!.uid));
    //       DialogUtils.hideLoaingDialog(context);
    //       Navigator.pushNamedAndRemoveUntil(
    //           context, homeSreen.route_name, (route) => false);
    //     },
    //   );
    // } on FirebaseAuthException catch (e) {
    //   DialogUtils.hideLoaingDialog(context);
    //   if (e.code == FirebaseAuthErorrCodes.weak_password) {
    //     print('weak password');
    //     DialogUtils.showMessage(
    //       context: context,
    //       message: 'weak password',
    //       positiveText: "ok",
    //       positiveButton: () => DialogUtils.hideLoaingDialog(context),
    //     );
    //   } else if (e.code == FirebaseAuthErorrCodes.email_already_in_use) {
    //     print('The account already exists for that email.');
    //     DialogUtils.showMessage(
    //       context: context,
    //       message: 'The account already exists for that email.',
    //       positiveText: "ok",
    //       positiveButton: () => DialogUtils.hideLoaingDialog(context),
    //     );
    //   }
    // } catch (e) {
    //   DialogUtils.hideLoaingDialog(context);
    //   print(e);
    //   DialogUtils.showMessage(
    //     context: context,
    //     message: e.toString(),
    //     positiveText: "ok",
    //     positiveButton: () => DialogUtils.hideLoaingDialog(context),
    //   );
    // }
  }

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    return credential;

    // try {

    // userModel? user = await FirestoreHelper.getUser(credential.user!.uid);
    // provider.setUsers(
    //     newfirebaseAuthUser: credential.user, newdatabaseUser: user);
    // DialogUtils.hideLoaingDialog(context);
    // Navigator.pushNamedAndRemoveUntil(
    //     context, homeSreen.route_name, (route) => false);
    // } on FirebaseAuthException catch (e) {
    //   DialogUtils.hideLoaingDialog(context);
    //   if (e.code == FirebaseAuthErorrCodes.usernotfound) {
    //     DialogUtils.showMessage(
    //         context: context,
    //         message: "No user found for that email.",
    //         positiveText: "ok",
    //         positiveButton: () => DialogUtils.hideLoaingDialog(context));
    //   } else if (e.code == FirebaseAuthErorrCodes.wrongPassword) {
    //     DialogUtils.showMessage(
    //         context: context,
    //         message: "Wrong password.",
    //         positiveText: "ok",
    //         positiveButton: () => DialogUtils.hideLoaingDialog(context));
    //   } else {
    //     DialogUtils.showMessage(
    //       context: context,
    //       message: "no internet try again",
    //       positiveText: "try again",
    //       positiveButton: () => DialogUtils.hideLoaingDialog(context),
    //     );
    //   }
    // }
  }

  // static Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
}
