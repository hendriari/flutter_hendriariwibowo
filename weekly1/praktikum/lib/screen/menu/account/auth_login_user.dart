import 'package:flutter/material.dart';
import 'package:praktikum/screen/menu/account/account_page.dart';
import 'package:praktikum/screen/menu/account/login_page.dart';

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