import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Google Sign In
  Future<User?> signInWithGoogle() async {
    try {
      final googleUser =
      await GoogleSignIn.instance.authenticate();

      if (googleUser == null) return null;

      final googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential =
      await FirebaseAuth.instance
          .signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Logout
  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
    await _auth.signOut();
  }

  // Current User
  User? get currentUser => _auth.currentUser;
}