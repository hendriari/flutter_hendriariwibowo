import 'package:flutter/material.dart';
import 'package:praktikum/src/model/api/user_api.dart';
import 'package:praktikum/src/model/model/user_model.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
        future: UserApi().fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final value = snapshot.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(value.avatar!),
                      ),
                      title: Text('${value.firstName!} ${value.lastName!}'),
                      subtitle: Text(value.email!),
                    );
                  }),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
