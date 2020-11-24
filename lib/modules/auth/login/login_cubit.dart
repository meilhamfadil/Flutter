import 'dart:math';

import 'package:baseflutter/base/base_cubit.dart';
import 'package:baseflutter/modules/auth/data/auth_model.dart';
import 'package:baseflutter/modules/auth/data/auth_repository.dart';
import 'package:baseflutter/modules/auth/login/login_state.dart';
import 'package:flutter/cupertino.dart';

class LoginCubit extends BaseCubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginInitial());

  FocusNode focusUsername = FocusNode();
  FocusNode focusPassword = FocusNode();

  TextEditingController controllerUsername = TextEditingController(text: "");
  TextEditingController controllerPassword = TextEditingController(text: "");

  Future<AuthModel> doLogin(String username, String password) async {
    try {
      emit(LoginLoading());
      final loginResult = await _authRepository.doLogin(username, password);
      emit(LoginResult(loginResult));
    } on NetworkException {
      final random = Random().nextInt(3);
      switch (random) {
        case 0:
          emit(LoginError("Username Not Registered"));
          break;
        case 1:
          emit(LoginError("Wrong Password"));
          break;
        case 2:
          emit(LoginError("Cannot Connect to Internet"));
          break;
        default:
          emit(LoginError("Something Error"));
          break;
      }
    }
  }
}
