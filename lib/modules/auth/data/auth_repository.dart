import 'dart:math';

import 'package:baseflutter/modules/auth/data/auth_model.dart';

abstract class AuthRepository {
  Future<AuthModel> doLogin(String username, String password);
}

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<AuthModel> doLogin(String username, String password) {
    return Future.delayed(Duration(seconds: 1), () {
      final random = Random();

      if (random.nextBool()) throw NetworkException();

      return AuthModel(
        username: "Kudzoza",
        email: "me.ilhamfadil@gmail.com",
        tagLine: "Do your best!",
      );
    });
  }
}

class NetworkException implements Exception {}
