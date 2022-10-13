import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_bloc/common/color.dart';
import 'package:task_bloc/data/bloc/user_bloc.dart';
import 'package:task_bloc/presentation/home_screen/home_page.dart';
import 'package:task_bloc/presentation/landing_screen/login_page.dart';
import 'package:task_bloc/presentation/landing_screen/register_page.dart';
import 'package:task_bloc/widget/button_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late SharedPreferences loginData;
  late bool login;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    login = loginData.getBool('login') ?? true;

    if (login == false) {
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false);
    }
    // context.read<UserBloc>().checkUserLogin(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[primaryColor, white],
                      )),
                ),
                SizedBox(
                  child: SafeArea(
                    child: Lottie.asset('assets/lottie/gym.json'),
                  ),
                ),
              ],
            ),
            const Icon(
              FontAwesomeIcons.dumbbell,
              size: 35,
            ),
            RichText(
              text: TextSpan(
                text: 'Ebow',
                style: Theme.of(context).textTheme.headline4,
                children: const <TextSpan>[TextSpan(text: 'GYM')],
              ),
            ),
            const SizedBox(
              height: 35,
            ),

            /// login button
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                sizeWidth: double.infinity,
                backgroundColor: dark,
                child: const Text('Login'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            /// register button
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                borderSide: BorderSide(
                  color: border,
                ),
                sizeWidth: double.infinity,
                backgroundColor: white,
                foregroundColor: dark,
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
