import 'package:baseflutter/assets/app_theme.dart';
import 'package:baseflutter/assets/decoration.dart';
import 'package:baseflutter/assets/images.dart';
import 'package:baseflutter/base/base_component.dart';
import 'package:baseflutter/base/base_screen.dart';
import 'package:baseflutter/components/pressable.dart';
import 'package:baseflutter/components/text.dart';
import 'package:baseflutter/modules/auth/data/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginComponent extends BaseComponent {
  LoginComponent(ScreenContract screen) : super(screen);

  @override
  _LoginComponent createState() => _LoginComponent(screen);
}

class _LoginComponent extends BaseComponentState<LoginComponent, LoginCubit, LoginState> with RenderComponent {
  _LoginComponent(ScreenContract screen) : super(screen);

  @override
  LoginCubit initCubit() => LoginCubit(AuthRepositoryImpl());

  @override
  void blocListener(BuildContext context, LoginState data) {
    if (data is LoginError) {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(data.message)),
      );
    }
  }

  @override
  Widget render(BuildContext context, LoginState data) => Column(
        children: [
          if (data is LoginResult) Expanded(child: _buildBanner(data)),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: _renderForm(BlocProvider.of<LoginCubit>(context), data),
          ),
        ],
      );

  Widget _buildBanner(LoginState data) => BuildBanner(data: data);

  Widget _renderForm(LoginCubit cubit, LoginState data) => BuildForm(cubit: cubit, data: data);
}

class BuildForm extends StatelessWidget {
  final LoginCubit cubit;
  final LoginState data;

  const BuildForm({Key key, this.cubit, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(children: [
        TextComponent.left("Username", padding: EdgeInsets.all(8)),
        TextField(
          controller: cubit.controllerUsername,
          focusNode: cubit.focusUsername,
          textInputAction: TextInputAction.next,
          onSubmitted: (username) => cubit.focusPassword.requestFocus(),
          decoration: AppDecoration.defaultTextField,
        ),
        Container(height: 8),
        TextComponent.left("Password", padding: EdgeInsets.all(8)),
        TextField(
          controller: cubit.controllerPassword,
          focusNode: cubit.focusPassword,
          textInputAction: TextInputAction.send,
          onSubmitted: (password) => cubit.focusPassword.unfocus(),
          decoration: AppDecoration.defaultTextField,
        ),
        Container(height: 16),
        Pressable(
          label: "Login",
          loading: data is LoginLoading,
          onPress: () => cubit.doLogin(
            cubit.controllerUsername.text,
            cubit.controllerPassword.text,
          ),
        )
      ]);
}

class BuildBanner extends StatelessWidget {
  final LoginResult data;

  const BuildBanner({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(color: AppColor.primary),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AppImages.logo,
                width: 40,
                height: 40,
              ),
              Container(height: 24),
              Text(
                data.authModel.username,
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 18,
                ),
              ),
              Container(height: 8),
              Text(
                data.authModel.email,
                style: TextStyle(color: AppColor.white),
              ),
              Container(height: 16),
              Text(
                data.authModel.tagLine,
                style: TextStyle(fontStyle: FontStyle.italic, color: AppColor.white),
              )
            ],
          ),
        ),
      );
}
