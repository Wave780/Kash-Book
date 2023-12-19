import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashbook_app/service/firebase_auth_method.dart';

final authServiceProvider = StateProvider<FirebaseAuthMethods?>((ref) {
  return FirebaseAuthMethods(FirebaseAuth.instance) ;
});