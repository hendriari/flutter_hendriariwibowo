import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktik/common/color.dart';
import 'package:praktik/presentation/home_page.dart';
import 'package:praktik/presentation/landing_page.dart';
import 'package:praktik/presentation/register_page.dart';
import 'package:praktik/widget/alert_dialog.dart';
import 'package:praktik/widget/back_button_widget.dart';
import 'package:praktik/widget/button_widget.dart';
import 'package:praktik/widget/platform_login.dart';
import 'package:praktik/widget/text_from_fields.dart';
import 'package:praktik/widget/text_have_account.dart';
import 'package:praktik/widget/text_register_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late GlobalKey<FormState> _key;
  late SharedPreferences loginData;

  late bool newUser;
  bool scurePassword = true;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey();
    checkLogin();
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('login') ?? true;

    if (newUser == false) {
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const HomePage()),
          (route) => false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// back button
                  BackButtonWidget(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const LandingPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///text opening
                  Text(
                    'Welcome back! Glad to see you. Again!',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  /// email textfield
                  _emailTextField(),
                  const SizedBox(
                    height: 15,
                  ),

                  /// password textfield
                  _passwordTextField(),
                  const SizedBox(
                    height: 35,
                  ),

                  /// button
                  ButtonWidget(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        showDialogWidget(context, 'Please register to enter the main page',  'Features in maintenance');
                      }
                    },
                    sizeWidth: double.infinity,
                    backgroundColor: dark,
                    foregroundColor: white,
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),

                  /// text register with
                  const TextRegisterWidget(
                    child: Text('Or Login with'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  /// register with platform
                  /// show dialog
                  PlatformLogin(
                    facebookOnTap: () {
                      _showDialog();
                    },
                    googleOnTap: () {
                      _showDialog();
                    },
                    appleOnTap: () {
                      _showDialog();
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  ///login button
                  TextHaveAccount(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    text: 'Don\'t have an account ? ',
                    child: const Text(
                      'Register Now',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// email
  Widget _emailTextField() {
    return TextFromFields(
      obscureText: false,
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      validator: (email) {
        if (email == null || email.isEmpty) {
          return 'Email cannot be empty';
        } else if (!EmailValidator.validate(email)) {
          return 'Please enter the correct email !';
        }

        return null;
      },
    );
  }

  /// password
  Widget _passwordTextField() {
    return TextFromFields(
      hintText: 'Password',
      controller: _passwordController,
      obscureText: scurePassword ? true : false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password cannot be empty';
        } else if (value.length < 4) {
          return 'Must be more than 4 characters';
        }
        return null;
      },
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            scurePassword = !scurePassword;
          });
        },
        icon: scurePassword
            ? Icon(CupertinoIcons.eye, color: darkGrey)
            : Icon(CupertinoIcons.eye_slash, color: darkGrey),
      ),
    );
  }

  /// show dialog
  Future _showDialog() {
    return showDialogWidget(context, 'This fiture will be Comming Soon !',  'Cooming Soon');
  }
}
