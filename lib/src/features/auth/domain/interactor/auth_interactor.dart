import '../../data/repository/auth_repository_impl.dart';
import '../repository/auth_repository.dart';

class AuthInteractor {
  AuthInteractor._() : _repository = AuthRepositoryImpl();

  final AuthRepository _repository;

  static AuthInteractor get instance => AuthInteractor._();

  String? get username => _repository.username;

  String? get userEmail => _repository.userEmail;

  void signInWithGoogle() => _repository.signInWithGoogle();

  void signOut() => _repository.signOut();
}
