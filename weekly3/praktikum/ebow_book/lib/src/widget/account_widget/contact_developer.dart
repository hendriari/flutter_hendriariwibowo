import 'package:ebow_book/src/model/model/user_model.dart';
import 'package:ebow_book/src/utils/color.dart';
import 'package:ebow_book/src/view_model/account_view_model/account_view_model.dart';
import 'package:ebow_book/src/widget/widget/common_header.dart';
import 'package:ebow_book/src/widget/widget/button_widget.dart';
import 'package:ebow_book/src/widget/widget/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ContactDeveloperPage extends StatefulWidget {
  const ContactDeveloperPage({Key? key}) : super(key: key);

  @override
  State<ContactDeveloperPage> createState() => _ContactDeveloperPageState();
}

class _ContactDeveloperPageState extends State<ContactDeveloperPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _textBoxController = TextEditingController();

  late GlobalKey<FormState> _key;

  late bool newUser;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey();
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _textBoxController.dispose();
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
            const CommonHeader(
              title: 'Contact Developer',
            ),

            /// konten
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),

                    Row(
                      children: [
                        ///first name textfield
                        Flexible(
                          fit: FlexFit.tight,
                          child: _firstNameTextField(),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        /// last name textfield
                        Flexible(
                          fit: FlexFit.tight,
                          child: _lastNameTextField(),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    /// email textfield
                    _emailTextField(),
                    const SizedBox(
                      height: 15,
                    ),

                    /// password textfield
                    _boxTextField(),
                    const SizedBox(
                      height: 30,
                    ),

                    /// button
                    ButtonWidget(
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          submitDialogWidget(context);
                        }
                      },
                      sizeWidth: double.infinity,
                      backgroundColor: MyColor.dark,
                      foregroundColor: MyColor.white,
                      child: Text(
                        'Kirim',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),

                    const SizedBox(
                      height: 35,
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

  /// nama depan
  Widget _firstNameTextField() {
    return TextFromFields(
      hintText: 'Nama depan',
      obscureText: false,
      maxLines: 1,
      controller: _firstNameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field tidak boleh kosong !';
        }
        return null;
      },
    );
  }

  /// nama belakang
  Widget _lastNameTextField() {
    return TextFromFields(
      hintText: 'Nama belakang',
      obscureText: false,
      maxLines: 1,
      controller: _lastNameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field tidak boleh kosong !';
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
          return 'Email tidak boleh kosong !';
        }
        return null;
      },
    );
  }

  /// saran field
  Widget _boxTextField() {
    return TextFromFields(
      hintText: 'Masukkan saran Anda',
      keyboardType: TextInputType.multiline,
      maxLines: null,
      minLines: 5,
      textInputAction: TextInputAction.done,
      controller: _textBoxController,
      obscureText: false,
      validator: (value) {
        if (value!.length < 10) {
          return 'Saran setidaknya 10 karakter';
        }
        return null;
      },
    );
  }

  Future submitDialogWidget(BuildContext context) {
    final notifactionProvider =
        Provider.of<AccountViewModel>(context, listen: false);
    return showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              'Anda sudah yakin ?',
              style: Theme.of(context).textTheme.headline6,
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama : ${_firstNameController.text} ${_lastNameController.text}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Email : ${_emailController.text}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Saran : ${_textBoxController.text}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  'Kembali',
                  style: TextStyle(color: MyColor.errorColor),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: Text(
                  'Kirim',
                  style: TextStyle(color: MyColor.primaryColor),
                ),
                onPressed: () {
                  final sendNotification = NotificationModel(
                    namaDepan: _firstNameController.text,
                    namaBelakang: _lastNameController.text,
                    email: _emailController.text,
                    saran: _textBoxController.text,
                  );

                  notifactionProvider.createNotification(sendNotification);

                  Fluttertoast.showToast(
                      msg: 'Terimakasih, saran berhasil dikirim',
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 2,
                      backgroundColor: MyColor.primaryColor,
                      textColor: MyColor.white,
                      fontSize: 16.0);
                  _firstNameController.clear();
                  _lastNameController.clear();
                  _emailController.clear();
                  _textBoxController.clear();

                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
