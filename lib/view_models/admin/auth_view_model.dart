
import 'package:flutter/material.dart';

import '../../components/routes/app_routes.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/admin/auth_repository.dart';

class UsersViewModel extends ChangeNotifier{
  UserRepository authRepository;

  UsersViewModel({required this.authRepository});

  Stream<List<UserModel>> getAllUsers()=>authRepository.getAllUsers();
}
