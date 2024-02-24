import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationService {
  Future<bool> signInWithEmailAndPassword(String email, String password);
  Future<bool> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<User?> currentUser();
}

class AuthenticationServiceImpl extends AuthenticationService {
  final instance = FirebaseAuth.instance;

  @override
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await instance.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = userCredential.user;
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> signUpWithEmailAndPassword(String email, String password) async {
    final userCredential = await instance.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = userCredential.user;

    if (user != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> signOut() async {
    await instance.signOut();
  }

  @override
  Future<User?> currentUser() {
    return Future.value(instance.currentUser); //what is the diff asyn await return future.value
  }
}
