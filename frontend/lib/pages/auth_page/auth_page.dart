import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shop/services/responsive_size.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shop/repos/user_repository.dart';

class AuthPage extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 1000);

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  String _emailValidator(String email) {
    bool isValid = EmailValidator.validate(email);
    return isValid ? null : "Неправильно введенный e-mail";
  }

  String _passwordValidator(String password) {
    return password.length >= 6 ? null : "Пароль слишком короткий";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        FlutterLogin(
          emailValidator: _emailValidator,
          passwordValidator: _passwordValidator,
          messages: LoginMessages(
              confirmPasswordError: "Пароли не совпадают",
              loginButton: "ВОЙТИ",
              recoverPasswordIntro: "Введите свой E-mail",
              recoverPasswordDescription:
                  "Мы отправим текст с паролем на этот электронный адрес",
              recoverPasswordButton: "ВОССТАНОВИТЬ",
              goBackButton: "НАЗАД",
              passwordHint: "Пароль",
              forgotPasswordButton: "Забыли пароль?",
              confirmPasswordHint: "Подтвердите пароль",
              signupButton: "ЗАРЕГИСТРИРОВАТЬСЯ"),
          onRecoverPassword: _recoverPassword,
          onLogin: (LoginData data) async {
            return await UserRepository.login(data.name, data.password);
          },
          onSubmitAnimationCompleted: () =>
              Navigator.of(context).pushNamedAndRemoveUntil("/", (_) => false),
          onSignup: (LoginData data) async {
            return await UserRepository.signUp(data.name, data.password);
          },
          title: "MyAwesomeShop",
          theme: LoginTheme(
            primaryColor: Color(0xFF0C2944),
            buttonTheme: LoginButtonTheme(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            titleStyle: TextStyle(
              fontSize: 35.height,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 40.height,
          left: 8.width,
          child: RaisedButton(
            elevation: 8,
            shape: CircleBorder(),
            child: Icon(
              Icons.arrow_back_ios_rounded,
            ),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
