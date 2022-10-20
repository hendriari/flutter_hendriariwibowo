import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktikum/util/color.dart';
import 'package:praktikum/widget/account_widget/common_header.dart';
import 'package:praktikum/widget/widget/button_widget.dart';
import 'package:praktikum/widget/widget/have_account_text.dart';
import 'package:praktikum/widget/widget/text_field_widget.dart';

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

  late bool newUser;
  bool scurePassword1 = true;
  bool scurePassword2 = true;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey();
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
    return Scaffold(
      backgroundColor: MyColor.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            /// header
            const CommonHeader(title: 'Register',),

            /// konten
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      onPressed: () async {},
                      sizeWidth: double.infinity,
                      backgroundColor: MyColor.dark,
                      foregroundColor: MyColor.white,
                      child: Text(
                        'Daftar',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),

                    const SizedBox(
                      height: 35,
                    ),

                    ///login button
                    TextHaveAccount(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'Sudah punya akun ?',
                      child: const Text(
                        'Masuk',
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
          ],
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
      maxLines: 1,
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
            ? Icon(CupertinoIcons.eye, color: MyColor.darkGrey)
            : Icon(CupertinoIcons.eye_slash, color: MyColor.darkGrey),
      ),
    );
  }

  /// validasi password
  Widget _passwordValidationTextField() {
    return TextFromFields(
      hintText: 'Confirm Password',
      maxLines: 1,
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
            ? Icon(CupertinoIcons.eye, color: MyColor.darkGrey)
            : Icon(CupertinoIcons.eye_slash, color: MyColor.darkGrey),
      ),
    );
  }
}
