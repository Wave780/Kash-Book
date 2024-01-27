import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:kashbook_app/config/routes/app_location.dart';
import 'package:kashbook_app/utils/showSnackBar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth auth;

  FirebaseAuthMethods(this.auth);

  //EMAIL SIGN UP
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

// EMAIL LOGIN
  Future<UserCredential?> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    UserCredential? userCredential;
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        userCredential = value;
        if (!auth.currentUser!.emailVerified) {
          await sendEmailVerification(context);
        } else {
          context.push(RouteLocation.homeScreen, extra: userCredential);
        }
        return value;
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
    return null;
  }

//EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
