import 'package:shopee/data/repositories/auth_repository.dart';

class AuthViewModel {
  AuthRepository authRepository;

  AuthViewModel({required this.authRepository});

  signUp({required email,required password}){
    return authRepository.signUp(email: email, password: password);
  }
}