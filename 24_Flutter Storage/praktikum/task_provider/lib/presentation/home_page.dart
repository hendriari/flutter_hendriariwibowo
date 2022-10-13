import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:praktik/common/color.dart';
import 'package:praktik/data/user_model.dart';
import 'package:praktik/data/user_provider.dart';
import 'package:praktik/presentation/login_page.dart';
import 'package:praktik/widget/alert_dialog.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: FutureBuilder(
                  future: userProvider.getUserData(),
                  builder: (context, snapshot) {
                    late final UserModel user = snapshot.data!;
                    if (snapshot.hasData) {
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
                                        user.username,
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
                                        user.email,
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
                                          Text('Username : ${user.username}'),
                                          Text('Telephone : ${user.telephone}'),
                                          Text('Email : ${user.email}'),
                                          Text('Password : ${user.password}'),
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
                                                .read<UserProvider>()
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
                    } else {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              FontAwesomeIcons.faceSadCry,
                              size: 150,
                            ),
                            Text('SORRY, PAGE NOT FOUND'),
                          ],
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
