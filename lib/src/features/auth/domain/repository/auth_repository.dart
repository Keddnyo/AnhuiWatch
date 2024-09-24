abstract class AuthRepository {
  String? get username;

  String? get userEmail;

  void signInWithGoogle();

  void signOut();
}
