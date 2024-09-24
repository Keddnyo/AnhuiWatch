import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuth {
  auth.FirebaseAuth get _auth => auth.FirebaseAuth.instance;

  String? get username => _auth.currentUser?.displayName;

  String? get userEmail => _auth.currentUser?.email;

  void signInWithGoogle() => GoogleSignIn().signIn().then(
        (account) {
          account?.authentication.then(
            (authentication) => _auth.signInWithCredential(
              auth.GoogleAuthProvider.credential(
                idToken: authentication.idToken,
                accessToken: authentication.accessToken,
              ),
            ),
          );
        },
      );

  void signOut() => _auth.signOut();
}
