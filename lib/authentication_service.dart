import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Future<String?> signIn(
  //     {required String email, required String password, UserCredential}) async {
  //   try {
  //     UserCredential = await _firebaseAuth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     return "Signed in";
  //   } on FirebaseAuthException catch (e) {
  //     // return e.message;
  //     if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<String?> signIn(
      {required String email, required String password, UserCredential}) async {
    try {
      UserCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(
      {required String email, required String password, UserCredential}) async {
    try {
      UserCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
