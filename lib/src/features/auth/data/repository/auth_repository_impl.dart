import '../../domain/repository/auth_repository.dart';
import '../firebase/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl() : _auth = FirebaseAuth();

  final FirebaseAuth _auth;

  @override
  void signInWithGoogle() => _auth.signInWithGoogle();

  @override
  void signOut() => _auth.signOut();

  @override
  String? get username => _auth.username;

  @override
  String? get userEmail => _auth.userEmail;
}
