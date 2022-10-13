import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_bloc/common/color.dart';
import 'package:task_bloc/data/bloc/user_bloc.dart';
import 'package:task_bloc/data/bloc/user_state.dart';
import 'package:task_bloc/presentation/landing_screen/login_page.dart';
import 'package:task_bloc/widget/alert_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences loginData;
  late String username;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    if(mounted)return;
    context.read<UserBloc>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<UserBloc>().logout();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));


            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state){
          if(state is SuccessState){
            return Column(
              children: [
                /// header account
                Card(
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                          AssetImage('assets/images/user.jpg'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.users.username,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                  color: white,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              state.users.email,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            showDialogWidget(
                                context,
                                'This fiture will be Comming Soon !',
                                'Cooming Soon !');
                          },
                          icon: Icon(
                            FontAwesomeIcons.pencil,
                            color: white,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// detail account
                InkWell(
                  onTap: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text('Your Detail Account'),
                            content: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text('Username : ${state.users.username}'),
                                Text('Telephone : ${state.users.telephone}'),
                                Text('Email : ${state.users.email}'),
                                Text('Password : ${state.users.password}'),
                              ],
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: Text(
                                  'Ok',
                                  style:
                                  TextStyle(color: primaryColor),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  },
                  child: Card(
                    color: white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: border,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FontAwesomeIcons.userTie,
                              color: dark.withOpacity(.5),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                'My Account',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5,
                              ),
                              const Text('Show detal account')
                            ],
                          ),
                          const Spacer(),
                          Icon(
                            CupertinoIcons.arrowtriangle_right,
                            color: outlineBorder,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// logout
                InkWell(
                  onTap: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title:
                            const Text('Are you sure to exit ?'),
                            actions: [
                              CupertinoDialogAction(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: errorColor),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text(
                                  'Ok',
                                  style:
                                  TextStyle(color: primaryColor),
                                ),
                                onPressed: () {
                                  context
                                      .read<UserBloc>()
                                      .logout();
                                  Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                          const LoginPage()));
                                },
                              ),
                            ],
                          );
                        });
                  },
                  child: Card(
                    color: white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: border,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FontAwesomeIcons.rightFromBracket,
                              color: dark.withOpacity(.5),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Log Out',
                            style:
                            Theme.of(context).textTheme.headline5,
                          ),
                          const Spacer(),
                          Icon(
                            CupertinoIcons.arrowtriangle_right,
                            color: outlineBorder,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }
          return const Text('');
        },
      )
    );
  }
}
