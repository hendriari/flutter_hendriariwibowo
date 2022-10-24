import 'package:ebow_book/src/view/menu/account/already_login/account_page.dart';
import 'package:ebow_book/src/view/menu/account/not_login/login_page.dart';
import 'package:flutter/material.dart';

class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({Key? key}) : super(key: key);

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  late bool _isLogin;

  @override
  void initState() {
    super.initState();
    _isLogin = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLogin ? const AccountPage() : const LoginPage(),
    );
  }
}
