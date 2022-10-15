import 'package:flutter/material.dart';
import 'package:praktik/services/dio.dart';
import 'package:praktik/services/user_model.dart';
import 'package:praktik/widget/button_widget.dart';
import 'package:praktik/widget/text_form_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController(text: '');
  final _jobController = TextEditingController(text: '');

  var output = '';
  // UserModel user = UserModel();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _jobController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// text field
              TextFormWidget(
                label: const Text('Name'),
                controller: _nameController,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormWidget(
                label: const Text('Job'),
                controller: _jobController,
              ),
              const SizedBox(
                height: 10,
              ),

              /// button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// get
                  ButtonWidget(
                    onPressed: () async {
                      // output = await DioServices().fetchUser();

                      UserModel? users = await DioServices().fetchUser();

                      var userData = '${users!.data}';

                      output = userData;

                      setState(() {});
                    },
                    child: const Text('GET'),
                  ),

                  /// post
                  ButtonWidget(
                    onPressed: () async {
                      output = await DioServices().createUser(
                          name: _nameController.text, job: _jobController.text);
                      setState(() {});
                      _nameController.clear();
                      _jobController.clear();
                    },
                    child: const Text('POST'),
                  ),

                  /// put
                  ButtonWidget(
                    onPressed: () async {
                      output = await DioServices().updateUser(
                          name: _nameController.text, job: _jobController.text);
                      setState(() {});
                      _nameController.clear();
                      _jobController.clear();
                      setState(() {});
                    },
                    child: const Text('PUT'),
                  ),

                  /// delete
                  ButtonWidget(
                    onPressed: () async {
                      output = await DioServices().deleteUser();
                      setState(() {});
                    },
                    child: const Text('DELETE'),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              /// hasil
              const Text(
                'Result',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                output ,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
