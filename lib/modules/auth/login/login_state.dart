import 'package:baseflutter/base/base_state.dart';
import 'package:baseflutter/modules/auth/data/auth_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginState extends BaseState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginResult extends LoginState {
  final AuthModel authModel;

  const LoginResult(this.authModel);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is LoginResult && runtimeType == other.runtimeType && authModel == other.authModel;

  @override
  int get hashCode => authModel.hashCode;
}

class LoginError extends LoginState{
  final String message;
  LoginError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is LoginError && runtimeType == other.runtimeType && message == other.message;

  @override
  int get hashCode => message.hashCode;
}