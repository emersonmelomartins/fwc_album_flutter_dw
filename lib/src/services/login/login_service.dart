// Command design pattern
abstract interface class LoginService {
  Future<void> execute({required String email, required String password});
}
