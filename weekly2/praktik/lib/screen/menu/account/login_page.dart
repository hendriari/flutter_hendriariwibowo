import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praktik/screen/menu/account/register_page.dart';
import 'package:praktik/util/about_us.dart';
import 'package:praktik/util/color.dart';
import 'package:praktik/widget/button_widget.dart';
import 'package:praktik/widget/dialog_widget.dart';
import 'package:praktik/widget/have_account_text.dart';
import 'package:praktik/widget/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late GlobalKey<FormState> _key;

  late bool newUser;
  bool scurePassword = true;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: SizedBox(
          height: sizeHeight,
          width: sizeWidth,
          child: Stack(
            children: [

              /// header
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
                height: 180,
                width: sizeWidth,
                decoration: BoxDecoration(
                  color: MyColor.primaryColor,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ebow Academy',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: MyColor.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 195,
                        alignment: Alignment.centerRight,
                        child: Text(
                          'v 1.0.1',
                          style: TextStyle(color: MyColor.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// konten
              Positioned(
                top: 140,
                child: Container(
                  height: sizeHeight,
                  width: sizeWidth,
                  decoration: BoxDecoration(
                    color: MyColor.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),

                          ///text opening
                          Text(
                            'Login',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          /// email textfield
                          _emailTextField(),
                          const SizedBox(
                            height: 15,
                          ),

                          /// password textfield
                          _passwordTextField(),
                          const SizedBox(
                            height: 50,
                          ),

                          /// button
                          ButtonWidget(
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                showDialogWidget(
                                    context,
                                    'Fitur login pada Weekly Task 2',
                                    'Segera Hadir');
                              }
                            },
                            sizeWidth: double.infinity,
                            backgroundColor: MyColor.dark,
                            foregroundColor: MyColor.white,
                            child: Text(
                              'Masuk',
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          ///login button
                          TextHaveAccount(
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ),
                              );
                            },
                            text: 'Belum punya akun ? ',
                            child: const Text(
                              'Daftar',
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

              /// about us
              const AboutUs(),
            ],
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
          return 'Email tidak boleh kosong';
        } else if (!EmailValidator.validate(email)) {
          return 'Masukkan email dengan benar !';
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
      maxLines: 1,
      obscureText: scurePassword ? true : false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password tidak boleh kosong';
        } else if (value.length < 4) {
          return 'Harus lebih dari 4 karakter !';
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
            ? Icon(CupertinoIcons.eye, color: MyColor.darkGrey)
            : Icon(CupertinoIcons.eye_slash, color: MyColor.darkGrey),
      ),
    );
  }
}
