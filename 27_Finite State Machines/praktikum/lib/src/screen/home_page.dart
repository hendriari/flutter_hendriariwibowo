import 'package:flutter/material.dart';
import 'package:praktikum/src/util/finit_state.dart';
import 'package:praktikum/src/view_model/home_view_model.dart';
import 'package:praktikum/src/widget/home_page_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var userData = Provider.of<UserViewModel>(context, listen: false);
      await userData.getUsersData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finit State'),
      ),
      body: Consumer<UserViewModel>(builder: (context, users, _) {
        if (users.state == UserFinitState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (users.state == UserFinitState.success) {
          return const HomePageWidget();
        } else if (users.state == UserFinitState.error) {
          return const Center(
            child: Text('gagal load data'),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
