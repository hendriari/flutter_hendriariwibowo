import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktik/common/color.dart';
import 'package:praktik/data/user_model.dart';
import 'package:praktik/data/user_provider.dart';
import 'package:praktik/presentation/home_page.dart';
import 'package:praktik/presentation/landing_page.dart';
import 'package:praktik/presentation/login_page.dart';
import 'package:praktik/widget/alert_dialog.dart';
import 'package:praktik/widget/back_button_widget.dart';
import 'package:praktik/widget/button_widget.dart';
import 'package:praktik/widget/platform_login.dart';
import 'package:praktik/widget/text_from_fields.dart';
import 'package:praktik/widget/text_have_account.dart';
import 'package:praktik/widget/text_register_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _numberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordValidation = TextEditingController();

  late GlobalKey<FormState> _key;
  late SharedPreferences loginData;

  late bool newUser;
  bool scurePassword1 = true;
  bool scurePassword2 = true;

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
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordValidation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
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
                    'Hello! Register to get started',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  ///username textfield
                  _usernameTextField(),
                  const SizedBox(
                    height: 15,
                  ),

                  /// nomor telepon textfield
                  _numberTextField(),
                  const SizedBox(
                    height: 15,
                  ),

                  /// email textfield
                  _emailTextField(),
                  const SizedBox(
                    height: 15,
                  ),

                  /// password textfield
                  _passwordTextField(),
                  const SizedBox(
                    height: 15,
                  ),

                  /// validasi password
                  _passwordValidationTextField(),
                  const SizedBox(
                    height: 30,
                  ),

                  /// button
                  ButtonWidget(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        loginData.setBool('login', false);

                        final user = UserModel(
                          username: _usernameController.text,
                          telephone: _numberController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        await userProvider.setNewUsers(users: user);

                        if (!mounted) return;
                        Navigator.of(context).pushAndRemoveUntil(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondAnimation) =>
                                      const HomePage(),
                              transitionDuration:
                                  const Duration(milliseconds: 1200),
                              transitionsBuilder:
                                  (context, animation, secondAnimation, child) {
                                const begin = Offset(0.0, 1.0);
                                const end = Offset.zero;
                                const curve = Curves.linearToEaseOut;

                                var tween = Tween(begin: begin, end: end).chain(
                                  CurveTween(curve: curve),
                                );

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                            (route) => false);
                      }
                    },
                    sizeWidth: double.infinity,
                    backgroundColor: dark,
                    foregroundColor: white,
                    child: Text(
                      'Register',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),

                  const SizedBox(
                    height: 35,
                  ),

                  /// text register with
                  const TextRegisterWidget(
                    child: Text('Or Register with'),
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
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    text: 'Already have an account ?',
                    child: const Text(
                      'Login Now',
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

  /// username
  Widget _usernameTextField() {
    return TextFromFields(
      hintText: 'Username',
      obscureText: false,
      controller: _usernameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username cannot be empty';
        }
        if (value.length < 4) {
          return 'Must be more than 4 characters';
        }
        return null;
      },
    );
  }

  /// nomor telepon
  Widget _numberTextField() {
    return TextFromFields(
      hintText: 'Telephone',
      obscureText: false,
      controller: _numberController,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Telephone cannot be empty';
        }
        return null;
      },
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
      obscureText: scurePassword1 ? true : false,
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
            scurePassword1 = !scurePassword1;
          });
        },
        icon: scurePassword1
            ? Icon(CupertinoIcons.eye, color: darkGrey)
            : Icon(CupertinoIcons.eye_slash, color: darkGrey),
      ),
    );
  }

  /// validasi password
  Widget _passwordValidationTextField() {
    return TextFromFields(
      hintText: 'Confirm Password',
      obscureText: scurePassword2 ? true : false,
      controller: _passwordValidation,
      validator: (value) {
        if (value != _passwordController.text) {
          return 'Password must be the same';
        } else if (value == null || value.isEmpty) {
          return 'Password cannot be empty';
        } else if (value.length < 4) {
          return 'Must be more than 4 characters';
        }
        return null;
      },
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            scurePassword2 = !scurePassword2;
          });
        },
        icon: scurePassword2
            ? Icon(CupertinoIcons.eye, color: darkGrey)
            : Icon(CupertinoIcons.eye_slash, color: darkGrey),
      ),
    );
  }

  /// show dialog
  Future _showDialog() {
    return showDialogWidget(
        context, 'This fiture will be Comming Soon !', 'Cooming Soon');
  }
}
